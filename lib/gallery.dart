import 'dart:typed_data';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'drawer.dart';
import 'imageholder.dart';

class GalleryPageRoute extends CupertinoPageRoute {
	GalleryPageRoute()
		: super(builder: (BuildContext context) => new GalleryPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new GalleryPage());
	}
} 

class GalleryPage extends StatelessWidget {

  Widget makeImagesGrid(){
    Future getCount(DocumentReference doc) async{
      var data;
      await doc.get().then((d){
        data = d.data;
      });
      print(data);
      return data;
    }
    return FutureBuilder(
      future: getCount(Firestore.instance.collection('count').document('gallery')),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
               
               return Center(
                 child: Text("Loading..."),
               );
              }
        else{
        return GridView.builder(
        itemCount: snapshot.data['count'],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
        return ImageGridItem(index+1);
      });
      }}
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
              ),
              expandedHeight: 125.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(EvaIcons.arrowIosBack),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Qanelas',
                        fontSize: 25.0,
                      )),
                  // background: Image.network(
                  //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  //   fit: BoxFit.cover,
                  // )
                ),
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: makeImagesGrid(),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {

  Uint8List imageFile;
  DetailScreen({Key key, @required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey
            ),
            child: Hero(
              tag: 'imageHero',
              child: Image.memory(
                      imageFile,
                      fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {

  int _index;
  bool _isClicked;
  ImageGridItem(int index){
    this._index = index;
    this._isClicked = false;
  }
  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {

  Uint8List imageFile;
  StorageReference photosReference = FirebaseStorage.instance.ref().child("photos");

  getImage(){
    if(!requestedIndexes.contains(widget._index)){
      int MAX_SIZE = 7*1024*1024;
      photosReference.child("image_${widget._index}.jpg").getData(MAX_SIZE).then((data){
        this.setState((){
          imageFile = data;
        });
        imageData.putIfAbsent(widget._index, (){
          return data;
        });
      }).catchError((error){
        debugPrint(error.toString());
      });
      requestedIndexes.add(widget._index);
    }
  }
  Widget decideGridFileWidget(){
    if(imageFile==null){
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen(imageFile: imageFile);
            }));
          },

          child: Container(
            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey
            ),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(10.0),
              child: Image.memory(
                imageFile,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState(){
    super.initState();
    if(!imageData.containsKey(widget._index)){
      getImage();
    } else {
      this.setState((){
        imageFile = imageData[widget._index];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridFileWidget());
  }
}

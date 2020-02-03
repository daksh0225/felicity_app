import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:carousel_slider/carousel_slider.dart';

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
    return GridView.builder(
    itemCount: 12,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return ImageGridItem(index+1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: Container(
        child: makeImagesGrid(),
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
          child: Hero(
            tag: 'imageHero',
            child: Image.memory(
                    imageFile,
                    fit: BoxFit.cover,
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
      // Size size = MediaQuery.of(context).size;
      return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(imageFile: imageFile);
                        }));
                      },

                      child: Image.memory(
                        imageFile,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );

      // return Image.memory(imageFile,fit: BoxFit.cover);
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

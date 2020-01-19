import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'imageholder.dart';

class SponsorPageRoute extends CupertinoPageRoute {
	SponsorPageRoute()
		: super(builder: (BuildContext context) => new SponsorPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new SponsorPage());
	}
}

class SponsorPage extends StatelessWidget {
  builder(int index, DocumentSnapshot document){
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(document.data['Title']),
            SponsorItem(document.data['Index'])
          ],
        ),
      ),
    );
  }
  Widget makeSponsorsList(){
    return StreamBuilder(
      stream: Firestore.instance.collection('sponsors').orderBy('Index').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: SpinKitCubeGrid(color: Colors.black,
            size: 25.0,),
          );
        }
        return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => builder(index, snapshot.data.documents[index]),
              // Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // children: <Widget>[

              // ],
        );
      },
    );
    // return ListView.builder(
    // itemCount: 11,
    // itemBuilder: (context, index) {
    //   return SponsorItem(index+1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsors'),
      ),
      body: Container(
        child: makeSponsorsList(),
      ),
    );
  }
}


class SponsorItem extends StatefulWidget {
  int _index;
  SponsorItem(int index){
    this._index = index;
  }

  @override
  _SponsorItemState createState() => _SponsorItemState();
}

class _SponsorItemState extends State<SponsorItem> {

  Uint8List imageFile;
  StorageReference photosReference = FirebaseStorage.instance.ref().child("sponsors");

  getImage(){
    if(!requestedSponsors.contains(widget._index)){
      int MAX_SIZE = 7*1024*1024;
      photosReference.child("image_${widget._index}.png").getData(MAX_SIZE).then((data){
        this.setState((){
          imageFile = data;
        });
        sponsorImage.putIfAbsent(widget._index, (){
          return data;
        });
      }).catchError((error){
        debugPrint(error.toString());
      });
      requestedSponsors.add(widget._index);
    }
  }
  Widget decideGridFileWidget(){
    if(imageFile==null){
      return Center(child: CircularProgressIndicator());
    } else {
      return Image.memory(imageFile,fit: BoxFit.cover);
    }
  }

  @override
  void initState(){
    super.initState();
    if(!sponsorImage.containsKey(widget._index)){
      getImage();
    } else {
      this.setState((){
        imageFile = sponsorImage[widget._index];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridFileWidget());
  }
}
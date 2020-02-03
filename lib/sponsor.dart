import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Widget makeSponsorsList(){

    Future getCount(DocumentReference doc) async{
      var data;
      await doc.get().then((d){
        data = d.data;
      });
      print(data);
      return data;
    }
    return FutureBuilder(
      future: getCount(Firestore.instance.collection('count').document('sponsor')),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
               return Center(
                 child: Text("Loading..."),
               );
              }
        else{
        return ListView.builder(
          itemCount: snapshot.data['count'],
          itemBuilder: (context, index) {
          return Card(child: SponsorItem(index+1));
        });
      }}
    );
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
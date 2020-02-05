import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'imageholder.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


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
  var colors = {
      "background": 0xff181a1b,
      "backgroundLite": 0xff575757,
      "appbar": 0xff000000,
      "appbarText": 0xffd4d4d4
    };

  Widget makeSponsorsList(){

    Future getCount(DocumentReference doc) async{
      var data;
      await doc.get().then((d){
        data = d.data;
      });
      return data;
    }
    builder(int index, DocumentSnapshot doc){
        return FutureBuilder(
        future: getCount(Firestore.instance.collection('count').document('sponsor')),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  // child: Text("Loading..."),
                );
                }
          else{
            return Container(
              // elevation: 0,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),

              child: Container(                
                height: MediaQuery.of(context).size.height*0.35,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                color: Color(colors['backgroundLite']),
                borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        doc.data['Title'],
                        // index.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Qanelas'
                        )
                        ),
                      SponsorItem(index+1)
                    ],
                  ),
                ),
              ),
            );
          }
        }
      );
    }
    return StreamBuilder(
      stream: Firestore.instance.collection('sponsors').orderBy('Index').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: SpinKitCubeGrid(color: Colors.white,
            size: 25.0,),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) => builder(index, snapshot.data.documents[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colors['background']),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(colors['appbar']),
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
                  title: Text("Sponsors",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Qanelas',
                        fontSize: 25.0,
                      )),
                ),
            ),
          ];
        },

        body: Container(
          child: makeSponsorsList(),
        ),
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
    if(!sponsorImage.containsKey(widget._index)){
      int MAX_SIZE = 7*1024*1024;
      photosReference.child("image_${widget._index}.png").getData(MAX_SIZE).then((data){
        if(mounted){
          this.setState((){
            imageFile = data;
          });
          sponsorImage.putIfAbsent(widget._index, (){
            return data;
          });
        }
      }).catchError((error){
        debugPrint(error.toString());
      });
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
      if(mounted){
      this.setState((){
        imageFile = sponsorImage[widget._index];
      });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridFileWidget());
  }
}
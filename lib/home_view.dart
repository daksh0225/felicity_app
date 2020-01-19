import 'package:flutter/material.dart';
import 'package:felicity_app/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class HomeViewRoute extends CupertinoPageRoute {
  HomeViewRoute() : super(builder: (BuildContext context) => HomeView());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: HomeView());
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // TODO: make this dynamic
    return upcoming(7);
  }

  Widget upcoming(int day) {
    var date;

    builder(int index, DocumentSnapshot document) {
      print(index);
      print(document.data['date']);
      if (index == 0) {
        date = document.data['date'];
      }
      // print(document.data['date'].toDate().toString()+'hello');
      if (document.data['date'] == date) {
        // print('hello'+ document['name']);
        // date = document.data['date'];
        return Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                document.data['name'],
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        );
      }
      // else{
      //   return Container(
      //     child: Text('nothing to show'),
      //   );
      // }
    }
    // print(DateTime.now().day);

    return StreamBuilder(
        stream: Firestore.instance
            .collection('events-d' + (day - 6).toString())
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.black,
                size: 25.0,
              ),
            );
          }
          // print('hello');
          print(snapshot.data.documents.length);
          return Center(
            child: new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  builder(index, snapshot.data.documents[index]),
            ),
          );
        });
  }
}

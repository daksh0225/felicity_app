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
        return SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('assets/tlt.jpg'), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  document.data['name'],
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      EvaIcons.pin,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 30,),
                  Icon(EvaIcons.clockOutline,
                    // color: Color(0xff50B1FB),
                    color: Color.fromARGB(255, 255, 99, 144),
                  ),
                  Text(DateFormat("HH:mm").format(document.data['date'].toDate()).toString(),
                    style: TextStyle(
                      color: Colors.white
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      EvaIcons.clockOutline,
                      color: Color.fromARGB(255, 255, 99, 144),
                    ),
                    Text(
                      DateFormat("HH:mm")
                          .format(document.data['date'].toDate())
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
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

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              'Upcoming Events',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffd4d4d4),
              ),
            ),
          ),
          decoration: BoxDecoration(
            // color: Color(0xff50B1FB), 
            color: Color.fromARGB(255, 150, 7, 69),
            // color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
        ),
          StreamBuilder(
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
                return Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        builder(index, snapshot.data.documents[index]),
                  ),
                );
              }),
          /*Container(
            height: 400,
            width: MediaQuery.of(context).size.width * 0.85,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Embracing the Curry Culture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Samarkan'),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 7, 69),
                // color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
          ),*/
        ],
      ),
    );
  }
}

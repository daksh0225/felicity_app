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
    return Column(
      children:<Widget>[
        SizedBox(height: MediaQuery.of(context).size.height*0.05),
        Image(
          image: AssetImage('assets/felicity_logo_white.png'),
          height: 100,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.05),
        // Text(
        //   'Embracing the Curry Culture',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //     color: Colors.yellow,
        //     fontFamily: 'Samarkan',
        //     fontSize: 35,
        //   ),
        //   softWrap: true,
        // ),
        upcoming(7),
      ],
    );
  }

  Widget upcoming(int day) {
    var date;
    builder(int index, DocumentSnapshot document) {
      // print(index);
      // print(document.data['Date'].toDate());
      // print(DateTime.now());
      if (index < 5) {
      // print(document.data['date'].toDate().toString()+'hello');
      // if (document.data['date'] == date) {
        // print('hello'+ document['name']);
        // date = document.data['date'];
        return Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.3,
                  image: NetworkImage(document.data['Image Poster Link'])
                )
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
          child: Container(
            // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.all(Radius.circular(20))
              // color: Colors.blue,
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  document.data['Name'],
                  style: TextStyle(
                    fontSize: 25, 
                    color: Colors.white,
                    fontFamily: 'Qanelas'
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                Icon(
                  EvaIcons.pin,
                  color: Colors.red,
                ),
                SizedBox(width: 10,),
                Text(
                  document.data['Venue'],
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      EvaIcons.calendar,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      DateFormat("dd/MM/yyyy")
                          .format(document.data['Date'].toDate())
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 20,),
                    Icon(
                      EvaIcons.clockOutline,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5,),
                    Text(
                      DateFormat("HH:mm")
                          .format(document.data['Date'].toDate().subtract(Duration(minutes: 330)))
                          .toString(),
                      style: TextStyle(color: Colors.white),
                    ),                  
                  ],
                )
              ],
            ),
          ),
        ),
          ],
          ),
        );
      // }
      // else{
      //   return Container(
      //     child: Text('nothing to show'),
      //   );
      }
    }
    // print(DateTime.now().day);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  'Upcoming Events',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Qanelas'
                    // color: Color(0xffff0000),
                  ),
                ),
                Icon(EvaIcons.arrowIosForward,
                  color: Colors.white
                )
              ],
            ),
          // decoration: BoxDecoration(
          //   // color: Color(0xff50B1FB), 
          //   color: Color.fromARGB(255, 150, 7, 69),
          //   // color: Colors.white,
          //   borderRadius: BorderRadius.all(Radius.circular(10))
          // ),
          // margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
        ),
          StreamBuilder(
              stream: Firestore.instance
                  .collection('test')
                  .orderBy('Date').where('Date', isGreaterThan: DateTime.now())
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: SpinKitCubeGrid(
                      color: Colors.white,
                      size: 25.0,
                    ),
                  );
                }
                // print('hello');
                // print(snapshot.data.documents.length);
                return Container(
                  height: 200,
                  margin: EdgeInsets.all(20),
                  child: new Center(
                    child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) =>
                        builder(index, snapshot.data.documents[index]),
                  ),
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

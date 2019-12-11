import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EventsPageRoute extends CupertinoPageRoute {
	EventsPageRoute()
		: super(builder: (BuildContext context) => new EventsPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new EventsPage());
	}
}

class EventsPage extends StatefulWidget {
 @override
 _EventsState createState() {
	 return _EventsState();
 }
}

class _EventsState extends State<EventsPage> {
  int _cIndex = 0;
  PageController controller;
  int currentpage = 0;

  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: true,
      viewportFraction: 0.8,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
    if(_cIndex==1)
    {
      Navigator.of(context).pushNamed('/home');
    }
    else if(_cIndex==2)
    {
      Navigator.of(context).pushNamed('/map');
    }
  }

  Widget _buildList(BuildContext context, DocumentSnapshot document) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(document['name'],
        style: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.w500),
        textAlign: TextAlign.left,
        ),
        SizedBox(height: 20,),
        RaisedButton(
          onPressed: () {},
          child: Text('Register'),
        )
      ],
    );
  }

  Widget event(){

    builder(int index, DocumentSnapshot document) {
      return new AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page - index;
            value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          }

          return new Center(
            child:Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: Curves.easeOut.transform(value) * 150,
                    width: Curves.easeOut.transform(value) * 1000,
                    child: child,
                  ),
                ),
                Center(
                  child: new SizedBox(
                    height: Curves.easeOut.transform(value) * 300,
                    width: Curves.easeOut.transform(value) * 1000,
                    child:Card(
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(document.data['metadata']['info'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, color: Colors.blue,)),
                            ),
                            FloatingActionButton(onPressed: () {},
                            child: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        child: new Card(
          child: Text(document.data['name'],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.white),),
          margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          color: index % 2 == 0 ? Colors.blue : Colors.red,
        ),
      );
    }
    return StreamBuilder(
      stream: Firestore.instance.collection('events').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Text("Loading..");
        }
        return Center(
          child: new Container(
            child: new PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                controller: controller,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => builder(index, snapshot.data.documents[index])),
          ),
        );
      }
    );
    // Firestore.instance.collection('events').snapshots().listen((data) {
    //   data.documents.forEach((document){
    //     print(document.data['name']);
    //     print(document.data['reg_users'].length);
    //     document.data['reg_users'].forEach((docref) => (docref.snapshots().listen((d){
    //       print(d.data['email']);
    //       print(d.data['Name']);
    //     })));
    //   });
    // });
  }
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Events')),
		// body: Center(
		// child: Text('hello'),
		// ),
		drawer:  DrawerWidget(),
    // body: Flex(
      // direction: Axis.vertical,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: <Widget>[
        // Text('hello',
        // ),
        // Event(),
        // StreamBuilder(
        //   stream: Firestore.instance.collection('users').document(email).snapshots(),
        //   builder: (context, snapshot){
        //     if(!snapshot.hasData){
        //       return Text("Loading..");
        //     }
        //     return Center(
        //       child: new Container(
        //         child: new PageView.builder(
        //             onPageChanged: (value) {
        //               setState(() {
        //                 currentpage = value;
        //               });
        //             },
        //             controller: controller,
        //             itemCount: snapshot.data['reg_events'].length,
        //             itemBuilder: (context, index) => builder(index, snapshot.data)),
        //       ),
        //     );
        //   }
        // ),
        // StreamBuilder(
        //   stream: Firestore.instance.collection('users').snapshots(),
        //   builder: (context, snapshot){
        //     // if(!snapshot.hasData){
        //     //   return SpinKitCubeGrid(color: Colors.black,
        //     //     size: 50.0);
        //     // }
        //   }
        // )
      // ],
    // ),
    body: event(),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ),
		);
	}

  // builder(int index, DocumentSnapshot document) {
  //   // Firestore.instance.collection('events').snapshots().listen((data) {
  //   //   data.documents.forEach((document){
  //   //     print(document.data['name']);
  //   //     print(document.data['reg_users'].length);
  //   //     document.data['reg_users'].forEach((docref) => (docref.snapshots().listen((d){
  //   //       print(d.data['email']);
  //   //       print(d.data['Name']);
  //   //     })));
  //   //   });
  //   // });
  //   return new AnimatedBuilder(
  //     animation: controller,
  //     builder: (context, child) {
  //       double value = 1.0;
  //       if (controller.position.haveDimensions) {
  //         value = controller.page - index;
  //         value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
  //       }

  //       return new Center(
  //         child: new SizedBox(
  //           height: Curves.easeOut.transform(value) * 200,
  //           width: Curves.easeOut.transform(value) * 1000,
  //           child: child,
  //         ),
  //       );
  //     },
  //     child: new Card(
  //       child: Text(document.data['reg_events'][0].toString(),
  //       textAlign: TextAlign.center,
  //       style: TextStyle(fontSize: 15, color: Colors.white),),
  //       margin: const EdgeInsets.all(10.0),
  //       color: index % 2 == 0 ? Colors.blue : Colors.red,
  //     ),
  //   );
  // }
 }
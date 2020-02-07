import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Widget _appBarTitle = Text(
    "Events",
    style: TextStyle(
        fontFamily: 'Qanelas',
        // fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(colors["appbarText"])
        // color: Colors.white
        ),
  );
  Icon _searchIcon = Icon(Icons.search);
  _EventsState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

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
    if (_cIndex == 1) {
      Navigator.of(context).pushNamed('/home');
    } else if (_cIndex == 2) {
      Navigator.of(context).pushNamed('/map');
    }
  }

  void addEvent(DocumentSnapshot document, var day) {
    List<DocumentReference> arr1 = [
      Firestore.instance.collection('test').document(document.documentID)
    ];
    List<DocumentReference> arr = [
      Firestore.instance.collection('users').document(email)
    ];
    print(document.documentID);
    Firestore.instance
        .collection('test')
        .document(document.documentID)
        .updateData({"reg_users": FieldValue.arrayUnion(arr)});
    Firestore.instance
        .collection('users')
        .document(email)
        .updateData({"reg_events": FieldValue.arrayUnion(arr1)});
  }

  Widget test(int day) {
    builder(int index, DocumentSnapshot document) {
      return new AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          // if (controller.positions.elementAt(currentpage).haveDimensions) {
          //   value = controller.page - index;
          //   value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          // }
          // controller.positions.forEach((f) {
          //   if(f.haveDimensions){
          //     print('hello1;');
          //     value= controller.page - index;
          //     value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          //   }
          // });
          return new Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new SizedBox(
                    // height: Curves.easeOut.transform(value) * 500,
                    // height: MediaQuery.of(context).size.height * .75,
                    width: MediaQuery.of(context).size.width * .8,
                    // width: Curves.easeOut.transform(value) * 1000,
                    child: Container(
                      // color: Colors.white,
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            // padding: EdgeInsets.all(10.0),
                            // margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  child: Image(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      image: document['Name'] == 'asda'
                                          ? NetworkImage(
                                              document['Image Poster Link'])
                                          : AssetImage(
                                              'assets/event_thumbnail.jpg'),
                                      fit: document['Name'] == 'asda'
                                          ? BoxFit.fill
                                          : BoxFit.fill),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  document['Name'],
                                  style: TextStyle(
                                      fontFamily: 'Qanelas', fontSize: 30),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(Icons.calendar_today),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    // Text(DateFormat("dd-MM-yyyy").format(document['date'].toDate()).toString()),
                                    // SizedBox(
                                    //   width: 30,
                                    // ),
                                    Icon(
                                      EvaIcons.clockOutline,
                                      color: Colors.cyan,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Text(DateFormat("hh:MM:ss").format(document['Date'].toDate()).toString()),
                                    Text(
                                      // document['Date'].toDate().day.toString(),
                                      DateFormat("HH:mm")
                                          .format(document['Date']
                                              .toDate()
                                              .subtract(Duration(minutes: 330)))
                                          .toString(),
                                      style: TextStyle(fontFamily: 'Qanelas'),
                                    ),
                                    // SizedBox(
                                    //   width: 30,
                                    // ),
                                    // Icon(
                                    //   EvaIcons.pin,
                                    //   color: Colors.red,
                                    // ),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    // Text(document['Venue'])
                                  ],
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(Icons.calendar_today),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    // Text(DateFormat("dd-MM-yyyy").format(document['date'].toDate()).toString()),
                                    // SizedBox(
                                    //   width: 30,
                                    // ),
                                    // Icon(Icons.schedule),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    // // Text(DateFormat("hh:MM:ss").format(document['Date'].toDate()).toString()),
                                    // Text(DateFormat("hh:MM:ss").format(document['Date'].toDate()).toString()),
                                    // SizedBox(
                                    //   width: 30,
                                    // ),
                                    Icon(
                                      EvaIcons.pin,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      document['Venue'],
                                      style: TextStyle(fontFamily: 'Qanelas'),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'POC: ',
                                      style: TextStyle(fontFamily: 'Qanelas'),
                                    ),
                                    Text(
                                      document['POCs'][0]['Name'],
                                      style: TextStyle(
                                          fontFamily: 'Qanelas',
                                          color: Colors.blue[100]),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Ph: ',
                                      style: TextStyle(fontFamily: 'Qanelas'),
                                    ),
                                    // SizedBox(width: 20,),
                                    Text(
                                      document['POCs'][0]['Phone'].toString(),
                                      style: TextStyle(
                                          fontFamily: 'Qanelas',
                                          color: Colors.blue[100]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(document['Description'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontFamily: 'Qanelas')),
                                SizedBox(
                                  height: 10,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  heroTag: document['Name'],
                                  // shape: ShapeBorder(),
                                  child: Icon(EvaIcons.plus),
                                  onPressed: () {
                                    FirebaseMessaging()
                                        .subscribeToTopic(document['Name']);
                                    // _firebaseMessaging.subscribeToTopic(document['Name']);
                                    addEvent(document, day);
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "You've registered for this event"),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white38),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
      // }
    }

    var date1, date2;
    if (day == 10) {
      date1 = DateTime.parse("2020-02-" + day.toString() + " 05:31:59");
      date2 = DateTime.parse("2020-02-" + (day+1).toString() + " 05:30:01");
    } else if (day == 9){
      date1 = DateTime.parse("2020-02-0" + day.toString() + " 05:31:59");
      date2 = DateTime.parse("2020-02-0" + (day).toString() + " 23:59:59");
    }
    else {
      date1 = DateTime.parse("2020-02-0" + day.toString() + " 05:31:59");
      date2 = DateTime.parse("2020-02-0" + (day+1).toString() + " 05:30:01");
    }
    return StreamBuilder(
        stream: Firestore.instance
            .collection('test')
            .where('Date', isLessThan: date2)
            .where('Date', isGreaterThan: date1)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // return Text("Loading..");
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.white,
                size: 25.0,
              ),
            );
          }
          if (!(_searchText.isEmpty)) {
            List templist = new List();
            for (int i = 0; i < snapshot.data.documents.length; i++) {
              if (snapshot.data.documents[i]['Name']
                  .toLowerCase()
                  .contains(_searchText.toLowerCase())) {
                templist.add(snapshot.data.documents[i]);
              }
            }
            if (templist.length == 0) {
              return Container(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage('assets/QuizActivity.png'),
                //         fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    'Nothing here :((',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Qanelas',
                        fontSize: 25),
                  ),
                ),
              );
            }
            return Center(
              child: new Container(
                // decoration: BoxDecoration(color: Colors.purple  // image: DecorationImage(
                //     //     image: AssetImage('assets/QuizActivity.png'),
                //     //     fit: BoxFit.cover)
                //     ),
                child: new PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentpage = value;
                      });
                    },
                    controller: controller,
                    itemCount: templist.length,
                    itemBuilder: (context, index) {
                      // print(templist[index].data['Date'].toDate().hour);
                      if (templist[index].data['Date'].toDate().hour < 5 ){
                        if (templist[index].data['Date'].toDate().subtract(Duration(days: 1)).day == day) {
                          // print(templist[index].data['Date'].toDate().subtract(Duration(minutes: 330)).day);
                          return builder(index, templist[index]);
                        }
                      }
                      else{
                        if (templist[index].data['Date'].toDate().subtract(Duration(minutes: 330)).day == day) {
                          // print(templist[index].data['Date'].toDate().subtract(Duration(minutes: 330)).day);
                          return builder(index, templist[index]);
                        }
                      }
                    }),
              ),
            );
          } else {
            return Center(
              child: new Container(
                // decoration:
                //     BoxDecoration(color: Color.fromARGB(255, 200, 50, 100)
                //         // image: DecorationImage(
                //         //     image: AssetImage('assets/QuizActivity.png'),
                //         //     fit: BoxFit.cover)
                //         ),
                child: new PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentpage = value;
                      });
                    },
                    controller: controller,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                        print(snapshot.data.documents[index].data['Date'].toDate().subtract(Duration(days: 1)).day);
                      // if(snapshot.data.documents[index].data['Date'].toDate().day == day){
                        if(snapshot.data.documents[index].data['Date'].toDate().hour < 5){
                          print('hello');
                          snapshot.data.documents[index].data['Date'].toDate().subtract(Duration(days: 1)).subtract(Duration(minutes: 330));
                        print(snapshot.data.documents[index].data['Date'].toDate().subtract(Duration(days: 1)).hour);
                        }
                        else{
                          snapshot.data.documents[index].data['Date'].toDate().subtract(Duration(minutes: 330));
                        }
                      return builder(index, snapshot.data.documents[index]);
                      // }
                    }),
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(filteredNames[1]['name']);
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(slivers: [
        SliverAppBar(
            title: _appBarTitle,
            // title: Text('Events',
            // style: TextStyle(color: Colors.white, fontFamily: 'Qanelas', fontSize: 25),),
            pinned: true,
            floating: true,
            expandedHeight: 120,
            // backgroundColor: Color.fromARGB(255, 242, 205, 203),
            backgroundColor: Color(colors["appbar"]),
            actions: <Widget>[
              IconButton(
                icon: _searchIcon,
                onPressed: _searchPressed,
              ),
            ],
            // iconTheme: IconThemeData(
            //   color: Colors.black
            // ),
            iconTheme: IconThemeData(
              color: Color(colors["appbarText"]),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                    child: Text('Day 1',
                        style: TextStyle(color: Color(colors['appbarText'])))),
                Tab(
                    child: Text('Day 2',
                        style: TextStyle(color: Color(colors['appbarText'])))),
                Tab(
                    child: Text('Day 3',
                        style: TextStyle(color: Color(colors['appbarText'])))),
                Tab(
                    child: Text('All Days',
                        style: TextStyle(color: Color(colors['appbarText'])))),
              ],
            )),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 550.0,
            child: TabBarView(
              children: <Widget>[
                test(7),
                test(8),
                test(9),
                test(10),
              ],
            ),
          ),
        )
      ]),
      //  bottomNavigationBar: BottomNavigationBar(
      //    currentIndex: _cIndex,
      //    // backgroundColor: Colors.black,
      //    items: [
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.event),
      //        title: Text('Events'),
      //      ),
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.home),
      //        title: Text('Home'),
      //      ),
      //      BottomNavigationBarItem(
      //        icon: Icon(Icons.map),
      //        title: Text('Map'),
      //      )
      //    ],
      //    onTap: (index) {
      //      _incrementTab(index);
      //    },
      //  ),
      //),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          autofocus: true,
          style: TextStyle(
            color: Color(colors["appbarText"]),
          ),
          cursorRadius: Radius.circular(2),
          cursorWidth: 2,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            icon: new Icon(Icons.search),
            hintText: 'Search...',
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white54),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = Text(
          "Events",
          style: TextStyle(
            fontFamily: 'Qanelas',
            // fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(colors["appbarText"]),
          ),
        );
        _filter.clear();
      }
    });
  }
}

import 'package:felicity_app/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchedulePageRoute extends CupertinoPageRoute {
  SchedulePageRoute()
      : super(builder: (BuildContext context) => new SchedulePage());

  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new SchedulePage());
  }
}

class SchedulePage extends StatefulWidget {
  @override
  _ScheduleState createState() {
    return _ScheduleState();
  }
}

class _ScheduleState extends State<SchedulePage> {
  Icon _searchIcon = Icon(Icons.search);
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Widget _appBarTitle = Text(
    "Events",
    style: TextStyle(
      fontFamily: 'Samarkan',
      fontSize: 25,
      color: Colors.white,
    ),
  );

  _ScheduleState() {
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

  Widget event(var day) {
    Future getDetails(DocumentReference document) async {
      var data;
      await document.get().then((d) {
        if (d.exists) {
          data = d.data;
        }
      });
      return data;
    }

    builder(int index, DocumentReference document) {
      double value = 1.0;
      return FutureBuilder(
          future: getDetails(document),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //  return Center(
              //    child: Text("Loading..."),
              //  );
              return Container();
            } else {
              // print(snapshot);
              return Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image(
                          image: NetworkImage(snapshot.data['Image Poster Link'])
                        )
                      ),
                    ),
                    Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          // color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Center(
                            child: new SizedBox(
                              // height: Curves.easeOut.transform(value) * 500,
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * .9,
                              // width: Curves.easeOut.transform(value) * 800,
                              // child: Card(
                                child: Flex(
                                  direction: Axis.vertical,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Flex(
                                        direction: Axis.vertical,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          // Image(
                                          //   image: NetworkImage(
                                          //       snapshot.data['Image Poster Link']),
                                          // ),
                                          Text(
                                            snapshot.data['Name'],
                                            style: TextStyle(
                                                fontFamily: 'Qanelas',
                                                fontSize: 30,
                                                color: Colors.white
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Flex(
                                            direction: Axis.horizontal,
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(EvaIcons.pin,
                                              color: Colors.red),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(snapshot.data['Date'].toDate().hour < 5 ? DateFormat("dd/MM/yyyy").format(snapshot.data['Date'].toDate().subtract(Duration(days: 1))).toString() : DateFormat("dd/MM/yyyy").format(snapshot.data['Date'].toDate()).toString(),
                                                style: TextStyle(
                                                  color: Colors.white
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Icon(Icons.schedule,
                                              color: Colors.blue,),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(DateFormat("HH:mm:ss").format(snapshot.data['Date'].toDate().subtract(Duration(minutes: 330))).toString(),
                                                style: TextStyle(
                                                  color: Colors.white
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              // Icon(EvaIcons.pin,
                                              // color: Colors.red,
                                              // ),
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                              // Text(snapshot.data['Venue'])
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          // Text(snapshot.data['Description'],
                                          //     textAlign: TextAlign.center,
                                          //     style: TextStyle(
                                          //         fontSize: 25,
                                          //         color: Colors.white,
                                          //         fontFamily: 'Sacramento')),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // margin:
                                //     const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              );
            }
          });
    }

    return StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document("$email")
            .snapshots(),
        // stream: Firestore.instance.collection('users/'+email+'/').snapshots(),
        builder: (context, snapshot) {
          List regEvent = List();
          // print(snapshot.data);
          if (snapshot.hasData) {
            regEvent = snapshot.data['reg_events'];
            if (regEvent == null) {
            return Center(
              child: Text(
                "Such empty much wow :((",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Qanelas",
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          }
          if (!snapshot.hasData) {
            // return Text("Loading..");
            return Center(
              child: SpinKitCubeGrid(
                color: Colors.white,
                size: 25.0,
              ),
            );
          }
          // if(!(_searchText.isEmpty)){
          //   List templist = new List();
          //   for(int i=0; i< snapshot.data.documents.length; i++){
          //     if(snapshot.data['name'].toLowerCase().contains(_searchText.toLowerCase())){
          //       templist.add(snapshot.data.documents[i]);
          //     }
          //   }
          //   if(templist.length == 0){
          //     return Center(
          //       child: Text('Nothing here :('),
          //     );
          //   }
          return Center(
            child: new Container(
              child: new ListView.builder(
                  // onPageChanged: (value) {
                  //   setState(() {
                  //     currentpage = value;
                  //   });
                  // },
                  // controller: controller,
                  itemCount: regEvent.length,
                  itemBuilder: (context, index) =>
                      builder(index, regEvent[index])),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colors["background"]),
      // appBar: AppBar(
      //   title: _appBarTitle,
      //   // pinned: true,
      //   // floating: true,
      //   // expandedHeight: 120,
      //   backgroundColor: Color(colors["background"]),
      //   // actions: <Widget>[
      //   //   IconButton(
      //   //     icon: _searchIcon,
      //   //     onPressed: _searchPressed,
      //   //   ),
      //   // ],
      // ),
      // body: CustomScrollView(
      // slivers: [
      //   SliverAppBar(
      //     title: _appBarTitle,
      //     pinned: true,
      //     floating: true,
      //     // expandedHeight: 120,
      //     backgroundColor: Colors.black,
      //     actions: <Widget>[
      //       IconButton(
      //         icon: _searchIcon,
      //         onPressed: _searchPressed,
      //       ),
      //     ],
      // bottom: TabBar(
      //   indicatorSize: TabBarIndicatorSize.label,
      //   tabs: <Widget>[
      //     Tab(
      //       text: 'Day 1',
      //     ),
      //     Tab(
      //       text: 'Day 2',
      //     ),
      //     Tab(
      //       text: 'Day 3',
      //     ),
      //   ],
      // )
      // ),
      // SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: 550.0,
      //         // child: TabBarView(
      //         //   children: <Widget>[
      //         child: event('1'),
      //           //   event('2'),
      //           //   event('3'),
      //           // ],
      //         // ),
      //       ),
      //     )
      //   ]
      // ),
      // body: Center(
      //   child: event('1'),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(colors["appbar"]),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
              ),
              expandedHeight: 125.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(EvaIcons.arrowIosBack,
                  color: Color(colors["appbarText"]),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("My Events",
                      style: TextStyle(
                        color: Color(colors["appbarText"]),
                        fontFamily: 'Qanelas',
                        fontSize: 30.0,
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
          child: event('1'),
        ),
      ),
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
            color: Colors.white,
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
            fontFamily: 'Samarkan',
            fontSize: 25,
            color: Colors.white,
          ),
        );
        _filter.clear();
      }
    });
  }
}


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  Widget _appBarTitle = Text("Events",
    style: TextStyle(fontFamily: 'Samarkan',
      fontSize: 50,
      color: Colors.black,
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
    if(_cIndex==1){
      Navigator.of(context).pushNamed('/home');
    }
    else if(_cIndex==2){
      Navigator.of(context).pushNamed('/map');
    }
  }

  void addEvent(DocumentSnapshot document){
    List<DocumentReference> arr1 = [Firestore.instance.collection('events').document(document.documentID)];
    List<DocumentReference> arr = [Firestore.instance.collection('users').document(email)];
    print(document.documentID);
    // print(document['reg_users'].length);
    Firestore.instance.collection('events').document(document.documentID).updateData({
      "reg_users": FieldValue.arrayUnion(arr)
    });
    // print(document['reg_users'].length);
    Firestore.instance.collection('users').document(email).updateData({
      "reg_events":FieldValue.arrayUnion(arr1)
    });
  }
  Widget event(){
    builder(int index, DocumentSnapshot document) {      
      print(document['date'].toDate());
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
                              // margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                              child: Text(document['metadata']['info'],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, color: Colors.blue,)
                              ),
                            ),
                            // Text('Starts in: '+document['date'].toDate().difference(DateTime.now()).toString()),
                            FloatingActionButton(
                              onPressed: () {
                                addEvent(document);
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("You've registered for this event"),
                                    duration: Duration(seconds: 2),
                                  ));
                                },
                              heroTag: document['name'],
                              child: Icon(Icons.add),
                              // child: Text('Register'),
                              // color: Colors.blue[50],
                            ),
                         ],
                       ),
                        margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                     ),
                   ),
                ),
              ],
            ),
          );
        },
        child: new Card(
          child: Text(document['name'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          color: index % 2 == 0 ? Colors.blue : Colors.red,
        ),
      );
    }
    return StreamBuilder(
      stream: Firestore.instance.collection('events').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          // return Text("Loading..");
          return Center(
            child:SpinKitCubeGrid(color: Colors.black,
              size: 25.0,
            ),
          );
        }
        if(!(_searchText.isEmpty)){
          List templist = new List();
          for(int i=0; i< snapshot.data.documents.length; i++){
            if(snapshot.data.documents[i]['name'].toLowerCase().contains(_searchText.toLowerCase())){
              templist.add(snapshot.data.documents[i]);
            }
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
                  itemCount: templist.length,
                  itemBuilder: (context, index) => builder(index, templist[index])),
            ),
          ); 
        }
        else{
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
    }
  );
}
@override
	Widget build(BuildContext context) {
    // print(filteredNames[1]['name']);
	 return DefaultTabController(
     length: 3,
     child: Scaffold(
      drawer:  DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: _appBarTitle,
            pinned: true,
            floating: true,
            expandedHeight: 120,
            backgroundColor: Colors.yellow[700],
            actions: <Widget>[
              IconButton(
                icon: _searchIcon,
                onPressed: _searchPressed,
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                  text: 'Day 1',
                ),
                Tab(
                  text: 'Day 2',
                ),
                Tab(
                  text: 'Day 3',
                ),
              ],
            )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 550.0,
              child: TabBarView(
                children: <Widget>[
                  event(),
                  Center(child: Text('Day 2'),),
                  Center(child: Text('Day 3'),),
                ],
              ),
            ),
          )
        ]
      ),
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
      ),
   );
	}

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = Text("Events",
          style: TextStyle(fontFamily: 'Samarkan',
            fontSize: 50,
            color: Colors.black,
            ),
        );
        _filter.clear();
      }
    });
  }
 }
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
  Widget _appBarTitle = Text("Events",
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

  Widget event(var day){
    Future getDetails(DocumentReference document) async {
      var data;
      await document.get().then((d) {
        if(d.exists){
          // print(d.data);
          data = d.data;
        }
      });
      // print(data);
      return data;
    }
    builder(int index, DocumentReference document) {
      double value = 1.0;
          return FutureBuilder(
            future: getDetails(document),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
               
               return Center(
                 child: Text("Loading..."),
               );
              }
              else{
              print(snapshot);
              return Center(
            child:Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new SizedBox(
                    // height: Curves.easeOut.transform(value) * 500,
                    height: MediaQuery.of(context).size.height *.7,
                    // width: MediaQuery.of(context).size.width * .9,
                    width: Curves.easeOut.transform(value) * 800,
                    child:Card(
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child:Flex(
                                direction: Axis.vertical,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage('assets/felicity_logo.png'),
                                  ),
                                  Text(snapshot.data['name'],
                                    style: TextStyle(
                                      fontFamily: 'Samarkan',
                                      fontSize: 30
                                    ),
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
                                      Icon(Icons.calendar_today),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(DateFormat("dd/MM/yyyy").format(snapshot.data['date'].toDate()).toString()),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(Icons.schedule),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(DateFormat("HH:mm:ss").format(snapshot.data['date'].toDate()).toString()),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(EvaIcons.pin,
                                      color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(snapshot.data['Venue'])    
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(snapshot.data['metadata']['info'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontFamily: 'Sacramento')
                                  ),
                                ],
                              ),
                            ),
                         ],
                       ),
                        margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                     ),
                   ),
                ),
              ],
            ),
          );
          }
        }
      );
    }
    return StreamBuilder(
      stream: Firestore.instance.collection('users').document("$email").snapshots(),
      // stream: Firestore.instance.collection('users/'+email+'/').snapshots(),
      builder: (context, snapshot){
        List regEvent = List();
        // print(snapshot.data);
        if(snapshot.hasData){
          regEvent = snapshot.data['reg_events'];
        }
        if(!snapshot.hasData){
          // return Text("Loading..");
          return Center(
            child:SpinKitCubeGrid(color: Colors.black,
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
                itemBuilder: (context, index) => builder(index, regEvent[index])),
          ),
        ); 
      }
    );
  }

  @override
	Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: _appBarTitle,
            pinned: true,
            floating: true,
            // expandedHeight: 120,
            backgroundColor: Colors.black,
            actions: <Widget>[
              IconButton(
                icon: _searchIcon,
                onPressed: _searchPressed,
              ),
            ],
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 550.0,
              // child: TabBarView(
              //   children: <Widget>[
              child: event('1'),
                //   event('2'),
                //   event('3'),
                // ],
              // ),
            ),
          )
        ]
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
            hintStyle: TextStyle(
              color: Colors.white54
            ),
          ),
          
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = Text("Events",
          style: TextStyle(fontFamily: 'Samarkan',
            fontSize: 25,
            color: Colors.white,
            ),
        );
        _filter.clear();
      }
    });
  }
 }
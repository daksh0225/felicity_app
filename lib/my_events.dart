import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
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

  Widget _appBarTitle = Text("Events",
    style: TextStyle(
      fontFamily: 'Samarkan',
      fontSize: 25,
      color: Colors.white,
    ),
  );

 @override
	Widget build(BuildContext context) {
	//  return Scaffold(
	// // 	 appBar: AppBar(title: Text('Schedule')),
	// 	body: Center(
	// 	  child: Text('hello'),
	// 	),
	// 	);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: _appBarTitle,
            // title: Text('Events',
            // style: TextStyle(color: Colors.white, fontFamily: 'Samarkan', fontSize: 25),),
            pinned: true,
            floating: true,
            expandedHeight: 120,
            backgroundColor: Colors.black,
            // actions: <Widget>[
            //   IconButton(
            //     icon: _searchIcon,
            //     onPressed: _searchPressed,
            //   ),
            // ],
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
                  // event('1'),
                  // event('2'),
                  // event('3'),
                  Center(child: Text('Day 1'),),
                  Center(child: Text('Day 2'),),
                  Center(child: Text('Day 3'),),
                ],
              ),
            ),
          )
        ]
      ),
      ),
    );
	}
 }
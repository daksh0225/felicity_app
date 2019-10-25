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
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Schedule')),
		body: Center(
		child: Text('hello'),
		),
		drawer:  DrawerWidget(),
		);
	}
 }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

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
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Events')),
		body: Center(
		child: Text('hello'),
		),
		drawer:  DrawerWidget(),
		);
	}
 }
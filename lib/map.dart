import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class MapPageRoute extends CupertinoPageRoute {
	MapPageRoute()
		: super(builder: (BuildContext context) => new MapPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new MapPage());
	}
}

class MapPage extends StatefulWidget {
 @override
 _MapState createState() {
	 return _MapState();
 }
}

class _MapState extends State<MapPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Map')),
		body: Center(
		child: Text('hello'),
		),
		drawer:  DrawerWidget(),
		);
	}
 }
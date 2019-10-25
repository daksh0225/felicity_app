import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class AboutPageRoute extends CupertinoPageRoute {
	AboutPageRoute()
		: super(builder: (BuildContext context) => new AboutPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new AboutPage());
	}
}

class AboutPage extends StatefulWidget {
 @override
 _AboutState createState() {
	 return _AboutState();
 }
}

class _AboutState extends State<AboutPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('About')),
		body: Center(
		child: Text('hello'),
		),
		drawer:  DrawerWidget(),
		);
	}
 }
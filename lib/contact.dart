import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class ContactPageRoute extends CupertinoPageRoute {
	ContactPageRoute()
		: super(builder: (BuildContext context) => new ContactPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new ContactPage());
	}
}

class ContactPage extends StatefulWidget {
 @override
 _ContactState createState() {
	 return _ContactState();
 }
}

class _ContactState extends State<ContactPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Contact')),
		body: Center(
		child: Text('hello'),
		),
		drawer:  DrawerWidget(),
		);
	}
 }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class GalleryPageRoute extends CupertinoPageRoute {
	GalleryPageRoute()
		: super(builder: (BuildContext context) => new GalleryPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new GalleryPage());
	}
}

class GalleryPage extends StatefulWidget {
 @override
 _GalleryState createState() {
	 return _GalleryState();
 }
}

class _GalleryState extends State<GalleryPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Gallery')),
		body: Center(
      child: Text('hello'),
      ),
		);
	}
 }
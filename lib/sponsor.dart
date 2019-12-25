import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class SponsorPageRoute extends CupertinoPageRoute {
	SponsorPageRoute()
		: super(builder: (BuildContext context) => new SponsorPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new SponsorPage());
	}
}

class SponsorPage extends StatefulWidget {
 @override
 _SponsorState createState() {
	 return _SponsorState();
 }
}

class _SponsorState extends State<SponsorPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Our Sponsors')),
		body: Center(
		  child: Text('We will release our sponsors soon!!!'),
		),
		// drawer:  DrawerWidget(),
    // bottomNavigationBar: BottomNavigationBar(
    //     // currentIndex: 1,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.event),
    //         title: Text('Events'),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text('Home'),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.map),
    //         title: Text('Map'),
    //       )
    //     ],
    //   ),
		);
	}
 }
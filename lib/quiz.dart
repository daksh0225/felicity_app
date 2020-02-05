import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

class QuizPageRoute extends CupertinoPageRoute {
	QuizPageRoute()
		: super(builder: (BuildContext context) => new QuizPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new QuizPage());
	}
}

class QuizPage extends StatefulWidget {
 @override
 _QuizState createState() {
	 return _QuizState();
 }
}

class _QuizState extends State<QuizPage> {
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Quiz')),
		body: Center(
		child: Text('hello'),
		),
   );
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
		// );
	}
 }
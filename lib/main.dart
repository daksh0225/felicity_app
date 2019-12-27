import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'schedule.dart';
import 'events.dart';
import 'gallery.dart';
import 'about.dart';
import 'contact.dart';
import 'sponsor.dart';
import 'map.dart';
import 'quiz.dart';
import 'drawer.dart';
import 'sign_in.dart';
import 'first_screen.dart';
import 'login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

var x = null;

// void main() => runApp(MyApp());
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(new MyApp());
    });
}
class MyApp extends StatelessWidget {
	final appTitle = 'Drawer Demo';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: appTitle,
			initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/schedule': (context) => SchedulePage(),
        '/events': (context) => EventsPage(),
        '/gallery': (context) => GalleryPage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
        '/sponsor': (context) => SponsorPage(),
        '/map': (context) => MapPage(),
        '/quiz': (context) => QuizPage(),
      },
		);
	}
}

class HomePageRoute extends CupertinoPageRoute {
	HomePageRoute()
		: super(builder: (BuildContext context) => new HomePage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new HomePage());
	}
}
class HomePage extends StatefulWidget {
 @override
 _HomeState createState() {
	 return _HomeState();
 }
}

class _HomeState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Notification> notifications = [];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.red,
            ),
          );
        });
      },
      onLaunch: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.green,
            ),
          );
        });
      },
      onResume: (Map<String, dynamic> notification) async {
        setState(() {
          notifications.add(
            Notification(
              title: notification["notification"]["title"],
              body: notification["notification"]["body"],
              color: Colors.blue,
            ),
          );
        });
      },
    );
    _firebaseMessaging.requestNotificationPermissions();
    // _firebaseMessaging.getToken().then((token) {
    //   print(token);
    // }).catchError((e) {
    //   print(e);
    // });
  }

  int _cIndex = 1;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
    if(_cIndex==0)
    {
      Navigator.of(context).pushNamed('/events');
    }
    else if(_cIndex==2)
    {
      Navigator.of(context).pushNamed('/map');
    }
  }

	@override
	Widget build(BuildContext context) {
		Size size = MediaQuery.of(context).size*0.85;
		return Scaffold(
			appBar: AppBar(
        title: Text('Felicity App',
        style: TextStyle(
            color: Colors.black,
          ),
        ),        
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow[700],
      ),
      // appBar: SliverAppBar(
      //   title: Text('hello'),
      // ),
			// body: Center(child: Text('My Page!')),
      body: ListView(
        children: notifications.map(buildNotification).toList(),
      ),
			drawer: SizedBox(
				width: size.width,				
				child: DrawerWidget(),
			),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ),
		);
	}

  Widget buildNotification(Notification notification) {
    return ListTile(
      title: Text(
        notification.title,
        style: TextStyle(
          color: notification.color,
        ),
      ),
      subtitle: Text(notification.body),
    );
  }

}

class Notification {
  final String title;
  final String body;
  final Color color;
  const Notification(
      {@required this.title, @required this.body, @required this.color});
}




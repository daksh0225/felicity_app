import 'dart:developer';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_events.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'home_view.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:bottom_personalized_dot_bar/bottom_personalized_dot_bar.dart';

var colors = {
  // "background": 0xff181a1b,
  "background": 0xff1e2020,
  "appbar": 0xff000000,
  "appbarText": 0xffd4d4d4,
  "bottomNavActive": 0xfffc0330,
  "bottomNavInActive": 0xff999999
};

var x = null;
// void main() => runApp(MyApp());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.white,
  //   // systemNavigationBarColor: Colors.black,
  //   statusBarIconBrightness: Brightness.dark, // status bar icons' color
  //   systemNavigationBarIconBrightness: Brightness.dark,
  // ));
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
        // '/quiz': (context) => QuizPage(),
      },
    );
  }
}

class HomePageRoute extends CupertinoPageRoute {
  HomePageRoute() : super(builder: (BuildContext context) => new HomePage());

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

  int _cIndex = 0;
  final List<Widget> _children = [HomeView(), EventsPage(), MapPage()];
  final List<String> _appBarTitle = ["Home", "Events", "Map"];

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.subscribeToTopic('event-notifs');
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

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });

    // if (_cIndex == 0) {
    //   Navigator.of(context).pushNamed('/events');
    // } else if (_cIndex == 2) {
    //   Navigator.of(context).pushNamed('/map');
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.85;
    print(_cIndex);
    return Scaffold(
      backgroundColor: Color(colors["background"]),
      // backgroundColor: Color(0xff1e2020),
      // backgroundColor: Colors.white,
      // backgroundColor: Color.fromARGB(255, 12, 13, 13),
      appBar: _cIndex == 1
          ? null
          : AppBar(
              title: Text(
                _appBarTitle[_cIndex],
                style: TextStyle(
                    color: Color(colors["appbarText"]),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Qanelas'),
              ),
              iconTheme: IconThemeData(
                color: Color(colors["appbarText"]),
              ),
              // backgroundColor: Color(0xff55B0F0),
              backgroundColor: Color(colors["appbar"]),
              // backgroundColor: Color.fromARGB(255, 242, 205, 203),
            ),
      // appBar: SliverAppBar(
      //   title: Text('hello'),
      // ),
      // body: Container(
      //   child: Center(
      //     child: Text('hello'),
      //   ),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/QuizActivity.png'),
      //       fit: BoxFit.cover
      //     )
      //   ),
      // ),
      // body: ListView(
      //   children: notifications.map(buildNotification).toList(),
      // ),
      body: _children[_cIndex],
      drawer: SizedBox(
        width: size.width,
        child: DrawerWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          )
        ],
        onTap: (index) {
          _incrementTab(index);
        },
        backgroundColor: Color(colors["appbar"]),
        selectedIconTheme: IconThemeData(
          color: Color(colors["bottomNavActive"]),
        ),
        unselectedIconTheme: IconThemeData(
          color: Color(colors["bottomNavInActive"]),
        ),
        selectedItemColor: Color(colors["bottomNavActive"]),
        unselectedItemColor: Color(colors["bottomNavInActive"]),
      ),
      // bottomNavigationBar: FancyBottomNavigation(
      //   tabs: [
      //       TabData(iconData: Icons.home, title: "Home"),
      //       TabData(iconData: EvaIcons.calendar, title: "Events"),
      //       TabData(iconData: Icons.map, title: "Map")
      //   ],
      //   // context: context,
      //   onTabChangedListener: (index) {
      //     print(index);
      //     _incrementTab(index);
      //   }
      // )
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

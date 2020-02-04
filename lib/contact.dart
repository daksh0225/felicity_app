import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'my_flutter_app_icons.dart';

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
    appBar: AppBar(
      title: Text('Contact',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Lobster',
          // fontWeight: FontWeight.bold,
          fontSize: 25
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    ),
    resizeToAvoidBottomPadding: false,
		body: SingleChildScrollView(
      child: Container(
      color: Color.fromARGB(100, 213, 223, 240),
      alignment: Alignment.center,
      child: Column(
        // direction: Axis.vertical,
        // shrinkWrap: true,
        mainAxisSize: MainAxisSize.max,
        
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('Overall Co-ordinators',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Lobster'
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                // height: 200,
                // width: 100,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Parth Goyal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster'
                          ),),
                          Text("+91-7615023179",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                          Text("parth.goyal@research.iiit.ac.in",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.greenAccent
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                    boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 213, 223, 240),
                        blurRadius: 10,
                        spreadRadius: 2
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                // height: 200,
                // width: 100,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Gayatri Purgilla',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lobster'
                            ),
                          ),
                          Text("+91-9700467692",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                          Text("gayatri.purigilla@research.iiit.ac.in",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.cyanAccent
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                    boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 213, 223, 240),
                        blurRadius: 10,
                        spreadRadius: 2
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
              SizedBox(
                height: 20,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              SizedBox(
                // height: 200,
                // width: 100,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Akanksha Agarwal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster'
                          ),),
                          Text("+91-9560291750",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                          Text("akanksha.agarwal@students.iiit.ac.in",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // color: Colors.white,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.purpleAccent
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                    boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 213, 223, 240),
                        blurRadius: 10,
                        spreadRadius: 2
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                // height: 200,
                // width: 100,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.42,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text('Shashank Gadila',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lobster'
                            ),
                          ),
                          Text("+91-9121446782",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                          Text("shanshank.reddy@research.iiit.ac.in",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.redAccent
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                    boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 213, 223, 240),
                        blurRadius: 10,
                        spreadRadius: 2
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
                height: 20,
              ),

          SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,

                child: Stack( children: <Widget>[
                  Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,

                        children: <Widget>[
                          Text('App Developers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster'
                          ),),
                          Text("Daksh Rawat\nYoogotam Khandelwal\nMayank Musaddi",
                          style: TextStyle(
                            fontSize: 12
                          ),),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                    image: AssetImage("assets/teamphoto.jpeg"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                        BoxShadow(
                        color: Color.fromARGB(255, 213, 223, 240),
                        blurRadius: 10,
                        spreadRadius: 2
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.0),
                        // Colors.grey.withOpacity(0.0),
                        Colors.purpleAccent.withOpacity(0.5)
                      ],
                      stops: [0.0, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                  ),
                ),
                ])
              ),
          Row(children: <Widget>[
            RaisedButton(
            child: Icon(MyFlutterApp.facebook),
            onPressed: _launchFacebookURL,
          ),
          RaisedButton(
            child: Icon(MyFlutterApp.instagram),
            onPressed: _launchInstagramURL,
          ),
          RaisedButton(
            child: Icon(MyFlutterApp.twitter),
            onPressed: _launchTwitterURL,
          ),
          RaisedButton(
            child: Icon(MyFlutterApp.youtube_play),
            onPressed: _launchYoutubeURL,
          ),
          ],)
      ],
    ),
    ),
		),
   );
	}

  _launchFacebookURL() async {
  const url = 'https://www.facebook.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  _launchInstagramURL() async {
  const url = 'https://www.facebook.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  _launchTwitterURL() async {
  const url = 'https://www.facebook.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  _launchYoutubeURL() async {
  const url = 'https://www.facebook.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

}
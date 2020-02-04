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
    var colors = {
      "background": 0xff181a1b,
      "backgroundLite": 0xff575757,
      "appbar": 0xff000000,
      "appbarText": 0xffd4d4d4
    };
	 return Scaffold(
    backgroundColor: Color(colors['background']),
    // resizeToAvoidBottomPadding: false,
    body : NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(colors['appbar']),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
              ),
              expandedHeight: 125.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(EvaIcons.arrowIosBack),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Our Team",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Qanelas',
                        fontSize: 25.0,
                      )),
                ),
            ),
          ];
        },

      body:  SingleChildScrollView(
        
      child: Container(
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
              fontFamily: 'Qanelas',
              color: Color(colors['appbarText'])
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
                        backgroundImage: AssetImage('assets/parth.jpg'),
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
                            fontFamily: 'Qanelas'
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
                        Color(colors['backgroundLite']),
                        Colors.blueGrey
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
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
                        backgroundImage: AssetImage('assets/gayatri.jpg'),
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
                              fontFamily: 'Qanelas'
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
                        Color(colors['backgroundLite']),
                        Colors.blueGrey
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
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
                        backgroundImage: AssetImage('assets/shashank.jpg'),
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
                              fontFamily: 'Qanelas'
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
                        Color(colors['backgroundLite']),
                        Colors.blueGrey
                      ],
                      stops: [0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
                height: 20,
              ),
              Text('App Developers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Qanelas',
              color: Color(colors['appbarText'])
            ),
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
                          // Text('App Developers',
                          // style: TextStyle(
                          //   fontSize: 20,
                          //   fontWeight: FontWeight.bold,
                          //   fontFamily: 'Qanelas'
                          // ),),
                          Text("Daksh Rawat\nYoogottam Khandelwal\nMayank Musaddi",
                          style: TextStyle(
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
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
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color(colors['backgroundLite']).withOpacity(0.0),
                        // Colors.grey.withOpacity(0.0),
                        Colors.deepPurple.withOpacity(0.5)
                      ],
                      stops: [0.0, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                  ),
                ),
                ])
              ),
              SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            FloatingActionButton(
              heroTag: 1,
            backgroundColor: Color(0xff3b5998),
            child: Icon(MyFlutterApp.facebook),
            onPressed: _launchFacebookURL,
          ),
          FloatingActionButton(
            heroTag: 2,
            backgroundColor: Color(0xffdd2a7b),
            child: Icon(MyFlutterApp.instagram),
            onPressed: _launchInstagramURL,
          ),
          FloatingActionButton(
            heroTag: 3,
            child: Icon(MyFlutterApp.twitter),
            onPressed: _launchTwitterURL,
          ),
          FloatingActionButton(
            heroTag: 4,
            backgroundColor: Colors.red,
            child: Icon(MyFlutterApp.youtube_play),
            onPressed: _launchYoutubeURL,
          ),
          ],),
          SizedBox(
            height: 20,
          ),
      ],
    ),
    ),
		),)
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
  const url = 'https://www.instagram.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  _launchTwitterURL() async {
  const url = 'https://mobile.twitter.com/felicity_iiith';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  _launchYoutubeURL() async {
  const url = 'https://www.youtube.com/channel/UC_1vMv4Al_96QgYzkFjh99w?app=desktop';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

}
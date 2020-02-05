import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPageRoute extends CupertinoPageRoute {
  AboutPageRoute() : super(builder: (BuildContext context) => new AboutPage());

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
    var colors = {
      "background": 0xff181a1b,
      "backgroundLite": 0xff575757,
      "appbar": 0xff000000,
      "appbarText": 0xffd4d4d4
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style:  TextStyle(
              color: Color(colors['appbarText']),
              fontFamily: 'Qanelas',
              fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: Icon(EvaIcons.arrowIosBack),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(colors['appbar']),
      ),
      body: Container(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height *2,
          width: MediaQuery.of(context).size.width,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Text('hello'),
              Image(
                image: AssetImage('assets/felicity_logo_white.png'),
                height: 100,
              ),
              // SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:Text(
                    "Felicity is IIIT's annual culture and tech fest. Felicity encompasses and embraces the varied and diverse interests of IIIT with everyone playing a role. \n\n\tFrom nights of music and comedy to code craft and quizzes everybody can explore and engage in their interests.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Qanelas'
                    ),
                    textAlign: TextAlign.left,
                ),
                decoration: BoxDecoration(
                  color: Color(colors['appbar']),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
        colors: [Color(colors['background']), Color(colors['backgroundLite'])], // whitish to gray
        tileMode: TileMode.repeated, // repeats the gradient over the canvas
      ),
    ),
    ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 50.0;
}


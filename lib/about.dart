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
    //  resizeToAvoidBottomPadding: false,
    //  resizeToAvoidBottomInset: false,
		 appBar: AppBar(
       title: Text('About',
        style: TextStyle(
          color: Colors.black,
          // fontFamily: 'Samarkan',
          fontSize: 25  
        ),
      ),
     iconTheme: IconThemeData(
       color: Colors.black
     ),
     backgroundColor: Color.fromARGB(255, 242, 205, 203),
    ),
    resizeToAvoidBottomPadding: false,
    resizeToAvoidBottomInset: false,
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
                image: AssetImage('assets/felicity_logo.png'),
                height: 175,
              ),
              // SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:Text(
                    "Felicity is IIIT's annual culture and tech fest. Held every year at the beginning of the spring semester it is the highlight of an IIITians year and is an event that everybody looks forward to. Felicity encompasses and embraces the varied and diverse interests of IIIT with everyone playing a role. From nights of music and comedy to code craft and quizzes everybody can explore and engage in their interests. Felicity provides the perfect platform to showcase your talents in an otherwise packed academic schedule. The three days of Felicity are packed with fun, merriment, joy and self-discovery.",
                    style: TextStyle(
                      fontSize: 17,
                      // fontFamily: 'Samarkan',
                      // fontWeight: FontWeight.w100,
                      // color: Color.fromARGB(255, 153, 255, 230)
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 200, 50, 100),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        // color: Colors.black,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   end: Alignment.topCenter,
          //   begin: Alignment.bottomCenter,
          //   colors: [
          //     Colors.white,
          //     Colors.black,
          //   ],
          //   stops: [0.02, 0.7]
          // )
          // gradient: RadialGradient(
          //   center: Alignment(-0.5, -0.5),
          //   colors: [
          //     Colors.white,
          //     Colors.black
          //   ],
          //   radius: 0.2,
          //   focalRadius: 1.0,
          //   stops: [0.2, 0.7]
          // )
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
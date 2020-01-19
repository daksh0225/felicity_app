import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
		body: Container(
      alignment: Alignment.center,
      // child: Flex(
      //   direction: Axis.vertical,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.max,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     Text('Our Co-ordinators'),
      //     ListView.builder(
      //       itemCount: 4,
      //       // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //       itemBuilder: (context, image){
      //         return CircleAvatar(
      //           backgroundImage: AssetImage('assets/person.jpg'),
      //           radius: 45,
      //         );
      //       },
      //     )
      //   ],
      // ),
      child: ListView(
        // direction: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          // Card
          Text('Overall Co-ordinators',
          textAlign: TextAlign.center,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold
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
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
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
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold
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
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
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
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
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
            ),
          ),
          RaisedButton(
            child: Icon(EvaIcons.facebook),
            onPressed: _launchURL,
          )
        //   GridView.builder(
        //   itemCount: 4,
        //   shrinkWrap: true,
        //   physics: ScrollPhysics(),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //   itemBuilder: (context, index){
        //     return Image(
        //       image: AssetImage('assets/person.jpg',),
        //       // radius: 2,
        //       // backgroundColor: Colors.transparent,
        //     );
        //     // return Image(
        //     //   image: AssetImage('assets/person.jpg'),
        //     //   fit: BoxFit.cover,
        //     // );
        //   },
        // ),
      ],
    ),
    ),
		);
	}
  _launchURL() async {
  const url = 'https://www.facebook.com/felicity.iiith/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}
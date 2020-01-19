import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';

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
          Text('Our Co-ordinators',
          textAlign: TextAlign.center,),
          GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index){
            return Image(
              image: AssetImage('assets/person.jpg',),
              // radius: 2,
              // backgroundColor: Colors.transparent,
            );
            // return Image(
            //   image: AssetImage('assets/person.jpg'),
            //   fit: BoxFit.cover,
            // );
          },
        ),
      ],
    ),
    ),
		);
	}
}
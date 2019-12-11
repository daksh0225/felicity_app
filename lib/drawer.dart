import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'schedule.dart';
import 'events.dart';
import 'gallery.dart';
import 'about.dart';
import 'contact.dart';
import 'sponsor.dart';
import 'map.dart';
import 'quiz.dart';
import 'sign_in.dart';

class DrawerWidget extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return Drawer(				
			child: ListView(
				padding: EdgeInsets.zero,
				children: <Widget>[
					DrawerHeader(
						// child: Text('\nFelicity',
						// textAlign: TextAlign.center,
						// style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
						// ),
						decoration: BoxDecoration(
							color: Colors.blueAccent,
						),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                  radius: 32,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  // 'daksh',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                // Text(
                //   phnumber,
                //   // 'daksh',
                //   style: TextStyle(
                //       fontSize: 15,
                //       color: Colors.black,
                //       fontWeight: FontWeight.w500),
                //   textAlign: TextAlign.left,
                // ),
                Text(
                  email,
                  // 'daksh0225@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
					),
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text('Home'),
            // onTap: () {
            //   Navigator.of(context).pushNamed('/home');
            // },
          // ),
          ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedule'),
              onTap: () {
                Navigator.of(context).push(new SchedulePageRoute());
              },
            ),
          // ListTile(
          //   leading: Icon(Icons.event),
          //   title: Text('Events'),
          //   onTap: () {
          //     Navigator.of(context).push(new EventsPageRoute());
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Gallery'),
            onTap: () {
              Navigator.of(context).push(new GalleryPageRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).push(new AboutPageRoute());
            },
          ),
          ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.of(context).push(new ContactPageRoute());
              },
            ),
            ListTile(
            leading: Icon(Icons.home),
            title: Text('Sponsors'),
            onTap: () {
              Navigator.of(context).push(new SponsorPageRoute());
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Quiz'),
            onTap: () {
              Navigator.of(context).push(new QuizPageRoute());
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.map),
          //   title: Text('Map'),
          //   onTap: () {
          //     Navigator.of(context).push(new MapPageRoute());
          //   },
          // ),
         ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushNamed('/');
              },
            ),
				],
			),
		);
	}
}
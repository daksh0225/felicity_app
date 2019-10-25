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

class DrawerWidget extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return Drawer(				
			child: ListView(
				padding: EdgeInsets.zero,
				children: <Widget>[
					DrawerHeader(
						child: Text('\nFelicity',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
						),
						decoration: BoxDecoration(
							color: Colors.blue,
						),
					),
          ListTile(
						title: Text('Home',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).pushNamed('/');
						},
					),
					ListTile(
						title: Text('Schedule'
						,textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new SchedulePageRoute());
              // Navigator.of(context).pushNamedAndRemoveUntil('/scchedule', (Route<dynamic> route) => false);
						},
					),
          
					ListTile(
						title: Text('Events',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new EventsPageRoute());
						},
					),
					ListTile(
						title: Text('Gallery',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new GalleryPageRoute());
						},
					),
					ListTile(
						title: Text('About Us',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new AboutPageRoute());
						},
					),
					ListTile(
						title: Text('Contact Us',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new ContactPageRoute());
						},
					),
					ListTile(
						title: Text('Sponsors',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new SponsorPageRoute());
						},
					),
					ListTile(
						title: Text('Quiz',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new QuizPageRoute());
						},
					),
					ListTile(
						title: Text('Map',
						textAlign: TextAlign.center,
						style: TextStyle(fontSize: 20),),
						onTap: () {
							Navigator.of(context).push(new MapPageRoute());
						},
					),
				],
			),
		);
	}
}
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	final appTitle = 'Drawer Demo';

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: appTitle,
			initialRoute: '/',
		routes: {
			'/': (context) => MyHomePage(),
			'/second': (context) => SecondPage(),
		},
		);
	}
}

class MyHomePage extends StatelessWidget {
	final String title;
	MyHomePage({Key key, this.title}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('Hello')),
			body: Center(child: Text('My Page!')),
			drawer: Drawer(
				// Add a ListView to the drawer. This ensures the user can scroll
				// through the options in the drawer if there isn't enough vertical
				// space to fit everything.
				child: ListView(
					// Important: Remove any padding from the ListView.
					padding: EdgeInsets.zero,
					children: <Widget>[
						DrawerHeader(
							child: Text('Drawer Header'),
							decoration: BoxDecoration(
								color: Colors.blue,
							),
						),
						ListTile(
							title: Text('Item 1'),
							onTap: () {
								// Update the state of the app
								// ...
								// Then close the drawer
								Navigator.pushNamed(context,'/second');
								// Navigator.pop(context);
							},
						),
						ListTile(
							title: Text('Item 2'),
							onTap: () {
								// Update the state of the app
								// ...
								// Then close the drawer
								Navigator.pop(context);
							},
						),
					],
				),
			),
		);
	}
}

class SecondPage extends StatefulWidget {
 @override
 _SecondState createState() {
   return _SecondState();
 }
}

class _SecondState extends State<SecondPage> {
 @override
	Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Faulty Manholes')),
    body: Center(
    //   child: RaisedButton(
    //     child: Text('hello'),
    //     onPressed:(){
    //      Navigator.pop(context);
    //     },          
	child: Text('hello'),
   ),
   drawer:  Drawer(
				// Add a ListView to the drawer. This ensures the user can scroll
				// through the options in the drawer if there isn't enough vertical
				// space to fit everything.
				child: ListView(
					// Important: Remove any padding from the ListView.
					padding: EdgeInsets.zero,
					children: <Widget>[
						DrawerHeader(
							child: Text('Drawer Header'),
							decoration: BoxDecoration(
								color: Colors.blue,
							),
						),
						ListTile(
							title: Text('Item 1'),
							// onTap: () {
								// Update the state of the app
								// ...
								// Then close the drawer
								// Navigator.pop(context);
							// },
						),
						ListTile(
							title: Text('Item 2'),
							// onTap: () {
								// Update the state of the app
								// ...
								// Then close the drawer
								// Navigator.pop(context);
							// },
						),
					],
				),
			),
    );
 }
 }
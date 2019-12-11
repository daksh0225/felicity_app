import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageRoute extends CupertinoPageRoute {
	MapPageRoute()
		: super(builder: (BuildContext context) => new MapPage());


	// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
	@override
	Widget buildPage(BuildContext context, Animation<double> animation,
		Animation<double> secondaryAnimation) {
	return new FadeTransition(opacity: animation, child: new MapPage());
	}
}

class MapPage extends StatefulWidget {
 @override
 _MapState createState() {
	 return _MapState();
 }
}

class _MapState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(17.445109, 78.349782);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  int _cIndex = 2;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
    if(_cIndex==0)
    {
      Navigator.of(context).pushNamed('/events');
    }
    else if(_cIndex==1)
    {
      Navigator.of(context).pushNamed('/home');
    }
  }
  static MarkerId markerId = MarkerId("1");

  final Set<Marker> _markers = {
    Marker(
      markerId: markerId,
      position: _center,
      infoWindow: InfoWindow(
        title: 'Custom Marker',
                snippet: 'Inducesmile.com',
      )
    )
  };
 @override
	Widget build(BuildContext context) {
	 return Scaffold(
		 appBar: AppBar(title: Text('Map')),
		// body: Center(
		// child: Text('hello'),
		// ),
    body: GoogleMap(
      markers: _markers,
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 20.0,
      ),
    ),
		drawer:  DrawerWidget(),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ),
		);
	}
 }
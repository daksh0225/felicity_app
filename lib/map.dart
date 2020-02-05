import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class MapPageRoute extends CupertinoPageRoute {
  MapPageRoute() : super(builder: (BuildContext context) => new MapPage());

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

  static const LatLng gate = const LatLng(17.446055, 78.351426);
  static const LatLng bakul = const LatLng(17.448056, 78.348306);
  static const LatLng football = const LatLng(17.446833, 78.348472);
  static const LatLng fg = const LatLng(17.446333, 78.346611);
  static const LatLng obh = const LatLng(17.445056, 78.345972);
  static const LatLng jc = const LatLng(17.445830, 78.347089);
  static const LatLng nbh = const LatLng(17.447083, 78.347528);
  static const LatLng library = const LatLng(17.445775, 78.349228);
  static const LatLng him = const LatLng(17.445667, 78.349194);
  static const LatLng thub = const LatLng(17.445722, 78.348750);
  static const LatLng amphi = const LatLng(17.448028, 78.347913);
  static const LatLng nilgiri = const LatLng(17.447298, 78.348679);

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
  }

  int _cIndex = 2;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
    if (_cIndex == 0) {
      Navigator.of(context).pushNamed('/events');
    } else if (_cIndex == 1) {
      Navigator.of(context).pushNamed('/home');
    }
  }

  static MarkerId markerId = MarkerId("1");

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('gate'),
      position: gate,
      infoWindow: InfoWindow(
        title: 'Main Gate',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('bakul'),
      position: bakul,
      infoWindow: InfoWindow(
        title: 'Bakul Nivas',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('football'),
      position: football,
      infoWindow: InfoWindow(
        title: 'Football Ground',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('fg'),
      position: fg,
      infoWindow: InfoWindow(
        title: 'Felicity Ground',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('obh'),
      position: obh,
      infoWindow: InfoWindow(
        title: 'Old Boys Hostel/ North Mess/ South Mess',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('jc'),
      position: jc,
      infoWindow: InfoWindow(
        title: 'JC/ Guest House',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('nbh'),
      position: nbh,
      infoWindow: InfoWindow(
        title: 'Kadamb Nivas/ Yuktahaar Mess/ Kadamb Mess',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('library'),
      position: library,
      infoWindow: InfoWindow(
        title: 'Library/ Vindhya A6',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('him'),
      position: him,
      infoWindow: InfoWindow(
        title: 'Himalaya',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('thub'),
      position: thub,
      infoWindow: InfoWindow(
        title: 'T-Hub',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('amphi'),
      position: amphi,
      infoWindow: InfoWindow(
        title: 'Amphitheatre',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    Marker(
      markerId: MarkerId('nilgiri'),
      position: nilgiri,
      infoWindow: InfoWindow(
        title: 'Nilgiri',
        // snippet: 'IIIT Hyderabad',
      ),
    ),
    // Marker(
    //   markerId: MarkerId('thub'),
    //   position: thub,
    //   infoWindow: InfoWindow(
    //     title: 'T-Hub',
    //     // snippet: 'IIIT Hyderabad',
    //   ),
    // ),
  };

  String _mapStyle;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString("config/googlemap-config.txt").then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Scaffold(
    //  appBar: AppBar(title: Text('Map')),
    // // body: Center(
    // // child: Text('hello'),
    // // ),
    // body: GoogleMap(
    return GoogleMap(
      markers: _markers,
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: him,
        zoom: 16.0,
      ),
    );
  }
}


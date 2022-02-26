import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reMind/location_service.dart';
//import 'package:googlemaps/location_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(1.3673, 103.84858),
    zoom: 15.4746,
  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Home', snippet: '347 Ang Mo Kio Ave 3, Singapore 560347'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(1.3673, 103.84858),
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(1.3634, 103.8436),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kLakePlex'),
    infoWindow: InfoWindow(
        title: 'Bishan Ang Mo Kio Park',
        snippet: 'You are here'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(1.3634, 103.8436),
  );

  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(1.3673, 103.84858),
        LatLng(1.3634, 103.8436),
      ],
    width: 5,
    color: Colors.redAccent,
  );

  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId('_kPolygon'),
  //   points: [
  //     LatLng(37.42796133580664, -122.085749655962),
  //     LatLng(37.43296265331129, -122.08832357078792),
  //     LatLng(37.418,-122.092),
  //     LatLng(37.435,-122.092),
  //   ],
  //   strokeWidth: 5,
  //   fillColor: Colors.transparent,
  //   strokeColor: Colors.lightBlue,
  //
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Maps')),
      body: Column(
          children:[
            Row(children: [
              Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(hintText: 'Search by City'),
                    onChanged: (value){
                      print(value);
                    },
                  )),
                  IconButton(
                  onPressed: (){
                    LocationService().getPlaceId(_searchController.text);
                  },
                  icon: Icon(Icons.search),
                  ),
                ],
          ),
      Expanded(
        child: GoogleMap(
          mapType: MapType.normal,
          markers: {_kGooglePlexMarker,
            _kLakeMarker,
          },
          polylines: {
            _kPolyline,
          },
          // polygons: {
          //   _kPolygon,
          // },
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      Container(
          width: MediaQuery.of(context).size.width/1.3,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            color: Colors.amber,
          ),
          child: MaterialButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomePage(title: '_MyHomePageState'),
              //   ),
              // );
            },
            child: Text('I am Lost'),
          )
      )
          ],
    ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
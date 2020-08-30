import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  LatLng _initialPosition = LatLng(18.423300,  -33.918861);
  GoogleMapController _controller;
  Location _location = Location();
  Set<Marker> markers={};
  void marker(){
    Marker gramercyMarker = Marker(
      markerId: MarkerId('Bellville'),
      position: LatLng(18.6294, -33.8943),
      infoWindow: InfoWindow(title: 'Bellville'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );

    Marker bernardinMarker = Marker(
      markerId: MarkerId('Belhar'),
      position: LatLng(18.6324, -33.9459),
      infoWindow: InfoWindow(title: 'Belher'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    Marker blueMarker = Marker(
      markerId: MarkerId('Parow'),
      position: LatLng(18.5808, -33.9068),
      infoWindow: InfoWindow(title: 'Parow'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    Set<Marker> markers = {};

//New York Marker
    Marker Cput = Marker(
      markerId: MarkerId('Cput'),
      position: LatLng(18.6406, -33.9324),
      infoWindow: InfoWindow(title: 'Los Tacos'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    Marker Erica = Marker(
      markerId: MarkerId('Erica Square'),
      position: LatLng(18.6276, -33.9415),
      infoWindow: InfoWindow(title: 'Tree Bistro'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    Marker Khayelitsha = Marker(
      markerId: MarkerId('Khayelitsha'),
      position: LatLng(18.6799, -34.0378),
      infoWindow: InfoWindow(title: 'Le Coucou'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    markers.add(Khayelitsha);

  }

  void onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition
          (CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );


    });
  }
  @override
  void initState(){
    marker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:<Widget>[
          GoogleMap(
              initialCameraPosition:
                  CameraPosition(target:_initialPosition,zoom:10),
              onMapCreated: onMapCreated,

              myLocationButtonEnabled: true,
            markers: markers,
          ),

        ],

      ),

    );
  }
}



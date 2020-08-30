import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  LatLng _initialPosition = LatLng(18.423300,  -33.918861);
  GoogleMapController _controller;
  Location _location = Location();
  Set<Marker> markers={};
  void marker(){
    Marker Bellville = Marker(
      markerId: MarkerId('Bellville'),
      position: LatLng( -33.8943, 18.6294),
      infoWindow: InfoWindow(title: 'Bellville'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );

    //Belher location
    Marker Belhar = Marker(
      markerId: MarkerId('Belhar'),
      position: LatLng(-33.9459,18.6324),
      infoWindow: InfoWindow(title: 'Belher'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    // Parow marker
    Marker Parow = Marker(
      markerId: MarkerId('Parow'),
      position: LatLng(-33.9068, 18.5808),
      infoWindow: InfoWindow(title: 'Parow'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );

//cput Marker
    Marker Cput = Marker(
      markerId: MarkerId('Cput'),
      position: LatLng(-33.9324,18.6406),
      infoWindow: InfoWindow(title: 'Cput'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );

    //Erica Marker
    Marker Erica  = Marker(
      markerId: MarkerId('Erica Square'),
      position: LatLng(-33.9415,18.6276),
      infoWindow: InfoWindow(title: 'Erica Square'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );

    //khayelitsha marker
    Marker Khayelitsha = Marker(
      markerId: MarkerId('Khayelitsha'),
      position: LatLng(-34.0378,18.6799),
      infoWindow: InfoWindow(title: 'Khayelitsha'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    setState(() {
      markers.add(Khayelitsha);
      markers.add(Erica);
      markers.add(Bellville);
      markers.add(Cput);
      markers.add(Belhar);
      markers.add(Parow);

    });


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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crime Detector App'),
          backgroundColor: Colors.green[700],
        ),
        body:GoogleMap(
          initialCameraPosition:
          CameraPosition(target:_initialPosition,zoom:10),
          onMapCreated: onMapCreated,
          myLocationEnabled: true,
          compassEnabled: true,
          rotateGesturesEnabled: true,
          markers: markers,

        )
      ),
    );
  }
}

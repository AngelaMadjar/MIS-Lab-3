import 'dart:async';

import 'package:mis_lab3_181010/models/exam.dart';
import 'package:mis_lab3_181010/models/spot.dart';
import 'package:mis_lab3_181010/services/geolocation_service_impl.dart';
import 'package:mis_lab3_181010/geo/geolocation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {

  @override
  State<Mapa> createState() => MapState();
  static const routeName = '/map';
}

class MapState extends State<Mapa> {
  final GeolocationServiceImpl _geolocationServiceImpl = GeolocationServiceImpl();
  List<Spot> spots = [];

  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.35753120580624, -322.182743422953),
    zoom: 12.3562,
  );

  CameraPosition? _currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {
      spots = _geolocationServiceImpl.getSpots();
      _markers = spots
          .where((place) => place.position != null)
          .map((place) => Marker(
        markerId: MarkerId(place.description.hashCode.toString()),
        position: place.position!,
        infoWindow: InfoWindow(title: place.description),
      )).toSet();
    });
    determinePosition()
        .then((position) => setState(() => {
      _currentLocation = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15),
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          markers: _markers,
          mapType: MapType.terrain,
          initialCameraPosition: _currentLocation!,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        )
    );
  }
}
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Spot {

  String description;

  String location;

  String id;

  DateTime start;

  LatLng? position;

  Spot({
    required this.description,
    required this.location,
    required this.id,
    required this.start,
    this.position
  });
}
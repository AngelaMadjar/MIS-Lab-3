import 'package:mis_lab3_181010/models/spot.dart';

abstract class GeolocationService {

  void add(Spot spot);

  void remove(Spot spot);

  List<Spot> getSpots();
}
import 'package:mis_lab3_181010/data/Memory.dart';
import 'package:mis_lab3_181010/models/spot.dart';
import 'package:mis_lab3_181010/services/geolocation_service.dart';

class GeolocationServiceImpl extends GeolocationService {

  static final GeolocationServiceImpl _instance = GeolocationServiceImpl._intrenal();

  factory GeolocationServiceImpl() => _instance;

  GeolocationServiceImpl._intrenal();

  Memory<Spot> places = Memory<Spot>();
  @override
  void add(Spot spot) {
    places.add(spot);
  }

  @override
  List<Spot> getSpots() {
    return places.getItems();
  }

  @override
  void remove(Spot spot) {
    places.remove(spot);
  }
}
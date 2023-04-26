

import '../Interface/GeolocationServiceInterfaces.dart';
import 'package:geolocator/geolocator.dart';


class DefaultGeolocationServiceHelper extends GeolocationServiceHelper {

  @override
  double getDistanceBetweenInKilometers(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitud) {
    return Geolocator.distanceBetween(startLatitude, startLongitude, destinationLongitud, destinationLatitude) / 1000;
  }

  @override
  double getDistanceBetweenInMeters(double startLatitude, double startLongitude, double destinationLatitude, double destinationLongitud) {
    return Geolocator.distanceBetween(startLatitude, startLongitude, destinationLongitud, destinationLatitude);
  }

}
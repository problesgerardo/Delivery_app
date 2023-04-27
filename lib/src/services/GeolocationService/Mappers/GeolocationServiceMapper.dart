

import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceMapper {
  static PositionEntity mapPosition( Position position ) {

    print("Geolocalizacion - Latitud: ${position.latitude}");
    print("Geolocalizacion - Longitud: ${position.longitude}");

    return PositionEntity(
      longitude: position.longitude, 
      latitude: position.latitude, 
      timestamp: position.timestamp, 
      accuracy: position.accuracy, 
      altitude: position.altitude, 
      heading: position.heading, 
      speed: position.speed, 
      speedAccuracy: position.speedAccuracy
    );
  }
}
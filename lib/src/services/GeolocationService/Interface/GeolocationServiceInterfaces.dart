

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class GeolocationService {
  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class GeolocationServiceHelper {
  double getDistanceBetweenInMeters(double startLatitud, double startLongitude, double destinationLatitud, double destinationLongitud);
  double getDistanceBetweenInKilometers(double startLatitud, double startLongitude, double destinationLatitud, double destinationLongitud);
}
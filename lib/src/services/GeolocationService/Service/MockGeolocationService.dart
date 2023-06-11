

import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/services/GeolocationService/Interface/GeolocationServiceInterfaces.dart';
import 'package:delivery_app/src/services/GeolocationService/Mappers/GeolocationServiceMapper.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/GeolocationService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:geolocator/geolocator.dart';

class MockGeolocationService extends GeolocationService {
  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() async {

    final permisionStatus = await getPermissionStatus();
    if( permisionStatus == LocationPermissionStatus.allowed){
      var fakePosition = const Position(
        longitude: -107.394082,
        latitude: 24.808913,
        timestamp: null,
        accuracy: 0.0,
        altitude: 0.0,
        heading: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      );

      return Result.success(GeolocationServiceMapper.mapPosition(fakePosition));

    } else {
      return Future.error(GeolocationFailureMessages.locationPermissionsDenied);
    }
    

  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() async {
    return LocationPermissionStatus.allowed;
  }

}
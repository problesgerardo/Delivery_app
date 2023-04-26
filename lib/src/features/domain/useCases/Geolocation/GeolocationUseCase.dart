

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/useCases/Geolocation/GeolocationUseCaseParameters.dart';
import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/services/GeolocationService/Interface/GeolocationServiceInterfaces.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/GeolocationService.dart';
import 'package:delivery_app/src/services/GeolocationService/Service/GeolocationServiceHelper.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class GeolocationUseCase {

  Future<Result<PositionEntity, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
  Future<double> getDistanceBetweenYourCurrentPosition( Destination destination );
  
}

class DefaultGeolocationUseCase extends GeolocationUseCase {

  //Dependencias
  final GeolocationService _geolocationService;
  final GeolocationServiceHelper _geolocationServiceHelper;

  DefaultGeolocationUseCase({ GeolocationService? geolocationService, GeolocationServiceHelper? geolocationServiceHelper})
    : _geolocationService = geolocationService ?? DefaultGeolocationServices(),
    _geolocationServiceHelper = geolocationServiceHelper ?? DefaultGeolocationServiceHelper();

  @override
  Future<Result<PositionEntity, Failure>> getCurrentPosition() {
    return _geolocationService.getCurrentPosition();
  }

  @override
  Future<double> getDistanceBetweenYourCurrentPosition(Destination destination) async {
    final userPosition = await _geolocationService.getCurrentPosition();

    return _geolocationServiceHelper.getDistanceBetweenInKilometers(
      userPosition.value?.latitude ?? 0.0, 
      userPosition.value?.longitude ?? 0.0, 
      destination.destinationLatitude, 
      destination.destinationLongitude,
    );
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() {
    return _geolocationService.getPermissionStatus();
  }

}
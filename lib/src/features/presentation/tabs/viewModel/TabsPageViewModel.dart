

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';

import '../../../../base/views/BaseView.dart';

import 'package:delivery_app/src/features/domain/useCases/Geolocation/GeolocationUseCase.dart';


abstract class TabsPageViewModelInput {
  Future<Result<bool, Failure>> getCurrentPosition();
  Future<LocationPermissionStatus> getPermissionStatus();
}

abstract class TabsPageViewModel extends TabsPageViewModelInput with BaseViewModel{

}

class DefaultTabsPageViewModel extends TabsPageViewModel {

  //Dependencias
  final GeolocationUseCase _geolocationUseCase;

  DefaultTabsPageViewModel({ GeolocationUseCase? geolocationUseCase })
    : _geolocationUseCase = geolocationUseCase ?? DefaultGeolocationUseCase();

    @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider ;
  }
  
  @override
  Future<Result<bool, Failure>> getCurrentPosition() async {
    return await _geolocationUseCase.getCurrentPosition().then((result){
      switch( result.status ) {
        
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<LocationPermissionStatus> getPermissionStatus() {
    return _geolocationUseCase.getPermissionStatus();
  }

}
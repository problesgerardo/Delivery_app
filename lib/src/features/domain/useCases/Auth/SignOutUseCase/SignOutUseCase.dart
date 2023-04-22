

import 'package:delivery_app/src/base/constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/RemoveLocalStorageUseCase.dart';

abstract class SignOutUseCase {

  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {

  //Dependencias
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({ RemoveLocalStorageUseCase? removeLocalStorageUseCase })
    : _removeLocalStorageUseCase = removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    
    return _removeLocalStorageUseCase.execute(parameters: RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }


}
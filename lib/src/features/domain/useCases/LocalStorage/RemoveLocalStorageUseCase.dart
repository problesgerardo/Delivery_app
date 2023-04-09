

import 'package:delivery_app/src/features/data/repositories/localStorage/RemoveLocalStorageRepository.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class RemoveLocalStorageUseCase {

  Future<void> execute({ required RemoveLocalStorageParameters parameters});
} 

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {

  //Dependencias
  final RemoveLocalStorageRepository _removeLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({ RemoveLocalStorageRepository? removeLocalStorageRepository })
    : _removeLocalStorageRepository = removeLocalStorageRepository ?? DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({required RemoveLocalStorageParameters parameters}) async {
    
    return await _removeLocalStorageRepository.removeInLocalStorage(key: parameters.key);
  }

}
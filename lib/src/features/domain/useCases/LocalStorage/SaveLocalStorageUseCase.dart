

import 'package:delivery_app/src/features/data/repositories/localStorage/SaveLocalStorageRepository.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class SaveLocalStorageUseCase {

  Future<void> execute({ required SaveLocalStorageParameters parameters });
}

class DefaultSaveLocalStorageUseCase extends SaveLocalStorageUseCase {

  //Dependencias
  final SaveLocalStorageRepository _saveLocalStorageRepository;

  DefaultSaveLocalStorageUseCase({ SaveLocalStorageRepository? saveLocalStorageRepository })
    : _saveLocalStorageRepository = saveLocalStorageRepository ?? DefaultSaveLocalStorageRepository();

  @override
  Future<void> execute({required SaveLocalStorageParameters parameters}) async {
    
    _saveLocalStorageRepository.saveInLocalStorage(key: parameters.key, value: parameters.value);
  }

}


import 'package:delivery_app/src/features/data/repositories/localStorage/FetchLocalStorageRepository.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';

abstract class FetchLocalStorageUseCase {

  Future<String?> execute({ required FetchLocalStorageParameters parameters});
}

class DefaultFetchLocalStorageUseCase extends FetchLocalStorageUseCase {

  //Dependencias
  final FetchLocalStorageRepository _fetchLocalStorageRepository;

  DefaultFetchLocalStorageUseCase({ FetchLocalStorageRepository? fetchLocalStorageRepository })
    : _fetchLocalStorageRepository = fetchLocalStorageRepository ?? DefaultFetchLocalStorageRepository();

  @override
  Future<String?> execute({required FetchLocalStorageParameters parameters}) async {
    
    return await _fetchLocalStorageRepository.fetchInLocalStorage(key: parameters.key);
  }


}
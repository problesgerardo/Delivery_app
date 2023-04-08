

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/user/FetchUserDataRepository.dart';
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class FetchUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required String localId });
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {

  //Dependencias
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({ FetchUserDataRepository? fetchUserDataRepository })
    : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository() ;

  @override
  Future<Result<UserEntity, Failure>> execute({required String localId}) {
    
    return _fetchUserDataRepository.fetchUserData(localId: localId).then((result) {

      switch(  result.status ) {

        case ResultStatus.success:
          
          if(result.value == null ) {
            return Result.failure(Failure.fromMessage( message: AppFailureMessages.unExpectedErrorMessage ));
          }

          return Result.success(UserEntity.fromJson(result.value!.toJson()));
          
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }


}
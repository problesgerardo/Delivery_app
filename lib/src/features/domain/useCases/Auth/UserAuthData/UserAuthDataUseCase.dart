
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/auth/UserAuthData/UserAuthDataRepository.dart';
import 'package:delivery_app/src/features/data/repositories/auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:delivery_app/src/features/domain/Entities/Auth/UserAuthData/UserAuthDataEntity.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class UserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute({ required GetUserDataUseCaseParameters parameters });
}

class DefaultUserAuthDataUseCase extends UserAuthDataUseCase {

  //Dependencias
  final UserAuthDataRepository _userAuthDataRepository;

  DefaultUserAuthDataUseCase({ UserAuthDataRepository? userAuthDataRepository })
    : _userAuthDataRepository = userAuthDataRepository ?? DefaultUserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required GetUserDataUseCaseParameters parameters}) {

    return _userAuthDataRepository.getUserData(parameters: GetUserDataBodyParameters(idToken: parameters.idToken)).then((result) {
      switch (result.status) {
        
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthDataEntity.fromJson(result.value!.toJson()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}


import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/UserAuthData/UserAuthDataUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/UserAuthData/UserAuthDataUseCaseBodyParameters.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class ValidateCurrentUserUseCase {

  Future<bool> execute({ required String idToken });
}

class DefaultValidateCurrentUserUseCase extends ValidateCurrentUserUseCase {

  final UserAuthDataUseCase _authDataUseCase;

  DefaultValidateCurrentUserUseCase({ UserAuthDataUseCase? authDataUseCase })
    : _authDataUseCase = authDataUseCase ?? DefaultUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    
    try {
      return _authDataUseCase.execute(parameters: GetUserDataUseCaseParameters(idToken: idToken)).then((result) {
        switch(result.status) {
          
          case ResultStatus.success:
            return true;
          case ResultStatus.error:
            return false;
        }
      });
    } on Failure {
      return false;
    }
  }

}

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/features/data/repositories/auth/SignInRepository/SignInRepository.dart';
import 'package:delivery_app/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute({ required SignInUseCaseBodyParameters params });
}

class DefaultSignInUseCase extends SignInUseCase {

  //Dependencias
  SignInRepository _signInRepository;

  DefaultSignInUseCase({ SignInRepository? signInRepository })
    : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute({required SignInUseCaseBodyParameters params}) {
    
    return _signInRepository.signIn(params: SignInBodyParameters(
      email: params.email, 
      password: params.password,
    )).then((result){
      switch(result.status){
        
        case ResultStatus.success:
          if(result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          } 
          
          var entity = SignInEntity.fromJson(result.value!.toJson());

          return Result.success(entity);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }

}
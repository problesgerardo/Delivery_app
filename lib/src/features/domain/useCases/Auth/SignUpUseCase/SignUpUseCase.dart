
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepository.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/features/domain/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery_app/src/utils/helpers/Dates/DateHelpers.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:delivery_app/src/utils/helpers/UserPhotos/UserPhotoHelper.dart';

abstract class SignUpUseCase{

  Future<Result<SignUpEntity, Failure>> execute({ required SignUpUseCaseParameter params });

}

class DefaultSignUpUseCase extends SignUpUseCase {

  //Dependencias
  SignUpRepository _signUpRepository;
  SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({ SignUpRepository? signUpRepository, SaveUserDataUseCase? saveUserDataUseCase})
    : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
    _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameter params}) {
    
    return _signUpRepository.signUp(params: SignUpRepositoryParameters(email: params.email, password: params.password)).then((result) {
      switch(result.status) { 
        case ResultStatus.success:
          //Null check
          if( result.value == null ) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          } 

          SignUpEntity entity = SignUpEntity.fromJson(result.value!.toJson());
          return saveUserDataInDataBase(params: params, entity: entity);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });

  }
}

extension on DefaultSignUpUseCase {

  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({required SignUpUseCaseParameter params, required SignUpEntity entity}) {

    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
      localId: entity.localId,
      role: UserRole.user,
      userName: params.userName,
      email: params.email,
      phone: params.phone,
      dateOfBirth: params.date,
      startDate: DateHelpers.getStartDate(),
      photo: UserPhotoHelper.defaultUserPhoto,
      shippingAddress: "",
      billingAddress: "",
      IdToken: entity.idToken,
    );

    return _saveUserDataUseCase.execute(parameters: _params).then((result) {
      switch( result.status ) {

        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
    
}
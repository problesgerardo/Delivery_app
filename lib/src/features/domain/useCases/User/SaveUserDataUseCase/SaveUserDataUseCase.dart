
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/user/SaveUserDataRepository.dart';
import 'package:delivery_app/src/features/data/repositories/user/UserBodyParameters.dart';
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/features/domain/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

import 'package:delivery_app/src/features/domain/useCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';

abstract class SaveUserDataUseCase {

  Future<Result<UserEntity, Failure>>  execute({ required SaveUserDataUseCaseParameters parameters });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  //Dependencias
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository })
    : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({required SaveUserDataUseCaseParameters parameters}) {
    
    UserBodyParameters _parameters = UserBodyParameters(
      localId: parameters.localId,
      role: parameters.role?.toShortString(),
      userName: parameters.userName,
      email: parameters.email,
      phone: parameters.phone,
      dateOfBirth: parameters.dateOfBirth,
      startDate: parameters.startDate,
      photo: parameters.photo,
      shippingAddress: parameters.shippingAddress,
      billingAddress: parameters.billingAddress,
      IdToken: parameters.IdToken,
    );

    return _saveUserDataRepository.saveUserData(parameters: _parameters).then((result) {
      switch(result.status){
        
        case ResultStatus.success:
          if( result.value == null ) {
            return Result.failure(Failure.fromMessage( message: AppFailureMessages.unExpectedErrorMessage ));
          }

          var entity = UserEntity.fromJson( result.value!.toJson() );

          return Result.success(entity);

        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });

  }


}
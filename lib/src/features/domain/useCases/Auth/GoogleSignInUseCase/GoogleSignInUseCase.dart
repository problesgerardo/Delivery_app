

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/features/domain/Entities/User/UserEntity.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Interface/Interfaces.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Services/GoogleSignInService.dart';
import 'package:delivery_app/src/utils/helpers/Dates/DateHelpers.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {

  //Dependencias
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase({
    GoogleSignInService? googleSignInService,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
    SaveUserDataUseCase? saveUserDataUseCase
  }) : _googleSignInService = googleSignInService ?? DefaultGoogleSignInService(),
      _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
      _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();
      
  @override
  Future<Result<UserEntity, Failure>> execute() async {
    
    final user = await _googleSignInService.signInWithGoogle();
    
    //Mantener la sesion del usuario
    _saveLocalStorageUseCase.execute(parameters: SaveLocalStorageParameters(
      key: LocalStorageKeys.idToken, 
      value: user.idToken ?? ""
    ));

    final isUserInDatabase = await _googleSignInService.isUserInDatabase(uid: user.uid ?? "");

    if( isUserInDatabase ) {
      return Result.success(mapUserEntity(user: user));
    } else {
      return saveUserDatabase(user: user);
    }
  }
}

extension Mapper on DefaultGoogleSignInUseCase {
  UserEntity mapUserEntity({ required GoogleSignInUserEntity user }) {
    return UserEntity(
      localId: user.uid,
      role: UserRole.user.toShortString(),
      userName: user.displayName,
      email: user.email,
      phone: user.phoneNumber,
      dateOfBirth: "",
      startDate: DateHelpers.getStartDate(),
      photo: user.photoURL,
      shippingAddress: "",
      billingAddress: "",
      IdToken: user.idToken,
    );
  }
}

extension PrivateMethods on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> saveUserDatabase({ required GoogleSignInUserEntity user }) {
    SaveUserDataUseCaseParameters params = SaveUserDataUseCaseParameters(
      localId: user.uid,
      role: UserRole.user,
      userName: user.displayName,
      email: user.email,
      phone: user.phoneNumber,
      dateOfBirth: "",
      startDate: DateHelpers.getStartDate(),
      photo: user.photoURL,
      shippingAddress: "",
      billingAddress: "",
      IdToken: user.idToken,
    );

    return _saveUserDataUseCase.execute(parameters: params);
  }
}
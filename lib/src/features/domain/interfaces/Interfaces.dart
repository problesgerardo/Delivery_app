

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/data/decodables/auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:delivery_app/src/features/data/decodables/user/UserDecodable.dart';
import 'package:delivery_app/src/features/data/repositories/auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/features/data/repositories/user/UserBodyParameters.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/decodable/signInDecodable.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/decodable/signUpDecodable.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/decodable/updatePasswordDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

import '../../data/repositories/auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';

//Auth Repositories
abstract class SignInRepository {

  Future<Result<SignInDecodable, Failure>> signIn({ required SignInBodyParameters params });
}

abstract class SignUpRepository {

  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpRepositoryParameters params });
}

abstract class UpdatePasswordRepository {

  Future<Result<UpdatePasswordDecodable, Failure >> updatePassword({ required String email });
}

abstract class UserAuthDataRepository {

  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters parameters });
}

//User Database Repositories
abstract class SaveUserDataRepository {

  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters parameters });
}

abstract class FetchUserDataRepository {
  
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}
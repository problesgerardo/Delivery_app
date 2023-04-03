

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/data/decodables/user/UserDecodable.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/features/data/repositories/user/UserBodyParameters.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/signUpDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

//Auth Repositories
abstract class SignUpRepository {

  Future<Result<SignUpDecodable, Failure>> signUp({
    required SignUpRepositoryParameters params
  });
}

//User Database Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters parameters });
}
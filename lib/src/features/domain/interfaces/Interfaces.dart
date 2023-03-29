

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/signInDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

abstract class SignUpRepository {

  Future<Result<SignInDecodable, Failure>> signUp({
    required SignUpRepositoryParameters params
  });
}
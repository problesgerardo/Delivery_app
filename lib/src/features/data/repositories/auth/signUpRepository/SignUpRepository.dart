

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/features/domain/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/SignUpAuthService.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/signInDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {

  //Dependencias
  SignUpService _signUpService;

  DefaultSignUpRepository({ SignUpService? signUpService }) 
    : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignInDecodable, Failure>> signUp({required SignUpRepositoryParameters params}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

}
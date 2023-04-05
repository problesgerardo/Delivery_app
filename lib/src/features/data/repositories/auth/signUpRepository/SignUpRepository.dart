

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/data/repositories/auth/signUpRepository/SignUpRepositoryParameters.dart';
import 'package:delivery_app/src/features/domain/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/signUpDecodable.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/services/SignUpAuthService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

class DefaultSignUpRepository extends SignUpRepository {

  //Dependencias
  SignUpService _signUpService;

  DefaultSignUpRepository({ SignUpService? signUpService }) 
    : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp({required SignUpRepositoryParameters params}) async {
    
    try{
      final result = await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromJson(result);
      return Result.success(decodable);
    } on Failure catch(f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}
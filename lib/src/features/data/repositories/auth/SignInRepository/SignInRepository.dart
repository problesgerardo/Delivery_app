
import 'package:delivery_app/src/features/data/repositories/auth/SignInRepository/SignInBodyParameters.dart';
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/SignInAuthService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/signInDecodable.dart';

class DefaultSignInRepository extends SignInRepository{

  //Dependencias
  final SignInService _signInService;

  DefaultSignInRepository({ SignInService? signInService})
    : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params}) async {
    try{
      final result = await _signInService.signIn(bodyParameters: params.toJson());
      SignInDecodable decodable = SignInDecodable.fromJson(result);
      return Result.success(decodable);
    } on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}
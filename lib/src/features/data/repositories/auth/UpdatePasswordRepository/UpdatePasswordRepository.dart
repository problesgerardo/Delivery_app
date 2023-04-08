

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/services/UpdatePasswordUserService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/decodable/updatePasswordDecodable.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository{

  //Dependencias 
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository({ UpdatePasswordUserService? updatePasswordUserService })
    : _updatePasswordUserService = updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({required String email}) async {
    
    try{
      final result = await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable decodable = UpdatePasswordDecodable.fromJson(result);
      return Result.success(decodable);
      
    } on Failure catch(f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}


import 'package:delivery_app/src/features/data/repositories/auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:delivery_app/src/features/data/decodables/auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/services/GetUserAuthDataService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {

  //Dependencias
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({ GetUserAuthDataService? getUserAuthDataService })
    : _getUserAuthDataService = getUserAuthDataService ?? DefaultGetUserAuthDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({required GetUserDataBodyParameters parameters}) async {
    
    try {

      final result = await _getUserAuthDataService.getUserAuthData(bodyParameters: parameters.toJson());
      UserAuthDataDecodable decodable = UserAuthDataDecodable.fromJson(result);
      return Result.success(decodable);

    } on Failure catch(f) {
      return Result.failure( Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

}
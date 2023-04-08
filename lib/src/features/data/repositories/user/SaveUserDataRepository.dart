
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/data/repositories/user/UserBodyParameters.dart';
import 'package:delivery_app/src/features/data/decodables/user/UserDecodable.dart';
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Interface/Interface.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';


abstract class _Paths {

  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository{

  // Dependencias
  RealtimeDatabaseService _realtimeDatabaseService;

  DefaultSaveUserDataRepository({RealtimeDatabaseService? realtimeDatabaseService})
    : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters}) async {
    if( parameters.localId == null ) {
      return Result.failure(Failure.fromMessage( message: AppFailureMessages.unExpectedErrorMessage));
    }

    //Creamos el Path
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDatabaseService.putData(bodyParamts: parameters.toJson(), path: path);
      UserDecodable decodable = UserDecodable.fromJson(result);

      return Result.success(decodable);

    } on Failure catch(f) {
      return Result.failure(f);
    }

  }

}
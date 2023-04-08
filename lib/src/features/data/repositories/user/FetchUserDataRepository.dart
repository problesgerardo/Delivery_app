

import 'package:delivery_app/src/features/data/decodables/user/UserDecodable.dart';
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/domain/interfaces/Interfaces.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Interface/Interface.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = "users/";
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {

  //Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultFetchUserDataRepository({ RealtimeDatabaseService? realtimeDatabaseService }) 
    : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({required String localId}) async {
    
    var fullPath = path + localId;
    try{

      final result = await _realtimeDatabaseService.getData(path: fullPath );
      UserDecodable decodable = UserDecodable.fromJson(result);
      return Result.success(decodable);
      
    } on Failure catch(f){
      return Result.failure(f);
    }
  }

}
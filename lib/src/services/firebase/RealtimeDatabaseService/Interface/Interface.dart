


abstract class BaseRealtimeDatabaseService {
  String baseURL = 'https://delivery-app-flutter-f86e0-default-rtdb.firebaseio.com/';
  String endURL = '.json';
} 

abstract class RealtimeDatabaseService extends BaseRealtimeDatabaseService {
  Future<Map<String, dynamic>> postData({
    required Map<String, dynamic> bodyParamts,
    required String path
  });

  Future<Map<String, dynamic>> putData({
    required Map<String, dynamic> bodyParamts,
    required String path
  });

  Future<Map<String, dynamic>> getData({
    required String path
  });
}
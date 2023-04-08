import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/apiService/apiService.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Interface/Interface.dart';

class DefaultRealtimeDatabaseService extends RealtimeDatabaseService {

  final ApiService _apiService;

  DefaultRealtimeDatabaseService({ApiService? apiService}) : _apiService = apiService ?? DefaultApiService();

  @override
  Future<Map<String, dynamic>> getData({required String path}) async {
    var endpoint = baseURL + path + endURL;

    try{
      final result = await _apiService.getDataFromGetRequest(url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> postData({required Map<String, dynamic> bodyParamts, required String path}) async {
    var endpoint = baseURL + path + endURL;

    try{
      final result = await _apiService.getDataFromPostRequest(bodyParameters: bodyParamts, url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

  @override
  Future<Map<String, dynamic>> putData({required Map<String, dynamic> bodyParamts, required String path}) async {
    var endpoint = baseURL + path + endURL;

  try{
      final result = await _apiService.getDataFromPutRequest(bodyParameters: bodyParamts, url: endpoint);
      return result;
    } on Failure catch(f) {
      return f.error;
    }
  }

}

import 'package:delivery_app/src/base/apiService/apiService.dart';

abstract class BaseFirebaseServices {
  ApiServices apiService = DefaultApiServices();

  static String baseURL = 'https://identitytoolkit.googleapis.com/v1/';
  static String adminToken = 'AIzaSyDh4J0PdBK2-L-zUSAo5kPiYQMz0LaaJBs';

  static String signUpEndpoint = 'accounts:signUp?key=';
  static String signInEndpoint = 'accounts:signInWithPassword?key=';

}

abstract class SignUpService extends BaseFirebaseServices {
  String endpoint = BaseFirebaseServices.baseURL + BaseFirebaseServices.signUpEndpoint + BaseFirebaseServices.adminToken;

  Future <Map<String, dynamic>> signUp({
    required Map<String, dynamic> bodyParameters
  });
}

abstract class SignInService extends BaseFirebaseServices {
  String endpoint = BaseFirebaseServices.baseURL + BaseFirebaseServices.signInEndpoint + BaseFirebaseServices.adminToken;

  Future <Map<String, dynamic>> signIn({
    required Map<String, dynamic> bodyParameters
  });
}
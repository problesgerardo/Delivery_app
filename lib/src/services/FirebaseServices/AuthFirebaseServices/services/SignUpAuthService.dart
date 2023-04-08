

import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignUpService extends SignUpService {
  @override
  Future<Map<String, dynamic>> signUp({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }

}
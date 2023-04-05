

import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';

class DefaultSignInService extends SignInService {

  @override
  Future<Map<String, dynamic>> signIn({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
  }


}


import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/bodyParameters/UpdatePasswordUserServiceBodyParameters.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/interfaces/AuthFirebaseInterfaces.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService{

  final String _requestType = "PASSWORD_RESET";
  

  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
    final _params = UpdatePasswordBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(bodyParameters: _params.toJson(), url: endpoint);
  }

}
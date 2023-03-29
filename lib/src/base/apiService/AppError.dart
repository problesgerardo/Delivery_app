
import 'dart:convert';

import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/authErrorDecodable.dart';

class Failure {

  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  Failure.fromMessage({ String? message }) {
    this.message = message;

  }

  Failure.fromBody({ required String body }) {
    var jsonData = jsonDecode(body);

    this.error = jsonData;

  }

  static Failure getFirebaseAuthErrorMessage({ required Map<String, dynamic> error }){
    AuthErrorDecodable _errorDecodable = AuthErrorDecodable.fromJson(error);

    var message = "";

    _errorDecodable.error?.errors?.forEach((error) { 
      message = error.message ?? "";
    });

    if( message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage( message: FBFailureMessages.emailNotFoundMessage);
    } else if (message == "INVALID_PASSWORD") {
      return Failure.fromMessage( message: FBFailureMessages.invalidPasswordMessage);
    }else if (message == "EMAIL_EXISTS") {
      return Failure.fromMessage( message: FBFailureMessages.emailExistMessage);
    }else if (message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      return Failure.fromMessage( message: FBFailureMessages.toManyAttemptMessage);
    }else if (message == "TOKEN_EXPIRED") {
      return Failure.fromMessage( message: FBFailureMessages.invalidIdTokenMessage);
    }else if (message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage( message: FBFailureMessages.userNotFoundMessage);
    }else {
      return Failure.fromMessage( message: message);
    }

  }

}
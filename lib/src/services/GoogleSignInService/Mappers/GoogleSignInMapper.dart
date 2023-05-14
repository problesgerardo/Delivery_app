

import 'package:delivery_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInMapper { 

  static GoogleSignInUserEntity mapUserCredential( UserCredential credential, String idToken ){
    return GoogleSignInUserEntity(credential.user, idToken);
  }

}
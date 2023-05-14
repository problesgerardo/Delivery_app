

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Interface/Interface.dart';
import 'package:delivery_app/src/services/FirebaseServices/RealtimeDatabaseService/Services/RealtimeDatabaseService.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Interface/Interfaces.dart';
import 'package:delivery_app/src/services/GoogleSignInService/Mappers/GoogleSignInMapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DefaultGoogleSignInService extends GoogleSignInService{

  String path = "users/";

  //Dependencias
  final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultGoogleSignInService({ RealtimeDatabaseService? realtimeDatabaseService })
    : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<bool> isUserInDatabase({required String uid}) async {
    
    final fullPath = path + uid; 

    try {

      final result = await _realtimeDatabaseService.getData(path: fullPath);
      return result.isNotEmpty; 

    }on Failure catch(f) {
      return false;
    }

  }

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
      // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return GoogleSignInMapper.mapUserCredential(userCredential, googleAuth?.idToken ?? "");
  }

}
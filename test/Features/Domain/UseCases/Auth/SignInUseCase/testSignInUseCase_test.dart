
import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:delivery_app/src/services/FirebaseServices/AuthFirebaseServices/decodable/authErrorDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class _Constants {
  static String correctEmail = "anapaula@gmail.com";
  static String correctPass = "110119";
  static String wrongEmail = "paula@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  
  final SignInUseCase sut = DefaultSignInUseCase();

  group("Test success response to SignInUseCase", (){
    test("Test success response to SignInUseCase", () async {
      //GIVEN
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
        email: _Constants.correctEmail, 
        password: _Constants.correctPass
      );

      //WHEN
      var result = await sut.execute(params: _params);
      switch(result.status) {
        
        case ResultStatus.success:
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          //THEN
          expect(result.error, Failure);
          break;
      }
    });
  });

  group("Test failure response to SignInUseCase", () {
    
    test("Test failure response to SignInUseCase", () async {
      //GIVEN
      final SignInUseCaseBodyParameters _params = SignInUseCaseBodyParameters(
        email: _Constants.wrongEmail, 
        password: _Constants.wrongPass,
      );

      try{
        final _ = await sut.execute(params: _params);

      } on Failure catch(f) {
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        //THEN
        expect(_error.error!.message, FBFailureMessages.emailNotFoundMessage);
      }
    });
  });
}
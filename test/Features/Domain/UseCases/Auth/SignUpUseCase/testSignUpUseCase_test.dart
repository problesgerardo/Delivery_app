

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/ErrorMessage.dart';
import 'package:delivery_app/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery_app/src/services/firebase/AuthFirebaseServices/decodable/authErrorDecodable.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class Constants {
  static String correctEmail = 'anapaula1@gmail.com';
  static String correctPass = '110119';
  static String wrongEmail = 'anapaula@gmail.com';
  static String wrongPass = '123456';
}

void main() {
  
  //GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  group('Test success Sign Up user in Firebase', (){
    test('Test success Sign up user in Firebase', () async {
      final SignUpUseCaseParameter params = SignUpUseCaseParameter(
        email: Constants.correctEmail,
        password: Constants.correctPass,
        userName: 'Ana Paula',
        date: '11/01/2019',
        phone: '6674993103',
      );

      //WHEN
      final result = await sut.execute(params: params);

      switch( result.status ) {
        
        case ResultStatus.success:
          //THEN
          expect(result.value, isA<SignUpEntity>() );
          break;
        case ResultStatus.error:
          //THEN
          expect(result.error, Failure);
          break;
      }

    });
  });

  group('Test failure Sign up user in Firebase', (){
    test('Test failure Sign up user in Firebase', () async {
      try{
        //WHEN
        final SignUpUseCaseParameter params = SignUpUseCaseParameter(
          email: Constants.wrongEmail,
          password: Constants.wrongPass,
          userName: 'Ana Paula',
          date: '11/01/2019',
          phone: '6674993103',
        );

        final _ = await sut.execute(params: params);
      } on Failure catch(f){
        //THEN
        AuthErrorDecodable error = f as AuthErrorDecodable;
        expect(error.error!.message, FBFailureMessages.emailExistMessage);
      }
    });
  });


  
}
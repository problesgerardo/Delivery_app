

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignInUseCase/SignInUseCaseBodyParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/features/presentation/login_page/model/LoginModel.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/widgets/textFormField/CustomTextFormField.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/ResultTypes/ResultType.dart';

abstract class LoginViewModelInput {

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');

  Future<Result<bool, Failure>> login({ required String email, required String password });
  bool isFormValidate();

}
abstract class LoginViewModel extends LoginViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {

   //Dependencias
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultLoginViewModel({ SignInUseCase? signInUseCase, SaveLocalStorageUseCase? saveLocalStorageUseCase })
    : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
    _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Future<Result<bool, Failure>> login({required String email, required String password}) {

    loadingState.setLoadingState(isLoading: true);

    return _signInUseCase.execute(params: SignInUseCaseBodyParameters(email: email, password: password)).then((result){
      switch(result.status) {
        
        case ResultStatus.success:
          loadingState.setLoadingState(isLoading: false);
          _saveLocalStorageUseCase.execute(
            parameters: SaveLocalStorageParameters(
              key: LocalStorageKeys.idToken, 
              value: result.value?.idToken ?? "",
            )
          );

          return Result.success(true);

        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });

  }

  @override
  onChange({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch(customTextFormFieldType) {
      
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.phone:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.username:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.dateOfBirth:
        // TODO: Handle this case.
        break;
    }
  }
}
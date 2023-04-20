


import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/base/constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery_app/src/features/presentation/register_page/model/SignUpModel.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/widgets/textFormField/CustomTextFormField.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/ResultTypes/ResultType.dart';

abstract class SignUpViewModelInput {

  late LoadingStateProvider loadingState;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectecDate;
  SignUpModel? signUpModel = SignUpModel();

  void initState({ required LoadingStateProvider loadingStateProvider });

  Future<Result<bool, Failure>> signUp();

  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput with TextFormFieldDelegate{



}


class DefaultSignUpViewModel extends SignUpViewModel {

  //Dependencias
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({ SignUpUseCase? signUpUseCase, SaveLocalStorageUseCase? saveLocalStorageUseCase })
    : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
    _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(); 

  @override
  void initState({required LoadingStateProvider loadingStateProvider}) {
    loadingState = loadingStateProvider;
    dateController = TextEditingController();
    selectecDate = DateTime.now();
  }
  
  @override
  bool isFormValidate() {
    
    return formKey.currentState?.validate() ?? false;
  }
  
  @override
  Future<Result<bool, Failure>> signUp() {
    
    loadingState.setLoadingState(isLoading: true);

    return _signUpUseCase.execute(params: SignUpUseCaseParameter(
      userName: signUpModel?.username ?? "", 
      email: signUpModel?.email ?? "", 
      password: signUpModel?.password ?? "",
      phone: signUpModel?.phone ?? "",
      date: signUpModel?.date ?? ""
    )).then((result) {
      switch (result.status) {
        
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(parameters: SaveLocalStorageParameters(
            key: LocalStorageKeys.idToken, 
            value: result.value?.idToken ?? ""
          ));
          loadingState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }
  
  @override
  onChange({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    
    switch( customTextFormFieldType ) {

      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
    }
  }


}


import 'package:delivery_app/src/base/constants/LocalStorageKeys.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery_app/src/features/domain/useCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery_app/src/features/domain/useCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import 'package:flutter/material.dart';


class RoutePath {
  static String welcomePath = "welcome";
  static String tabsPath = "tabs";
}

class MainCoordinator {

  //Dependencias
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserUseCase;

  MainCoordinator({ FetchLocalStorageUseCase? fetchLocalStorageUseCase, ValidateCurrentUserUseCase? validateCurrentUserUseCase })
    : _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
    _validateCurrentUserUseCase = validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase();

  Future<String?> star() {
    return _isUserLogged().then((value) {
      return value == null ? RoutePath.welcomePath : RoutePath.tabsPath;
    });
  }

  Future<String?> _isUserLogged() async {
    var idToken = await _fetchLocalStorageUseCase.execute(parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    return idToken;

    //Revisar si el usuario esta guardado
    /*if( idToken == null ) {
      return null;
    }

    //Hay un token guardado y vamos a comprobar que el usuario aun existe en la base de datos
    var isUserValid = await _validateCurrentUserUseCase.execute(idToken: idToken);

    if( isUserValid ) {
      return idToken;
    } else {
      return null;
    }*/
  }

  showTabPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutePath.tabsPath);
  }

}
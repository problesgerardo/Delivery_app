

import 'package:delivery_app/src/base/apiService/AppError.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/ErrorAlertView.dart';
import 'package:flutter/material.dart';

abstract class ErrorStateProviderDelegate {

  void setFailure({ required BuildContext context, required Failure value });
}

class ErrorStateProvider extends ChangeNotifier with ErrorStateProviderDelegate {

  late Failure _failure;



  @override
  void setFailure({required BuildContext context, required Failure value}) {
    
    _failure = value;
    _showAlert(context: context, message: _failure.toString());
    notifyListeners();
  }

  void _showAlert({ required BuildContext context, required String message}) {

    ErrorAlertView.showErrorAlertDialog(
      context: context, 
      subtitle: message, 
      ctaButtonAction: () {
        Navigator.pop(context);
      }
    );
  }


}
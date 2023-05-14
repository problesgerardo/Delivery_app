import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/forgot_password/view/components/TextFormFieldForgotEmail.dart';
import 'package:delivery_app/src/features/presentation/forgot_password/viewModel/ForgotPasswordViewModel.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/alert_dialog.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  //Dependencias
  final ForgotPasswordViewModel _viewModel;

  _ForgotPasswordState({ ForgotPasswordViewModel? viewModel })
    : _viewModel = viewModel ?? DefaultForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black
      )
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: ( BuildContext context ) {
            return backButton(context, Colors.black);
          }
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all( 30.0 ),
          child: Column(
            children: [
              HeaderText(text: 'Forgot password', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),

              Container(
                padding: const EdgeInsets.all( 10.0 ),
                child: const Text(
                  'Please enter your email adress. You will receive a link to create a new password via email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),

              TextFormFieldEmailUpdatePassword(viewModel: _viewModel,),

              //_sendButton(context)
              createElevatedButton(
                context: context,
                color: orange, 
                labelButton: 'Send', 
                fnAction: (){
                  _ctaButtonTapped(context);
                }
              ),

            ],
          ),
        )
      ),
    );
  }
}

extension UserActions on _ForgotPasswordState {
  void _ctaButtonTapped( BuildContext context) {

    _viewModel.updatePassword().then((value) {
      ShowAlertDialog(
        context, 
        const AssetImage('assets/lock.png'), 
        'Your password have been reset', 
        "You'll shortly receive an email with a code to setup a new password.", 
        createElevatedButton(
          context: context, 
          width: 350.0, 
          height: 45.0, 
          radius: 20.0, 
          isWithIcon: false, 
          color: orange, 
          labelButton: 'Done', 
          fnAction: () {
            Navigator.pushNamed(context, "login");
          }
        ),
      );
    });

    
  }
}




import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/login_page/view/login_page.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/alert_dialog.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
          padding: EdgeInsets.all( 30.0 ),
          child: Column(
            children: [
              HeaderText(text: 'Forgot password', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),

              Container(
                padding: EdgeInsets.all( 10.0 ),
                child: Text(
                  'Please enter your email adress. You will receive a link to create a new password via email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
              ),

              _emailInput(),

              //_sendButton(context)
              RoundedButton(
                context: context,
                color: orange, 
                labelButton: 'Send', 
                fnAction: (){
                  _showAlerta(context);
                }
              ),

            ],
          ),
        )
      ),
    );
  }
}

Widget _emailInput() {

  return Container(
    margin: EdgeInsets.only( top: 40.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Your email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

void _showAlerta( BuildContext context) {
  ShowAlertDialog(
    context, AssetImage('assets/lock.png'), 
    'Your password have been reset', 
    "You'll shortly receive an email with a code to setup a new password.", 
    RoundedButton(
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
}


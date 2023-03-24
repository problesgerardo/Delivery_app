import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/services.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all( 30.0 ),
            child: Column(
              children: [
                HeaderText(text: 'Create an account', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),
      
                _userNameInput(context),
      
                _emailNameInput(context),
      
                _phoneInput(context),
      
                _dateOfBirthInput(context),
      
                _passwordInput(context),
      
                //_registerButton(context),
                RoundedButton(
                  context: context, 
                  color: orange, 
                  labelButton: 'Sign up', 
                  fnAction: (){
                    print('Habilitar Registro');
                  }
                ),
      
                Container(
                  padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 40.0 ),
                  child: Text(
                    'By clicking Sign up you agree to the following Terms and Conditions without reservation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0
                    ),
                  ),
                ),
      
              ],
            ),
          )
        ),
      ),
    );
  }
}

Widget _userNameInput( BuildContext context) {
  return Container(
    margin: EdgeInsets.only( top: 40.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Username',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _emailNameInput( BuildContext context) {
  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _phoneInput( BuildContext context) {
  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Celular',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _dateOfBirthInput( BuildContext context) {
  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'Date of Birth',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _passwordInput( BuildContext context) {
  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}




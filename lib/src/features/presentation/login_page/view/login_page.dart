import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';

//Widgets
import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';

//UI
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      )
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              Image(
                width: double.infinity,
                height: 350.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1598134493179-51332e56807f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'
                )
              ),
              Container(
                margin: EdgeInsets.only( top: 50.0 ),
                child: backButton(context, Colors.white),
              )
            ],
            ),
      
            Transform.translate(
              offset: Offset( 0.0, -20.0 ),
              child: Container(
                width: double.infinity,
                //height: 450.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular( 20.0 )
                ),
                child: Padding(
                  padding: EdgeInsets.all( 20.0 ),
                  child: Center(
                    child: Column(
                      children: [

                        HeaderText(text: 'Welcome Back', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),
                        
                        Text(
                          'Login to your account',
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        ),
      
                        _emailInput(),
      
                        _passwordInput(),
      
                        RoundedButton(
                          context: context, 
                          color: orange, 
                          labelButton: 'Log in', 
                          fnAction: (){
                            Navigator.pushNamed(context, 'tabs');
                          }
                        ),
      
                        Container(
                          margin: EdgeInsets.only( top: 30.0 ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'forgot-password');
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 17.0
                              ),
                            ),
                          ),
                        ),
      
                        Container(
                          margin: EdgeInsets.only( top: 30.0 ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric( horizontal: 10.0 ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      color: orange,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
      
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
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
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _passwordInput() {

  return Container(
    margin: EdgeInsets.only( top: 15.0 ),
    padding: EdgeInsets.only( left: 20.0 ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(30.0)
    ),
    child: TextField(
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




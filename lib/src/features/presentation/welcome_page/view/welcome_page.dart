import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/services.dart';

//Widgets
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      )
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1603232644140-bb47da511b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80'
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur( sigmaX: 1.0, sigmaY: 1.0 ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric( horizontal: 50.0 ),
                child: HeaderText(text: 'COMIDA PARA MASCOTAS CULIACAN', color:Colors.white, fontWeight: FontWeight.bold,fontSize: 45.0)
              ),
              Container(
                padding: const EdgeInsets.symmetric( horizontal: 50.0, vertical: 30.0 ),
                child: const Text(
                  'Set exact location to find the right restaurants near you', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                  ),
                ),
              ),
              RoundedButton(context: context, color: orange, labelButton: 'Log in', fnAction: () {Navigator.pushNamed(context, 'login');}),
              RoundedButton(context: context, color: fbButtonColor, labelButton: 'Connect with Facebook', isWithIcon: true, icon: AssetImage('assets/facebook.png'), fnAction: () {})
            ],
          ),
        ],
      )
    );
  }
}

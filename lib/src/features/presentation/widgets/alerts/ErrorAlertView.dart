

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class ErrorAlertView {

  static Future showErrorAlertDialog({ 
    required BuildContext context, 
    required String subtitle, 
    required dynamic Function() ctaButtonAction 
  }) async {

    return showDialog( 
      context: context, 
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          content: SizedBox(
            height: 320,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/errorIcon.png'),
                  width: 130,
                  height: 130,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text('Network error', style: TextStyle(
                    color: primaryColor,
                    fontSize: 20.0,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Text(subtitle, style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),),
                ),
                createElevatedButton(
                  context: context, 
                  color: orange, 
                  labelButton: "Ir al inicio", 
                  fnAction: ctaButtonAction,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
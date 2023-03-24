import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';


void ShowAlertDialog( 
  BuildContext context, 
  ImageProvider<Object> imagePath, 
  String headerTitle, 
  String bodyText, 
  Widget doneButton
  ) {
  showDialog(

    context: context, 
    barrierDismissible: true,
    builder: ( BuildContext context) {

    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    print(sizeWidth * 0.047);

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular( 20.0 ) )
        ),
        content: Container(
          height: sizeHeight * 0.38,
          child: Column(
            children: [
              Image(
                image: imagePath, //AssetImage('assets/lock.png'),
                width: sizeHeight * 0.14,
                height: sizeHeight * 0.14,
              ),
              Container(
                margin: EdgeInsets.all( sizeWidth * 0.036 ),
                child: HeaderText(text: headerTitle,color: primaryColor,fontWeight: FontWeight.bold, fontSize: sizeWidth * 0.047),

              ),
              Container(
                margin: EdgeInsets.only( top: sizeWidth * 0.036 ),
                child: HeaderText(text: bodyText,color: primaryColor,fontWeight: FontWeight.w400, fontSize: sizeWidth * 0.036),

              ),

              doneButton,

            ],
          ),
        ),
      );
    }
  );
}


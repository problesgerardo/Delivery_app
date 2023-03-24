
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
Widget PopularsCard({ 
    required BuildContext context, 
    double marginTop = 0.0,
    double marginBottom = 0.0,
    double marginLeft = 10.0,
    double marginRight = 0.0,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle,
    required String review,
    required String ratings,
    String buttonText = "",
    required bool hasActionButton 
  }) {

    final size = MediaQuery.of(context).size;

  return Column(
    children: [
      Container(
        margin: EdgeInsets.only( top: marginTop, bottom: marginBottom, left: marginLeft, right: marginRight ),
        padding: EdgeInsets.symmetric( vertical: 10.0 ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular( 10.0 ),
              child: Image(
                //width: 80,
                width: size.width * 0.2,
                //height: 80,
                height: size.width * 0.2,
                fit: BoxFit.cover,
                image: image,
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 20.0 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric( vertical: 7.0 ),
                    child: HeaderText(
                      text: title, 
                      color: Colors.black, 
                      fontWeight: FontWeight.bold, 
                      fontSize: 17.0
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only( bottom: 5.0 ),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: yellow, size: 16.0,),
                      Text(
                        review,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only( left: 5.0 ),
                        child: Text(
                          ratings,
                          style: TextStyle(
                            color: grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only( left: 20.0 ),
                        //width: 110.0,
                        width: size.width * 0.25,
                        height: 18.0,
                        child: hasActionButton ? 
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            shape: StadiumBorder(),
                            primary: orange,
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                            ),
                          ),
                        ): null,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';

import 'package:delivery_app/src/colors/colors.dart';

Widget CardVertical ({
  required BuildContext context, 
  required double width, 
  required double height, 
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
  }) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: Image(
            width: width,
            height:height,
            fit: BoxFit.cover,
            image: image,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only( top: 5.0 ),
              child: HeaderText(
                text: title, 
                fontSize: 17.0, 
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.only( top: 5.0 ),
              child: HeaderText(
                text: subtitle, 
                fontSize: 13.0, 
                color: grey, 
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
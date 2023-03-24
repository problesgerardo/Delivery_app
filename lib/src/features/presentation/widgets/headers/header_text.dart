

import 'package:flutter/material.dart';

Widget HeaderText({ 
    String text = "", 
    Color color = Colors.black, 
    FontWeight fontWeight = FontWeight.bold, 
    double? fontSize,
    TextAlign textAling = TextAlign.justify
  }) {

  return Text(
    text, 
    textAlign: textAling,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}
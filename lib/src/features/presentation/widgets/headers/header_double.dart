
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';

Widget HeaderDoubleText( {
    String textHeader = "", 
    String textAction = "", 
    VoidCallback? fnAction
  }) {
  return Container(
    child: Row(
      children: [
        HeaderText(text: textHeader, fontSize: 20.0),
        Spacer(),
        GestureDetector(
          onTap: fnAction,
          child: HeaderText(text: textAction, color: orange, fontSize: 15.0, fontWeight: FontWeight.w500)
        )
      ],
    ),
  );
}
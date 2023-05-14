import 'package:flutter/material.dart';

Widget createElevatedButton({
    BuildContext? context,
    double width = 350.0,
    double height = 45.0,
    double radius = 8.0,
    bool isWithIcon = false,
    ImageProvider<Object>? icon,
    String? labelButton,
    double labelFontSize = 15,
    Color labelColor = Colors.white,
    Color color = Colors.blue,
    OutlinedBorder? shape,
    required VoidCallback fnAction
  }) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.only(top: 20.0),
    child: isWithIcon ? 
    _elevatedButtonWithIcon( 
      radius, 
      icon!, 
      labelButton ?? "", 
      labelFontSize, 
      labelColor, 
      color, 
      shape ?? const StadiumBorder(), 
      fnAction 
    ) 
    : _elevatedButtonNotIcon( 
      radius, 
      labelButton ?? "",
      labelFontSize, 
      labelColor, 
      color,
      shape ?? const StadiumBorder(),
      fnAction,
    ),
  );
}

Widget _elevatedButtonWithIcon( 
  double radius,
  ImageProvider<Object> icon,
  String labelButton,
  double labelFontSize,
  Color labelColor,
  Color color,
  OutlinedBorder shape,
  VoidCallback fnAction) {
  return ElevatedButton(
    onPressed: fnAction,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: shape,
      elevation: 0.5
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: icon,
          width: 20.0,
          height: 20.0,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            labelButton,
            style: TextStyle(
              color: labelColor, 
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _elevatedButtonNotIcon(
  double radius,
  String labelButton,
  double labelFontSize,
  Color labelColor,
  Color color,
  OutlinedBorder shape,
  VoidCallback fnAction) {
  return ElevatedButton(
    onPressed: fnAction,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: shape
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            labelButton,
            style: TextStyle(
              color: labelColor, 
              fontSize: labelFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

Widget RoundedButton({
    required BuildContext context,
    double width = 350.0,
    double height = 45.0,
    double radius = 20.0,
    bool isWithIcon = false,
    ImageProvider<Object>? icon,
    required Color color,
    required String labelButton,
    required VoidCallback fnAction
  }) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.only(top: 20.0),
    child: isWithIcon ? 
              _elevatedButtonWithIcon( context, radius, icon!, labelButton, color, fnAction ) 
              : _elevatedButtonNotIcon( context, radius, labelButton, color, fnAction ),
  );
}

Widget _elevatedButtonWithIcon( BuildContext context, double radius, ImageProvider<Object> icon, String labelButton,Color color, VoidCallback fnAction) {
  return ElevatedButton(
    onPressed: fnAction,
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: icon,
          width: 25.0,
          height: 25.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text(
            labelButton,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ],
    ),
  );
}

Widget _elevatedButtonNotIcon(BuildContext context, double radius, String labelButton, Color color, VoidCallback fnAction) {
  return ElevatedButton(
    onPressed: fnAction,
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text(
            labelButton,
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
      ],
    ),
  );
}

import 'package:delivery_app/src/utils/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class TextfieldProfileView extends StatelessWidget {
  const TextfieldProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _createTextfieldUsername(context),
          _createTextfieldEmail(context),
          _createTextfieldPhone(context),
          _createTextfieldBirth(context),
          _createTextfieldAdress(context),
        ],
      ),
    );
  }
}


Widget _createTextfieldUsername( BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration( hintText: 'Username', border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextfieldEmail( BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration( hintText: 'Email', border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextfieldPhone( BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration( hintText: 'Phone', border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextfieldBirth( BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration( hintText: 'Date of Birth', border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

Widget _createTextfieldAdress( BuildContext context) {
  return Container(
    width: screenWidth.getScreenWidth(context: context, multiplier: 0.8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
    ),
    child: ListTile(
      title: TextField(
        keyboardType: TextInputType.text, 
        maxLines: 3,
        decoration: InputDecoration( hintText: 'Delivery Address', border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}
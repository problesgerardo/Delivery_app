

import 'package:delivery_app/src/utils/helpers/Validators/FormValidators.dart';
import 'package:flutter/material.dart';
import '../../../../colors/colors.dart';

abstract class TextFormFieldDelegate {
  onChange({ 
    required String newValue,
    required CustomTextFormFieldType customTextFormFieldType,
  });
}

enum CustomTextFormFieldType{
  email, password, phone, username, dateOfBirth
}

class CustomTextFormField extends StatelessWidget {

  final CustomTextFormFieldType textFormFieldType;
  final String hintText;
  final TextFormFieldDelegate delegate;
  final TextEditingController? _controller;

  const CustomTextFormField({ 
    required this.textFormFieldType, 
    required this.hintText,
    required this.delegate,
    TextEditingController? controller,
  }) : _controller = controller ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: 10.0 ),
      padding: EdgeInsets.only( left: 20.0 ),
      decoration: BoxDecoration(
        color: bgInputs,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextFormField(
        controller: _controller,
        keyboardType: getKeyBoardType(textFormFieldType: textFormFieldType),
        obscureText: textFormFieldType == CustomTextFormFieldType.password ? true : false,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none
          ),
        ),
        onChanged: ( newValue ) => delegate.onChange(newValue: newValue, customTextFormFieldType: textFormFieldType),
        validator: ( value ) {
          switch( textFormFieldType ) {
            case CustomTextFormFieldType.email:
              return EmailFormValidator.validateEmail(email: value ?? '');

            case CustomTextFormFieldType.password:
              return PasswordFormValidator.validatePassword(password: value ?? '');

            case CustomTextFormFieldType.phone:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');

            case CustomTextFormFieldType.username:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');

            case CustomTextFormFieldType.dateOfBirth:
              return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
          }
        },
      ),
    );
  }

  TextInputType? getKeyBoardType({ required CustomTextFormFieldType textFormFieldType }) {
    switch( textFormFieldType ) {
      
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.dateOfBirth:
        return TextInputType.datetime;
    }
  }
}
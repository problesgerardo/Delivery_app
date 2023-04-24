

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/forgot_password/viewModel/ForgotPasswordViewModel.dart';
import 'package:delivery_app/src/utils/helpers/Validators/FormValidators.dart';
import 'package:flutter/material.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {

  final ForgotPasswordViewModel viewModel;

  const TextFormFieldEmailUpdatePassword({super.key, required this.viewModel });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0 ),
      padding: const EdgeInsets.only( left: 20.0 ),
      decoration: BoxDecoration( 
        color: bgInputs,
        borderRadius: BorderRadius.circular( 40.0 ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        validator: (value) => EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (newValue) => viewModel.email = newValue,
      ),
    );
  }
}
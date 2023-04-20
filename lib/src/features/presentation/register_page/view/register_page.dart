import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/presentation/register_page/viewModel/SignUpViewModel.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:delivery_app/src/features/presentation/widgets/textFormField/CustomTextFormField.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../utils/helpers/ResultTypes/ResultType.dart';


class RegisterPage extends StatelessWidget with BaseView {

  final SignUpViewModel _viewModel;

  RegisterPage({ SignUpViewModel? viewModel })
    : _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {

    _viewModel .initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black
      )
    );
    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: ( BuildContext context ) {
            return backButton(context, Colors.black);
          }
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              Center(
                child: Form(
                  key: _viewModel.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: EdgeInsets.all( 30.0 ),
                    child: Column(
                      children: [
                        HeaderText(text: 'Create an account', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),

                        SizedBox( height: 20.0 ,),
                  
                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.username,
                          hintText: 'Username', 
                          delegate: _viewModel,                           
                        ),

                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.email,
                          hintText: 'Email', 
                          delegate: _viewModel,                           
                        ),

                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.phone,
                          hintText: 'Phone', 
                          delegate: _viewModel,                           
                        ),

                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: CustomTextFormField(
                              textFormFieldType: CustomTextFormFieldType.dateOfBirth,
                              hintText: 'Date of Birth', 
                              delegate: _viewModel,
                              controller: _viewModel.dateController,                           
                            ),
                          ),
                        ),

                        CustomTextFormField(
                          textFormFieldType: CustomTextFormFieldType.password,
                          hintText: 'Password', 
                          delegate: _viewModel,                           
                        ),

                        RoundedButton(
                          context: context, 
                          color: orange, 
                          labelButton: 'Sign up', 
                          fnAction: (){
                            _ctaTapped(context);
                          }
                        ),
          
                        Container(
                          padding: EdgeInsets.symmetric( horizontal: 20.0, vertical: 40.0 ),
                          child: Text(
                            'By clicking Sign up you agree to the following Terms and Conditions without reservation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      
            ]
          ))
        ],
      ),
    );
  }
}

extension UserAction on RegisterPage {

  void _selectDate( BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: _viewModel.selectecDate, 
      firstDate: DateTime(1960,1), 
      lastDate: DateTime(2100),
      locale: Locale('es', ''),
    );

    if( picked != null && picked != _viewModel.selectecDate ) {
      _viewModel.signUpModel?.date = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      _viewModel.dateController.text = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }

  }

  void _ctaTapped( BuildContext context ) {

    if( _viewModel.isFormValidate() ) {
      _viewModel.signUp().then((result) {
        switch(result.status) {
          
          case ResultStatus.success:
            Navigator.pushNamed(context, "tabs");
            break;
          case ResultStatus.error:
            errorStateProvider.setFailure(context: context, value: result.error!);
        }
      });
    }
  }
}

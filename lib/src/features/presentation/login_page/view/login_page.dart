
import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/presentation/login_page/viewModel/LoginViewModel.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:delivery_app/src/features/presentation/widgets/textFormField/CustomTextFormField.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';

//UI
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BaseView {

  final LoginViewModel _viewModel;

  LoginPage({ LoginViewModel? viewModel }) 
    : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {

    //Inicializar el ViewModel

    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      )
    );

    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Stack(
                        children: const [
                          Image(
                            width: double.infinity,
                            height: 350.0,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1598134493179-51332e56807f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'
                            )
                          ),
                        ],
                      ),
                
                      Transform.translate(
                        offset: const Offset( 0.0, -20.0 ),
                        child: Container(
                          width: double.infinity,
                          //height: 450.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular( 20.0 )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all( 20.0 ),
                            child: Center(
                              child: Form(
                                key: _viewModel.formKey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                              
                                    HeaderText(text: 'Welcome Back', color: primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),
                                    
                                    Text(
                                      'Login to your account',
                                      style: TextStyle(
                                        color: grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                              
                                    CustomTextFormField(
                                      textFormFieldType: CustomTextFormFieldType.email, 
                                      hintText: "Email", 
                                      delegate: _viewModel,
                                    ),
                              
                                    CustomTextFormField(
                                      textFormFieldType: CustomTextFormFieldType.password, 
                                      hintText: "Password", 
                                      delegate: _viewModel,
                                    ),
                                              
                                    RoundedButton(
                                      context: context, 
                                      color: orange, 
                                      labelButton: 'Log in', 
                                      fnAction: (){
                                        _ctaButtonTapped(context);
                                      }
                                    ),
                                              
                                    Container(
                                      margin: const EdgeInsets.only( top: 30.0 ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, 'forgot-password');
                                        },
                                        child: const Text(
                                          'Forgot your password?',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17.0
                                          ),
                                        ),
                                      ),
                                    ),
                                              
                                    Container(
                                      margin: const EdgeInsets.only( top: 30.0 ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an account?",
                                            style: TextStyle(
                                              color: grey,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric( horizontal: 10.0 ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context, 'register');
                                              },
                                              child: Text(
                                                'Sign up',
                                                style: TextStyle(
                                                  color: orange,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.0
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                              
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                
                ]
              )
            )
          ],
        ),
    );
  }
}

extension UserActions on LoginPage {

  void _ctaButtonTapped( BuildContext context) {

    if(_viewModel.isFormValidate()) {
      _viewModel.login(
        email: _viewModel.loginModel?.email ?? "", 
        password: _viewModel.loginModel?.password ?? "",
      ).then((result) {
        switch(result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'tabs');
            break;
          case ResultStatus.error:
            if(result.error != null ) {
              errorStateProvider.setFailure(context: context, value: result.error!);
            }
            break;
        }
        });
    }

  }

}



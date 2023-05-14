import 'dart:ui';
import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/viewModel/WelcomePageViewModel.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/services.dart';

//Widgets
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {

  final WelcomePageViewModel viewModel;

  _WelcomePageState({ WelcomePageViewModel? welcomePageViewModel })
    : viewModel = welcomePageViewModel ?? DefaultWelcomePageViewModel();

  @override
  Widget build(BuildContext context) {

    viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white
      )
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1603232644140-bb47da511b92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=988&q=80'
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur( sigmaX: 1.0, sigmaY: 1.0 ),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric( horizontal: 50.0 ),
                child: HeaderText(text: 'COMIDA PARA MASCOTAS CULIACAN', color:Colors.white, fontWeight: FontWeight.bold,fontSize: 45.0)
              ),
              Container(
                padding: const EdgeInsets.symmetric( horizontal: 50.0, vertical: 30.0 ),
                child: const Text(
                  'Set exact location to find the right restaurants near you', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                  ),
                ),
              ),
              createElevatedButton(
                context: context, 
                color: orange, 
                labelButton: 'Log in', 
                fnAction: () {
                  Navigator.pushNamed(context, 'login');
                }
              ),
              createElevatedButton(    
                context: context, 
                labelButton: 'Connect with Google',
                labelColor: Colors.black,
                color: white,
                isWithIcon: true,
                shape: const StadiumBorder(),
                icon: const AssetImage('assets/google.png'),
                fnAction: () {
                  _signInWithGoogleTapped(context);
                }
              )
            ],
          ),
        ],
      )
    );
  }
}

extension UserAction on _WelcomePageState {

  _signInWithGoogleTapped( BuildContext context ){
    viewModel.loadingState.setLoadingState(isLoading: true);
    viewModel.signInWithGoogle().then((result) {
      switch( result.status ) {
        
        case ResultStatus.success:
          coordinator.showTabPage(context: context);
          break;
        case ResultStatus.error:
          viewModel.loadingState.setLoadingState(isLoading: false);
          if( result.error == null ) { return; }
          errorStateProvider.setFailure(context: context, value: result.error!);
          break;
      }
    });
  }
}

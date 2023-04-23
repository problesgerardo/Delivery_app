import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/features/presentation/state_providers/ErrorStateProvider.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:flutter/material.dart';

//Routes
import 'package:delivery_app/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ErrorStateProvider()),
      ChangeNotifierProvider(create: (_) => LoadingStateProvider())
    ],
    child: MyAppUserState(),);
  }
}

class MyAppUserState extends StatelessWidget with BaseView {
  MyAppUserState({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: coordinator.star(),
      builder: (
        BuildContext context, 
        AsyncSnapshot snapshot
      ) {
          if( snapshot.hasData ) {
            return MyApp(initialRoute: snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
    });
  }
}

class MyApp extends StatelessWidget {

  final String _initialRoute;
  
  MyApp({ required String initialRoute }) : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
        Locale('en', ''),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
    );
  }
}
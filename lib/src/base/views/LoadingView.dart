import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              backgroundColor: orange,
            ),
            SizedBox(height: 10.0,),
            Text('Loading....'),
          ],
        ),
      ),
    );
  }
}
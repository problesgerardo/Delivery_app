import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        elevation: 0.5,
        leading: Text(''),
        backgroundColor: white,
        title: HeaderText(
          text: "My Order",
          color: primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
       ),
       body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 216,
                width: 216,
                image: AssetImage('assets/emptyOrder.png')
              ),
              Container(
                margin: EdgeInsets.only( top: 20),
                child: HeaderText(
                  text: 'Cart Empty',
                  color: grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                margin: EdgeInsets.only( top: 20.0 ),
                padding: EdgeInsets.symmetric( horizontal: 30.0 ),
                child: HeaderText(
                  text: 'Good food is always cooking! Go ahead, order some yummy items from the menu',
                  color: grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  textAling: TextAlign.center
                ),
              )
            ],
          ),
        ),
       ),

    );
  }
}
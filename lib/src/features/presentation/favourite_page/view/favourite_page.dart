import 'package:delivery_app/src/features/presentation/widgets/cards/favourite_card.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Text(""),
            backgroundColor: white,
            title: HeaderText(
              text: "My Favourites",
              color: primaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 20.0 ),
                  child: Column(
                    children: [
                      FavouriteCard(
                        context: context, 
                        title: "Andy & Cindy's", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0, 
                        review: "4.2",
                        ratings: "(158 ratings)",
                        buttonText: "Delivery",
                        hasActionButton: true,
                        image: NetworkImage('https://media.istockphoto.com/photos/dog-food-picture-id1220090963'),
                        isFavourite: false
                      ),
                      FavouriteCard(
                        context: context, 
                        title: "Andy & Cindy's", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0, 
                        review: "4.2",
                        ratings: "(158 ratings)",
                        buttonText: "Delivery",
                        hasActionButton: true,
                        image: NetworkImage('https://media.istockphoto.com/photos/dog-food-picture-id1220090963'),
                        isFavourite: true
                      ),
                    ],
                  ),
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}

import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/cards/favourite_card.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 210,
            backgroundColor: orange,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image(
                    width: size.width,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/870588358/es/foto/tranquilo-perro-degustación-de-deliciosa-comida.jpg?s=2048x2048&w=is&k=20&c=-RDpuzRVCQ4pCVYZJ11DhD8BYFIWg5VuB0uw38OBL6I='
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: size.width,
                    height: double.infinity,
                  ),
                  Center(
                    child: HeaderText(
                      text: "Dog's \n Food",
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      textAling: TextAlign.center
                    ),
                  )
                ],
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return backButton(context, Colors.white);
              }
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 20.0 ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric( vertical: 20.0 ),
                        child: HeaderText(
                          text: '129 Places',
                          color: Color.fromRGBO(51, 58, 77, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                        ),
                      ),
                      Column(
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
                      )
                    ],
                  ),
                )
              ]
            )
          ),
        ],
      ),
    );
  }
}
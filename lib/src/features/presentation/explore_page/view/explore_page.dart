
import 'package:flutter/material.dart';

//Colors
import 'package:delivery_app/src/colors/colors.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:delivery_app/src/features/presentation/widgets/cards/populars_card.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.symmetric( horizontal: 16.0 ),
                  child: Column(
                    children: [

                      _topBar(context),

                      Container(
                        margin: const EdgeInsets.symmetric( vertical: 20.0 ),
                        alignment: Alignment.centerLeft,
                        
                        child: HeaderText(
                          text: 'Discover new places', 
                          color: Colors.black, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 30.0
                        ),

                      ),

                      _sliderCard(),

                      _headers(context, 'Popular this week', 'Show all', () {}),

                      PopularsCard(
                        context: context, 
                        title: "Andy & Cindy's Diner", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0,
                        review: "4.5",
                        ratings: "(230 ratings)",
                        buttonText: "Delivery",
                        hasActionButton: true,
                        image: NetworkImage('https://media.istockphoto.com/photos/food-for-dogs-and-cats-in-a-blue-bowl-picture-id919988044'),
                      ),
                      PopularsCard(
                        context: context, 
                        title: "Andy & Cindy's Diner", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0, 
                        review: "4.8",
                        ratings: "(400 ratings)",
                        buttonText: "Delivery",
                        hasActionButton: true,
                        image: NetworkImage('https://media.istockphoto.com/photos/dry-pet-food-picture-id1129601269'),
                      ),
                      PopularsCard(
                        context: context, 
                        title: "Andy & Cindy's Diner", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0, 
                        review: "4.2",
                        ratings: "(158 ratings)",
                        buttonText: "Delivery",
                        hasActionButton: true,
                        image: NetworkImage('https://media.istockphoto.com/photos/dog-food-picture-id1220090963'),
                      ),

                      SizedBox( height: 20.0, ),

                      _headers(context, 'Collections', 'Show all', () { Navigator.pushNamed(context, 'collection'); }),
                      
                      _sliderCollection(),
                    ],
                  ),
                ),
                
              ]
            )
          ),
        ],
      ) 
    );
    
  }
}

Widget _topBar( BuildContext context) {

  final size = MediaQuery.of(context).size;

  return Row(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          //width: 280,
          width: size.width * 0.70,
          padding: EdgeInsets.all( 10.0 ),
          margin: EdgeInsets.only( left: 16.0 ),
          decoration: BoxDecoration(
            border: Border.all( color: Color.fromRGBO( 234, 236, 239, 1.0 ) ),
            borderRadius: BorderRadius.circular( 20.0 )
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 20.0, color: grey,),
              Container(
                margin: EdgeInsets.only( left: 5.0 ),
                child: Text('Search', style: TextStyle(
                  color: grey,
                  fontSize: 17.0,
                ),),
              )
            ],
          ),
        ),
      ),
      
      Container(        
        width: 45.0,
        height: 45.0,
        margin: EdgeInsets.only( left: 10.0 ),
        decoration: BoxDecoration(
          color: Color.fromRGBO( 209, 209, 214, 1.0 ),
          borderRadius: BorderRadius.circular( 30.0 )
        ),
        child: IconButton(
          icon: Icon(Icons.filter_list, size: 30.0, color: Colors.white,),
          onPressed: () {
            Navigator.pushNamed(context, 'filter');
          }
        ),
      ),
    ],
  );
}

Widget _sliderCard() {
  return Container(
    height: 350,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: ( BuildContext context, int index ){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ( BuildContext context, int index ) {
            return _card( context );
          },
        );
      },
    ),
  );
}

Widget _card( BuildContext context) {

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place-detail');
    },
    child: Container(
      margin: EdgeInsets.all( 5.0 ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular( 20.0 ),
            child: Image(
              width: 210,
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://media.istockphoto.com/photos/bowl-with-pet-food-on-a-wooden-background-picture-id1403791973'
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only( top: 10.0 ),
                child: Text(
                  "Andy & Cindy's Diner",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "87 Botsford Circle Apt",
                  style: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: yellow, size: 16,),
                  Text(
                    "4.8", 
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "(233 ratings)",
                    style: TextStyle(
                      color: grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric( horizontal: 5.0),
                    width: 80.0,
                    height: 18.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        shape: StadiumBorder(),
                        primary: orange,
                        onPrimary: Colors.white
                      ),
                      
                      onPressed: () {},
                      child: Text(
                        'Delivery',
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _headers( BuildContext context, String textHeader, String textAction, VoidCallback fnAction ) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: HeaderText(text: textHeader, color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      Spacer(),
      GestureDetector(
        onTap: fnAction,
        child: Row(
          children: [
            Text(
              textAction,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15.0
              ),
            ),
            Icon( Icons.play_arrow ),
          ],
        ),
      ),
      
    ],
  );
}

Widget _sliderCollection() {
  return Container(
    height: 180.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: ( BuildContext context, int index ) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ( BuildContext context, int index ) {
            return _cardCollection(context);
          },
        );
      },
    ),
  );
}

Widget _cardCollection( BuildContext context ) {
  return Container(
    margin: EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://media.istockphoto.com/photos/yorkshire-terrier-lying-on-the-table-with-dog-goodies-picture-id1216662378'
            ),
          ),
        ),
      ],
    ),
  );
}
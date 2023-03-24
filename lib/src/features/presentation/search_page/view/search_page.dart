

import 'package:card_swiper/card_swiper.dart';
import 'package:delivery_app/src/features/presentation/widgets/cards/card_vertical.dart';
import 'package:delivery_app/src/features/presentation/widgets/cards/populars_card.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_double.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';

import '../../widgets/headers/header_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon( Icons.close, color: Colors.black, size: 30.0, ),
              onPressed: () => Navigator.pop(context),
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
                        margin: EdgeInsets.only( top: 20.0 ),
                        alignment: Alignment.centerLeft,
                        child: HeaderText(text: 'Search', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0)
                      ),

                      _searchInput(context),

                      SizedBox( height: 40.0 ,),

                      HeaderDoubleText( textHeader: 'Recent search', textAction: 'Clear all'),

                      _sliderRecentSearch(),

                      SizedBox( height: 10.0 ),

                      HeaderDoubleText(textHeader: "Recommend for you", textAction: "",  ),

                      PopularsCard(
                        context: context, 
                        title: "Kellys cafe & espresso", 
                        subtitle: "882 Swift Courts 918", 
                        marginLeft: 0.0,
                        review: "4.5",
                        ratings: "(230 ratings)",
                        hasActionButton: false,
                        image: NetworkImage('https://media.istockphoto.com/photos/food-for-dogs-and-cats-in-a-blue-bowl-picture-id919988044'),
                      ),
                      PopularsCard(
                        context: context, 
                        title: "Panda inn Mongolian bar", 
                        subtitle: "441 Bria flat Apt 120", 
                        marginLeft: 0.0, 
                        review: "4.8",
                        ratings: "(400 ratings)",
                        hasActionButton: false,
                        image: NetworkImage('https://media.istockphoto.com/photos/dry-pet-food-picture-id1129601269'),
                      ),
                      PopularsCard(
                        context: context, 
                        title: "Juanito's taqueria", 
                        subtitle: "87 Botsford Circle Apt", 
                        marginLeft: 0.0, 
                        review: "4.2",
                        ratings: "(158 ratings)",
                        hasActionButton: false,
                        image: NetworkImage('https://media.istockphoto.com/photos/dog-food-picture-id1220090963'),
                      )

                    ],
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context){
  return Container(
    height: 40.0,
    margin: EdgeInsets.only( top: 20.0 ),
    padding: EdgeInsets.only( left: 5.0 ),
    decoration: BoxDecoration(
      color: Color.fromRGBO(142, 142, 147, 1.2),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only( top: 5.0 ),
        prefixIcon: Icon( Icons.search, color: grey,),
        hintText: 'Search',
        border: OutlineInputBorder( borderSide: BorderSide.none ),
      ),
    ),
  );
}

Widget _sliderRecentSearch() {
  return Container(
    margin: EdgeInsets.only( top: 5.0 ),
    height: 190.0,
    child: Swiper(
      itemCount: 4,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return CardVertical(
              context: context, 
              width: 160, 
              height: 120, 
              image: NetworkImage('https://media.istockphoto.com/photos/natural-meat-dog-food-or-dry-food-picture-id506677536'),
              title: "Andy & Cindy's Diner",
              subtitle: "87 Botsford circle Apt", 
            );
          }
        );
      },
    ),
  );
}




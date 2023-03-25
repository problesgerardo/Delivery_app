import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: HeaderText(
              text: 'Collections',
              color: Colors.black,
              fontSize: 17,
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return backButton( context, Colors.black);
              }
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only( left: 10, right: 10 ),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0 ,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          )
        ],
      ),
    );
  }
} 

Widget _card( BuildContext context ) {

  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'collection-detail');
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular( 10.0 ),
          child: Image(
            width: size.width * 0.45,
            height: 190,
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://media.istockphoto.com/photos/yorkshire-terrier-lying-on-the-table-with-dog-goodies-picture-id1216662378'
            ),
          ),
        ),
        Container(
          width:size.width * 0.45,
          height: 190,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 1.5),
            borderRadius: BorderRadius.circular( 10.0 ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only( right: 35, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HeaderText(text: "Dog's", color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              HeaderText(text: "Dog's", color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),

            ]
          ),
        )
      ],
    ),
  );
}
import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_double.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){}, 
        backgroundColor: orange,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0)),
        label: HeaderText(
          text: 'Añadir a Carrito  100.00',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 17.0
        )
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: size.height * 0.31,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: size.height * 0.38,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://media.istockphoto.com/id/1332121764/es/foto/diferentes-alimentos-para-mascotas-en-tazones-de-alimentación-en-el-piso-interior-espacio-para.jpg?s=2048x2048&w=is&k=20&c=JzfXhY2WVTWg2RJBijMLSH_dDWgXLAQVzf9nEtdNaAk=',
                    )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 1.5),
                    ),
                    width: double.infinity,
                    height: size.height * 0.38,
                  ),
                  Wrap(
                    children: [
                      _promoButton(),
                      _infoPlace(),
                      _infoPlaceStats(),
                      //_offerBanner(),
                    ],
                  )
                ],
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return backButton(
                  context,
                  Colors.white
                );
              },
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Image(
                  width: 28,
                  height: 28,
                  image: AssetImage('assets/share.png'),
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _headers( texto: "Featured Items" ),
                _sliderCard(),
                _headers( texto: "Full Menu" ),
                _menuList( context),
                _headers( texto: "Reviews" ),
                _reviews(),
                _headers( texto: "Your Rating" ),
                _yourRating( context ),
                SizedBox( height: 150.0,),
              ]
            )
          ),
        ],
      ),
    );
  }
}


Widget _promoButton() {
  return Container(
    margin: EdgeInsets.only( top: 121, left: 30.0, right: 15.0 ),
    width: double.infinity,
    height: 25.0,
    /* child: Row(
      children: [
        /* ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.5,
            shape: StadiumBorder(),
            primary: orange,
            onPrimary: Colors.white
          ),
          onPressed: () {}, 
          child: HeaderText(
            text: 'Free Delivery',
            color: Colors.white,
            fontSize: 12.0, 
          )
        ) */
      ],
    ), */
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric( horizontal: 30.0 ),
        margin: EdgeInsets.symmetric( vertical: 7.0 ),
        child: HeaderText(
          text: "Boon Lay Ho Huat Fried Prawn Noodle",
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.bold
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric( horizontal: 30.0 ),
        child: Row(
          children: [
            Icon(Icons.location_on, color: grey,),
            HeaderText(
              text: "03 Jameson Manors Apt. 177",
              color: grey,
              fontSize: 15.0,
              fontWeight: FontWeight.w500
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _infoPlaceStats() {

  return Container(
    margin: EdgeInsets.only( top: 26.0 ),
    padding: EdgeInsets.symmetric( horizontal: 40.0 ),
    height: 70.0,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: Colors.white)
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 19.0,
                ),
                HeaderText(
                  text: "4.5",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                )
              ],
            ),
            HeaderText(
              text: "351 Ratings",
              color: grey,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            )
          ],
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border( right: BorderSide(color: Colors.white)),
          ),

        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 19.0,
                ),
                HeaderText(
                  text: "137K",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                )
              ],
            ),
            HeaderText(
              text: "Bookmark",
              color: grey,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            )
          ],
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border( right: BorderSide(color: Colors.white)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.photo,
                  color: Colors.white,
                  size: 19.0,
                ),
                HeaderText(
                  text: "346",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                )
              ],
            ),
            HeaderText(
              text: "Photo",
              color: grey,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            )
          ],
        ),
      ]
    ),
  );
}

Widget _offerBanner() {
  return Container(
    color: Color.fromRGBO(255, 237, 214, 1.0),
    padding: EdgeInsets.all(10),
    height: 90.0,
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              text: "New Try Pickup",
              color: orange,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),
            HeaderText(
              text: "Pickup on your time. Your order is \nready when you are",
              color: primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 13.0
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: (){}, 
          style: ElevatedButton.styleFrom(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            primary: orange,
          ),
          child: HeaderText(
            text: "Order Now",
            color: Colors.white,
            fontSize: 13.0, 
            fontWeight: FontWeight.bold
          )
        )
      ],
    ),
  );
}

Widget _headers({ texto: String }) {
  return Container(
    margin: EdgeInsets.only( top: 20.0, bottom: 5.0 ),
    padding: EdgeInsets.symmetric( horizontal: 20.0 ),
    child: HeaderDoubleText(
      textHeader: texto,
    ),
  );
}

Widget _sliderCard() {
  return Container(
    height: 210.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: ( BuildContext _, int index ) {
        return _cards();
      }
    ),
  );
}

Widget _cards() {
  return Container(
    margin: EdgeInsets.all( 8.0 ),
    padding: EdgeInsets.only( left: 10.0 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular( 8.0 ),
          child: Image(
            width: 200.0,
            height: 100,
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://images.unsplash.com/photo-1592468257342-8375cb556a69?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only( top: 10.0 ),
          child: HeaderText(
            text: "Peanut Chaat with Dahi",
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: HeaderText(
            text: "9.50 ",
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: grey,
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only( top: 10),
              child: HeaderText(
                text: "Selecciona ",
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: orange,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 90),
              child: Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/plus_order.png'),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _menuList( BuildContext context) {
  return Container(
    padding: EdgeInsets.only( left: 10.0 ),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '4'),
        _menuItem(context, 'Vegetables', '7'),
      ],
    ),
  );
}

Widget _menuItem ( BuildContext context, String texto, String itemCount) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: grey))
    ),
    child: Column(
      children: [
        ListTile(
          title: HeaderText(
            text: texto,
            fontWeight: FontWeight.w300,
            fontSize: 17.0
          ),
          trailing: HeaderText(
            text: itemCount,
            fontWeight: FontWeight.w300,
            fontSize: 17.0
          ),
        ),
        _sliderCard()
      ],
    ),
  );
}

Widget _reviews(){
  return Container(
    height: 135,
    padding: EdgeInsets.only(left: 10.0),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _cardReviews(context);
      }
    )
  );
}

Widget _cardReviews(BuildContext context) {

  final size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 10.0, right: 10.0 ),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular( 8.0 ),
              child: Image(
                width: size.width * 0.12, //49.0,
                height: 43.0,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80'
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only( left: 10.0 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                    text: "Gerardo Perez",
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  ),
                  HeaderText(
                    text: "45 Reviews",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: grey
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orange,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "4",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only( top: 10.0 ),
          child: HeaderText(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet orci nisi. Duis eu imperdiet mauris.",
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: grey,
            textAling: TextAlign.left
          ),
        ),
        Container(
          margin: EdgeInsets.only( top: 10.0 ),
          child: HeaderText(
            text: "See full review",
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            color: orange,
          ),
        ),
      ],
    ),
  );
}

Widget _yourRating( BuildContext context) {

  final size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only( top: 10.0 ),
    padding: EdgeInsets.only( left: 10.0, right: 10.0 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orangeOp,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "1",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orangeOp,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "2",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orangeOp,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "3",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orange,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "4",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular( 8.0 ),
                child: Container(
                  color: orangeOp,
                  width: size.width * 0.14,
                  height: size.width * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(
                        text: "5",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      Icon(Icons.star, color: Colors.white, size: 14,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only( top: 10.0, left: 20 ),
          child: HeaderText(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet orci nisi. Duis eu imperdiet mauris.",
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: grey,
            textAling: TextAlign.left
          ),
        ),
        Container(
          margin: EdgeInsets.only( top: 10.0, left: 20 ),
          child: HeaderText(
            text: "+ Edit your review", // Cuando tenga review
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
            color: orange,
            textAling: TextAlign.left
          ),
        ),
      ],
    ),
  );
}
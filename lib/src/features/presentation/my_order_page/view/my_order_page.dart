import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/my_order_page/view/components/empty_order_view.dart';

import 'package:delivery_app/src/colors/colors.dart';


class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {

  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      body: emptyOrderState ? EmptyOrderView() : CustomScrollView(
        slivers: [
          SliverAppBar(
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 10.0 ),
                  child: Column(
                    children: [
                      _orders(context),
                      SizedBox( height: 30.0 ,),
                      _checkoutResume(context),
                    ],
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}

Widget _orders( BuildContext context) {
  return Column(
    children: [
      _cardOrder(context)
    ],
  );
}

Widget _cardOrder(BuildContext context) {
   return Container(
    padding: EdgeInsets.symmetric( horizontal: 10.0 ),
    margin: EdgeInsets.symmetric( vertical: 10.0 ),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular( 10 ),
      color: Color.fromRGBO(248, 248, 248, 1.0),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0
        )
      ]
    ),
    child: Column(
      children: [
        Row(
          children: [
            _cardOrderTopContent()
          ],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context),
          ],
        ),
        _moreContent(context),
      ],
    ),
   );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: EdgeInsets.symmetric( vertical: 10.0 ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only( top: 7.0, bottom: 7.0, right: 20.0 ),
          child: HeaderText(
            text: "Little Creatures - Club Street",
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on, 
                color: grey,
                size: 16.0,
              ),
              HeaderText(
                text: "87 Botsford Circle Apt",
                color: grey,
                fontWeight: FontWeight.w500,
                fontSize: 14.0
              ),
              Container(
                margin: EdgeInsets.symmetric( horizontal: 10.0 ),
                width: 110,
                height: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.5,
                    shape: StadiumBorder(),
                    primary: orange,
                    onPrimary: Colors.white
                  ),
                      
                  onPressed: () {},
                  child: HeaderText(
                    text: 'Free Delivery',
                    fontSize: 11,
                    color: white
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border( bottom: BorderSide(color: Theme.of(context).dividerColor ))
    ),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText( text: "Special Gajananad Bhel", fontWeight: FontWeight.w300, fontSize: 15.0,  ),
          HeaderText( text: "Mixed Vegetables, Chicken Egg", fontWeight: FontWeight.w300, fontSize: 12.0, color: grey),
        ],
      ),
      trailing: HeaderText( text: "\$17.20 MXN", fontWeight: FontWeight.w500, fontSize: 15.0, color: grey),
    ),
  );
}

Widget _moreContent(BuildContext context) {
  return Container(
    child: ListTile(
      title: HeaderText( 
        text: "Add more items",
        color: pink,
        fontSize: 17.0,
        fontWeight: FontWeight.w600
      ),
    ),
  );
}

Widget _checkoutResume(BuildContext context) {
  return Container(
    padding: EdgeInsets.all( 10.0 ),
    margin: EdgeInsets.symmetric( vertical: 10.0 ),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular( 10.0 ),
      color: white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(210, 211, 215, 1.0),
          spreadRadius: 1.0,
          blurRadius: 4.0,
        )
      ]
    ),
    child: Column(
      children: [
        _itemsCheckoutResume(title: "Subtotal", value: "\$93.40", context: context),
        _itemsCheckoutResume(title: "Tax & Fees", value: "\$2.00", context: context),
        _itemsCheckoutResume(title: "Delivery", value: "Free", context: context),

        _buttonCheckout( context ),
      ],
    ),
  );
}

Widget _itemsCheckoutResume( { title: String, value: String, context: BuildContext } ) {
  return Container(
    decoration: BoxDecoration(
      border: Border( 
        bottom: BorderSide( color: Theme.of(context).dividerColor)
      )
    ),
    child: ListTile(
      title: HeaderText(
        text: title,
        fontWeight: FontWeight.w400,
        fontSize: 15.0
      ),
      trailing: HeaderText(
        text: value,
        fontWeight: FontWeight.w500,
        fontSize: 15.0
      ),
    ),
  );
}

Widget _buttonCheckout( BuildContext context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: EdgeInsets.only( top: 10.0 ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 11 ) ),
        backgroundColor: orange,
        foregroundColor: Colors.white
      ),
          
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: EdgeInsets.only( left: 50.0),
            child: HeaderText(
              text: "Checkout",
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: white
            ),
          ),
          Container(
            child: HeaderText(
              text: "\$95.40",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: white
            ),
          ),
        ],
      )
    ),
  );
}
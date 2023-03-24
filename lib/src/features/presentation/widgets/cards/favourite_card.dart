import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';

Widget FavouriteCard({
  required BuildContext context, 
  double marginTop = 15.0,
  double marginBottom = 0.0,
  double marginLeft = 0.0,
  double marginRight = 0.0,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
  required String review,
  required String ratings,
  String buttonText = "",
  required bool hasActionButton,
  bool isFavourite = true,
}) {

  final size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.only(
      top: marginTop,
      bottom: marginBottom,
      left: marginLeft,
      right: marginRight
    ),
    padding: EdgeInsets.only( left: 5.0, top: 20, bottom: 20 ),
    width: double.infinity,
    decoration: createBoxDecorationShadows(),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image( 
            width: size.width * 0.23, 
            height: size.width * 0.23,
            fit: BoxFit.cover,
            image: image,
          ),
        ),
        Container(
          padding: EdgeInsets.only( left: 5.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric( vertical: 7.0 ),
                    child: HeaderText(
                      text: title,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  SizedBox( width: size.width * 0.08 ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(
                      Icons.bookmark,
                      size: 35.0,
                      color: isFavourite ? pink : Colors.grey[300],
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only( bottom: 5.0 ),
                child: HeaderText(
                  text: subtitle,
                  color: grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0
                ),
              ),
              Row(
                 children: [
                  Icon(
                    Icons.star,
                    color: yellow,
                    size: 16.0,
                  ),
                  HeaderText(
                    text: review,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                  HeaderText(
                    text: ratings,
                    color: grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric( horizontal: 15.0 ),
                    width: size.width * 0.23,
                    height: 25.0,
                    // child: ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     elevation: 0.5,
                    //     shape: StadiumBorder(),
                    //     backgroundColor: orange,
                    //   ),
                    //   child: HeaderText(
                    //     text: buttonText,
                    //     fontSize: 11.0,
                    //     color: Colors.white
                    //   ),
                    // ),
                  )
                 ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
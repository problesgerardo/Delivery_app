import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/utils/extensions/screen_size.dart';
import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {


  final String bgImage;

  const AvatarView({
    super.key,
    required this.bgImage,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          //decoration: createBoxDecorationShadows(borderRadius: BorderRadius.circular( 10 )),
          child: CircleAvatar(
            backgroundImage: NetworkImage( bgImage ),
          ),
        ),
        Transform.translate(
          offset: Offset( 0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: pink,
              borderRadius: BorderRadius.circular( 20.0 ),
            ),
            child: Icon(Icons.camera_alt, color: white, size: 20.0 ,),
          ),
        )
      ]
    );
  }
}
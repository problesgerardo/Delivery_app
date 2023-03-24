
import 'package:delivery_app/src/features/presentation/profile_detail_page/components/textfield_view.dart';
import 'package:delivery_app/src/utils/styles/box_decoration_shadows.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/widgets/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/utils/extensions/screen_size.dart';

import 'components/avatar_view.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        title: HeaderText(
          text: "Edit Profile",
          fontSize: 17,
        ),
        backgroundColor: white,
        elevation: 0.4,
        leading: Builder(builder : (BuildContext context) {
          return backButton(context, Colors.black);
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only( top: 20.0, right: 15.0),
              child: HeaderText(
                text: 'Done',
                color: orange,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only( 
                    top: screenHeight.getScreenHeight(context: context, multiplier: 0.1 ), 
                    right: 15.0, 
                    left: 15.0 
                  ),
                  decoration: createBoxDecorationShadows(),
                  width: screenWidth.getScreenWidth(context: context),
                  height: screenHeight.getScreenHeight(context: context, multiplier: 0.85 ),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset( 0, -60),
                        child: AvatarView(
                          bgImage: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                        ),
                      ),
                      TextfieldProfileView()
                    ]
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
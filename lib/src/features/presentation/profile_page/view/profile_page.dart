import 'package:delivery_app/src/features/presentation/profile_page/model/ProfileTabViewModel.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/view/welcome_page.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/widgets/headers/header_text.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:provider/provider.dart';

import '../../widgets/alerts/alert_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileTabViewModel _viewModel;

  _ProfilePageState({ ProfileTabViewModel? profileTabViewModel })
    : _viewModel = profileTabViewModel ?? DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {

    //Inicializamos el ViewModel
    _viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  GestureDetector (
                    onTap: () => Navigator.pushNamed(context, 'profile-detail'),
                    child: _header(context)
                  ),
                  _contentProfile(context),
                ],
              ),
            ]
          ))
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {

  final sizeHeight = MediaQuery.of(context).size.height;
  final sizeWidth = MediaQuery.of(context).size.width;

  return Container(
    height: sizeHeight * 0.25,
    color: bgGrey,
    padding: EdgeInsets.all( sizeWidth * 0.05 ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80'
          ),
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only( left: 20.0 ),
              child: Row(
                children: [
                  HeaderText(
                    text: "Gerardo Perez",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chevron_right, color: grey, )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only( left: 20.0 ),
              height: sizeHeight * 0.03,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),
                  primary: pink,
                ),
                    
                onPressed: () {},
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/crown.png'),
                      width: 16,
                      height: 16,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: HeaderText(
                        text: "VIP Member",
                        color: white,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    )
  );
}

Widget _contentProfile( BuildContext context) {

  final sizeHeight = MediaQuery.of(context).size.height;

  return Container(
    padding: EdgeInsets.all( 10.0 ),
    child: Column(
      children: [
        ListTile(
          leading: Image(
            image: const AssetImage('assets/noti.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Notifications',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/payicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Payment Method',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/rewardicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Reward Credit',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/promoicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'My Promo Code',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        const SizedBox( height: 20.0,),

        ListTile(
          leading: Image(
            image: const AssetImage('assets/settingicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Settings',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/inviteicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Invite Friends',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/helpicon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Help Center',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/abouticon.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'About Us',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,)
        ),
        ListTile(
          leading: Image(
            image: const AssetImage('assets/logout.png'),
            width: sizeHeight * 0.035,
            height: sizeHeight * 0.035,
          ),
          title: HeaderText(
            text: 'Sign Out',
            fontWeight: FontWeight.w400,
          ),
          trailing: Icon(Icons.chevron_right, color: grey,),
          onTap: () => _signOut(context),
        ),
      ],
    ),
  );
}


  Future _signOut( BuildContext context ) async {

    ShowAlertDialog(
      context,
      AssetImage('assets/logout.png'),
      "Sign Out",
      "Do you want Sign Out?",
      createElevatedButton(
        context: context, 
        color: orange, 
        labelButton: "Log Out", 
        fnAction: () {
          _viewModel.signOut().then((_) {
            Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => const WelcomePage(),
              transitionDuration: const Duration(seconds: 0)
            ));
          });
        }
      )

    );

  }
}



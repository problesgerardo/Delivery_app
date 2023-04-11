
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/ErrorAlertView.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/alert_dialog.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/explore_page/view/explore_page.dart';
import 'package:delivery_app/src/features/presentation/favourite_page/view/favourite_page.dart';
import 'package:delivery_app/src/features/presentation/my_order_page/view/my_order_page.dart';
import 'package:delivery_app/src/features/presentation/profile_page/view/profile_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pedirLocation(context);
    });
  }

  List<Widget> _widgetOptions = [
    ExplorePage(),
    MyOrderPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  int _selectedItemIndex = 0;

  void _widgetChange ( int index ) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar( context ),
    );
  }

  Widget _bottomNavigationBar( BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _widgetChange,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'My order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: 'Profile',
        ),
      ],
    );
  }

  Future _pedirLocation (BuildContext context) async {
    ShowAlertDialog(
      context, 
      AssetImage('assets/location.png'), 
      "Enable your location", 
      "Please allow to use your location to show nearby restaurant on the map.", 
      //_doneButton(context, 'Enable Location'),
      RoundedButton(
        context: context, 
        color: orange, 
        labelButton: 'Enable Location', 
        fnAction: (){
          print('Habilitar geolocation');
        }
      ),
    );
  }
}





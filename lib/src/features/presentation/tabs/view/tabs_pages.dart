
import 'package:delivery_app/src/base/views/BaseView.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/state_providers/LoadingStateProvider.dart';
import 'package:delivery_app/src/features/presentation/tabs/viewModel/TabsPageViewModel.dart';
import 'package:delivery_app/src/features/presentation/widgets/alerts/alert_dialog.dart';
import 'package:delivery_app/src/features/presentation/widgets/buttons/rounded_button.dart';
import 'package:delivery_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:delivery_app/src/utils/helpers/ResultTypes/ResultType.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app/src/features/presentation/explore_page/view/explore_page.dart';
import 'package:delivery_app/src/features/presentation/favourite_page/view/favourite_page.dart';
import 'package:delivery_app/src/features/presentation/my_order_page/view/my_order_page.dart';
import 'package:delivery_app/src/features/presentation/profile_page/view/profile_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {

  //Dependencias
  final TabsPageViewModel viewModel;

  _TabsPageState({ TabsPageViewModel? tabsViewModel })
    : viewModel = tabsViewModel ?? DefaultTabsPageViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      viewModel.loadingState.setLoadingState(isLoading: true);

      final LocationPermissionStatus currentStatus = await viewModel.getPermissionStatus();

      switch( currentStatus ) {

        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
          break;
        
        default:
          viewModel.loadingState.setLoadingState(isLoading: false);
          break;
      }

      _getCurrentPosition(context);
    });
  }

  List<Widget> widgetOptions = [
    const ExplorePage(),
    const MyOrderPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {

    viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingState.isLoading ? loadingView : Scaffold(
      body: widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar( context ),
    );
  }



}


extension PriviteMethods on _TabsPageState {

    Widget _bottomNavigationBar( BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _widgetChange,
      showUnselectedLabels: true,
      items: const <BottomNavigationBarItem>[
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

  Future _getCurrentPosition (BuildContext context) async {
    ShowAlertDialog(
      context, 
      const AssetImage('assets/location.png'), 
      "Enable your location", 
      "Please allow to use your location to show nearby restaurant on the map.", 
      //_doneButton(context, 'Enable Location'),
      createElevatedButton(
        context: context, 
        color: orange, 
        labelButton: 'Enable Location', 
        fnAction: (){
          
          viewModel.getCurrentPosition().then((result) {
            switch( result.status ) {
              
              case ResultStatus.success:
                viewModel.loadingState.setLoadingState(isLoading: false);
                _closeAlertDialog(context);
                break;
              case ResultStatus.error:
                _closeAlertDialog(context);
                errorStateProvider.setFailure(context: context, value: result.error!);
                break;
            }
          });
        }
      ),
    );
  }

  _closeAlertDialog( BuildContext context) {
    Navigator.pop(context);
  }
}

extension UserAction on _TabsPageState {
  void _widgetChange ( int index ) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}




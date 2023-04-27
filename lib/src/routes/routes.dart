

import 'package:flutter/material.dart';

//Pages
import 'package:delivery_app/src/features/presentation/collection_detail_page.dart/collection_detail_page.dart';
import 'package:delivery_app/src/features/presentation/collections/view/collection_page.dart';
import 'package:delivery_app/src/features/presentation/filter_page/view/filter_page.dart';
import 'package:delivery_app/src/features/presentation/forgot_password/view/forgot_password.dart';
import 'package:delivery_app/src/features/presentation/login_page/view/login_page.dart';
import 'package:delivery_app/src/features/presentation/places_detail_page/view/place_detail_page.dart';
import 'package:delivery_app/src/features/presentation/profile_detail_page/profile_detail_page.dart';
import 'package:delivery_app/src/features/presentation/register_page/view/register_page.dart';
import 'package:delivery_app/src/features/presentation/search_page/view/search_page.dart';
import 'package:delivery_app/src/features/presentation/tabs/view/tabs_pages.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/view/welcome_page.dart';

final routes = <String, WidgetBuilder> {
  'welcome'             : ( BuildContext context) => WelcomePage(),
  'login'               : ( BuildContext context) => LoginPage(),
  'forgot-password'     : ( BuildContext context) => ForgotPassword(),
  'register'            : ( BuildContext context) => RegisterPage(),
  'tabs'                : ( BuildContext context) => TabsPage(),
  'search'              : ( BuildContext context) => SearchPage(),
  'filter'              : ( BuildContext context) => FilterPage(),
  'collection'          : ( BuildContext context) => CollectionPage(),
  'collection-detail'   : ( BuildContext context) => CollectionDetailPage(),
  'place-detail'        : ( BuildContext context) => PlaceDetailPage(),
  'profile-detail'      : ( BuildContext context) => ProfileDetailPage(),
};
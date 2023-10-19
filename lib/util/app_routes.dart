import 'package:flutter/material.dart';
import 'package:to_do_app/screen/details_screen.dart';
import 'package:to_do_app/screen/home_data_screen.dart';

Map<String, WidgetBuilder> screenRoutes={
  '/':(context) => HomeDataScreen(),
  'detail': (context) => DetailsScreen(),
};
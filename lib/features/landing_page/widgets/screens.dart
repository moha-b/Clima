import 'package:clima/features/home/screens/home_screen.dart';
import 'package:clima/features/map/screens/map_screen.dart';
import 'package:flutter/material.dart';

import '../../forecast_5_days/screens/forecast_5_days_screen.dart';

const List<Widget> screens = <Widget>[
  HomeScreen(),
  MapScreen(),
  Forecast5DaysScreen(),
];

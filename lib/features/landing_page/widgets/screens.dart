import 'package:clima/features/home/screens/home_screen.dart';
import 'package:clima/features/hourly_forecast/screens/hourly_forecast_screen.dart';
import 'package:flutter/material.dart';

import '../../daily_forecast/screens/daily_forecast_screen.dart';

const List<Widget> screens = <Widget>[
  HomeScreen(),
  HourlyForecastScreen(),
  Forecast5DaysScreen(),
];

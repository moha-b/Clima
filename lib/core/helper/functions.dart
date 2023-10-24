import 'package:clima/core/helper/lotte_cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/get_it_service.dart';
import 'bloc_observer.dart';
import 'converter_helper.dart';

String convertTimeToReadableDate(int time) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  return DateFormatter.format(dateTime);
}

String convertTemperatureToCelsius(double temperature) {
  double temperatureInCelsius =
      TemperatureConverter.kelvinToCelsius(temperature);
  return '${temperatureInCelsius.round()}°';
}

// Check if it's night or day based on sunrise and sunset timestamps
bool isNightTime(int sunriseTimestamp, int sunsetTimestamp) {
  int currentTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
  return currentTimestamp < sunriseTimestamp ||
      currentTimestamp > sunsetTimestamp;
}

String mapWeatherState(String apiWeatherMain) {
  switch (apiWeatherMain.toLowerCase()) {
    case 'thunderstorm':
      return 'Storm';
    case 'drizzle':
    case 'rain':
      return 'Rain';
    case 'snow':
      return 'Snow';
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'sand':
    case 'ash':
    case 'squall':
    case 'tornado':
      return 'Wind';
    case 'clear':
      return 'Clear';
    case 'clouds':
      return 'Clouds';
    default:
      return 'Unknown';
  }
}

initialization() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  LottieCache.cache();
}

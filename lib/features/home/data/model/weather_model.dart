import 'package:clima/core/global/enums.dart';
import 'package:clima/features/home/data/model/weather_theme.dart';

class OpenMeteoCurrentResponse {
  String time;
  num temperature;
  int isDay;
  int weatherCode;

  OpenMeteoCurrentResponse({
    required this.time,
    required this.temperature,
    required this.isDay,
    required this.weatherCode,
  });

  factory OpenMeteoCurrentResponse.fromJson(Map<String, dynamic> json) {
    return OpenMeteoCurrentResponse(
      time: json['current']['time'],
      temperature: json['current']['temperature_2m'],
      isDay: json['current']['is_day'],
      weatherCode: json['current']['weather_code'],
    );
  }
}

class WeatherData {
  final String date;
  final num temperature;
  final WeatherState weatherState;
  final WeatherTheme theme;
  final bool isDay;

  WeatherData({
    required this.date,
    required this.temperature,
    required this.weatherState,
    required this.theme,
    required this.isDay,
  });
}

class WeatherModel {
  final num time;
  final String weatherState;
  final num temperature;
  final String cityName;
  final Sys sys;

  WeatherModel({
    required this.time,
    required this.weatherState,
    required this.temperature,
    required this.cityName,
    required this.sys,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      time: json['dt'],
      weatherState: json['weather'][0]['main'],
      temperature: json['main']['temp'],
      cityName: json['name'],
      sys: Sys.fromJson(json['sys']),
    );
  }
}

class Sys {
  final num sunrise;
  final num sunset;

  Sys({
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

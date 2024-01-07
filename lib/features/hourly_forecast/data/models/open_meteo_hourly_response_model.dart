import 'package:clima/features/hourly_forecast/data/models/weather_daily_model.dart';
import 'package:clima/features/hourly_forecast/data/models/weather_hourly_model.dart';

class OpenMeteoHourlyResponse {
  WeatherHourly hourly;
  WeatherDaily daily;

  OpenMeteoHourlyResponse({
    required this.hourly,
    required this.daily,
  });

  factory OpenMeteoHourlyResponse.fromJson(Map<String, dynamic> json) =>
      OpenMeteoHourlyResponse(
        hourly: WeatherHourly.fromJson(json["hourly"]),
        daily: WeatherDaily.fromJson(json["daily"]),
      );
}

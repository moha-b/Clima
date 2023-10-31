import '../../../daily_forecast/data/models/forecast_5_days_model.dart';

class HourlyForecast {
  String date;
  String humidity;
  String temperature;
  String description;
  String main;
  String image;
  MainWeatherData data;

  HourlyForecast({
    required this.date,
    required this.humidity,
    required this.temperature,
    required this.description,
    required this.main,
    required this.image,
    required this.data,
  });
}
import '../../../daily_forecast/data/models/forecast_5_days_model.dart';

class HourlyForecast {
  String hours;
  String day;
  String humidity;
  String temperature;
  String description;
  String main;
  String image;
  MainWeatherData data;
  bool isExpanded;

  HourlyForecast(
      {required this.hours,
      required this.day,
      required this.humidity,
      required this.temperature,
      required this.description,
      required this.main,
      required this.image,
      required this.data,
      required this.isExpanded});
}

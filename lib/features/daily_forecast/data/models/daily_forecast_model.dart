import 'dart:ui';

class DailyForecast {
  String date;
  String humidity;
  String temperature;
  String description;
  String main;
  String image;
  Color textColor;

  DailyForecast({
    required this.date,
    required this.humidity,
    required this.temperature,
    required this.description,
    required this.main,
    required this.image,
    required this.textColor,
  });
}

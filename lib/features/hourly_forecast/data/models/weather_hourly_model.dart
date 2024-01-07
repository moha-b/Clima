class WeatherHourly {
  final List<String> time;
  final List<num> temperature;
  final List<int> humidity;
  final List<int> isDay;
  final List<int> weatherCode;

  List<String> image;

  WeatherHourly({
    required this.time,
    required this.temperature,
    required this.humidity,
    required this.isDay,
    required this.weatherCode,
    required this.image,
  });

  factory WeatherHourly.fromJson(Map<String, dynamic> json) {
    return WeatherHourly(
      time: List<String>.from(json['time']),
      temperature: List<double>.from(json['temperature_2m']),
      humidity: List<int>.from(json['relative_humidity_2m']),
      isDay: List<int>.from(json['is_day']),
      weatherCode: List<int>.from(json['weather_code']),
      image: [],
    );
  }
}

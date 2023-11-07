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

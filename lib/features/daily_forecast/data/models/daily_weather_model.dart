class DailyWeatherModel {
  List<String?> time;
  List<String?> image;
  List<num?> temperature;
  List<num?> apparentTemperature;
  List<num?> uvIndexMax;
  List<num?> rainSum;
  List<num?> snowfallSum;
  List<num?> windSpeed10mMax;

  DailyWeatherModel({
    required this.time,
    required this.image,
    required this.temperature,
    required this.apparentTemperature,
    required this.uvIndexMax,
    required this.rainSum,
    required this.snowfallSum,
    required this.windSpeed10mMax,
  });
}

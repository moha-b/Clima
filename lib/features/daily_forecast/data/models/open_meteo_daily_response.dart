class OpenMeteoDailyResponse {
  List<String?> time;
  List<int?> weatherCode;
  List<num?> temperature2mMax;
  List<num?> temperature2mMin;
  List<num?> apparentTemperatureMax;
  List<num?> apparentTemperatureMin;
  List<num?> uvIndexMax;
  List<num?> rainSum;
  List<num?> snowfallSum;
  List<num?> windSpeed10mMax;

  OpenMeteoDailyResponse({
    required this.time,
    required this.weatherCode,
    required this.temperature2mMax,
    required this.temperature2mMin,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMin,
    required this.uvIndexMax,
    required this.rainSum,
    required this.snowfallSum,
    required this.windSpeed10mMax,
  });

  factory OpenMeteoDailyResponse.fromJson(Map<String, dynamic> json) {
    return OpenMeteoDailyResponse(
      time: List<String?>.from(json['daily']['time']),
      weatherCode: List<int?>.from(json['daily']['weather_code']),
      temperature2mMax: List<num?>.from(json['daily']['temperature_2m_max']),
      temperature2mMin: List<num?>.from(json['daily']['temperature_2m_min']),
      apparentTemperatureMax:
          List<num?>.from(json['daily']['apparent_temperature_max']),
      apparentTemperatureMin:
          List<num?>.from(json['daily']['apparent_temperature_min']),
      uvIndexMax: List<num?>.from(json['daily']['uv_index_max']),
      rainSum: List<num?>.from(json['daily']['rain_sum']),
      snowfallSum: List<num?>.from(json['daily']['snowfall_sum']),
      windSpeed10mMax: List<num?>.from(json['daily']['wind_speed_10m_max']),
    );
  }
}

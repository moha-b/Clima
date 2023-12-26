class HourlyForecast {
  String? todayDate;
  String? hour;
  double? temperature;
  int? humidity;
  int? weatherCode;
  String? image;
  double? daylightDuration;
  double? sunshineDuration;
  String? sunrise;
  String? sunset;
  double? uvIndexMax;

  HourlyForecast({
    this.todayDate,
    this.hour,
    this.temperature,
    this.humidity,
    this.weatherCode,
    this.image,
    this.daylightDuration,
    this.sunshineDuration,
    this.sunrise,
    this.sunset,
    this.uvIndexMax,
  });
}

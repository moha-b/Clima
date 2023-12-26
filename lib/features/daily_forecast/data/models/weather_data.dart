class OpenMeteoResponse {
  Hourly? hourly;
  Daily? daily;

  OpenMeteoResponse({
    this.hourly,
    this.daily,
  });

  factory OpenMeteoResponse.fromJson(Map<String, dynamic> json) =>
      OpenMeteoResponse(
        hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
      );
}

class Daily {
  List<DateTime>? time;
  List<int>? weatherCode;
  List<String>? sunrise;
    List<String>? sunset;
  List<double>? daylightDuration;
  List<double>? sunshineDuration;
  List<double>? uvIndexMax;

  Daily({
    this.time,
    this.weatherCode,
    this.sunrise,
    this.sunset,
    this.daylightDuration,
    this.sunshineDuration,
    this.uvIndexMax,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] == null
            ? []
            : List<DateTime>.from(json["time"]!.map((x) => DateTime.parse(x))),
        weatherCode: json["weather_code"] == null
            ? []
            : List<int>.from(json["weather_code"]!.map((x) => x)),
        sunrise: json["sunrise"] == null
            ? []
            : List<String>.from(json["sunrise"]!.map((x) => x)),
        sunset: json["sunset"] == null
            ? []
            : List<String>.from(json["sunset"]!.map((x) => x)),
        daylightDuration: json["daylight_duration"] == null
            ? []
            : List<double>.from(
                json["daylight_duration"]!.map((x) => x?.toDouble() ?? 0.0)),
        sunshineDuration: json["sunshine_duration"] == null
            ? []
            : List<double>.from(
                json["sunshine_duration"]!.map((x) => x?.toDouble() ?? 0.0)),
        uvIndexMax: json["uv_index_max"] == null
            ? []
            : List<double>.from(
                json["uv_index_max"]!.map((x) => x?.toDouble() ?? 0.0)),
      );
}

class Hourly {
  List<String>? time;
  List<double>? temperature2M;
  List<int>? relativeHumidity2M;
  List<int>? weatherCode;
  List<int>? isDay;

  Hourly({
    this.time,
    this.temperature2M,
    this.relativeHumidity2M,
    this.weatherCode,
    this.isDay,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null
            ? []
            : List<String>.from(json["time"]!.map((x) => x)),
        temperature2M: json["temperature_2m"] == null
            ? []
            : List<double>.from(
                json["temperature_2m"]!.map((x) => x?.toDouble())),
        relativeHumidity2M: json["relative_humidity_2m"] == null
            ? []
            : List<int>.from(json["relative_humidity_2m"]!.map((x) => x)),
        weatherCode: json["weather_code"] == null
            ? []
            : List<int>.from(json["weather_code"]!.map((x) => x)),
        isDay: json["is_day"] == null
            ? []
            : List<int>.from(json["is_day"]!.map((x) => x)),
      );
}

class Forecast5DaysModel {
  String cod;
  int message;
  int cnt;
  List<WeatherItem> list;

  Forecast5DaysModel(
      {required this.cod,
      required this.message,
      required this.cnt,
      required this.list});

  factory Forecast5DaysModel.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<WeatherItem> weatherList =
        list.map((i) => WeatherItem.fromJson(i)).toList();

    return Forecast5DaysModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: weatherList,
    );
  }
}

class WeatherItem {
  int dt;
  MainWeatherData main;
  List<WeatherDescription> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
  Sys sys;
  String date;

  WeatherItem({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.date,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    var weatherList = json['weather'] as List;
    List<WeatherDescription> weatherData =
        weatherList.map((i) => WeatherDescription.fromJson(i)).toList();

    return WeatherItem(
      dt: json['dt'],
      main: MainWeatherData.fromJson(json['main']),
      weather: weatherData,
      clouds: Clouds.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: json['pop'].toDouble(),
      sys: Sys.fromJson(json['sys']),
      date: json['dt_txt'],
    );
  }
}

class MainWeatherData {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  MainWeatherData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory MainWeatherData.fromJson(Map<String, dynamic> json) {
    return MainWeatherData(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
  }
}

class WeatherDescription {
  int id;
  String main;
  String description;
  String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
        speed: json['speed'].toDouble(),
        deg: json['deg'],
        gust: json['gust'].toDouble());
  }
}

class Sys {
  String pod;

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(pod: json['pod']);
  }
}

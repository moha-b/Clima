part of 'network.dart';

const String WEATHER_BASE_URL = "https://api.open-meteo.com/v1";
const String NEWS_BASE_URL = "https://newsapi.org/v2";

abstract class EndPoints {
  static const String forecast = "/forecast";
  static const String weatherNews = "/top-headlines";
}

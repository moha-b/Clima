import 'package:fpdart/fpdart.dart';

import '../../../../core/network/network.dart';
import '../models/open_meteo_hourly_response_model.dart';
import '../models/weather_news_model.dart';

abstract class HourlyForecastRepository {
  Future<Either<Failure, OpenMeteoHourlyResponse>> fetchWeatherData(
      double? latitude, double? longitude);
  Future<Either<Failure, WeatherNewsModel>> fetchWeatherNews();
}

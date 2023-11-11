import 'package:clima/core/error/error_handling.dart';
import 'package:fpdart/fpdart.dart';

import '../model/weather_model.dart';

abstract class HomeRepository {
  Future<Either<IErrorHandler, WeatherModel>> getTodayWeather(
      double? latitude, double? longitude);
}

import 'package:dartz/dartz.dart';
import 'package:elemental/core/error/error_handling.dart';

import '../model/weather_model.dart';

abstract class HomeRepository {
  Future<Either<IErrorHandler, WeatherModel>> getTodayWeather(
      double? latitude, double? longitude);
}

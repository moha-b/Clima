import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_handling.dart';
import '../model/weather_model.dart';

abstract class HomeRepository {
  Future<Either<IErrorHandler, WeatherModel>> getTodayWeather(
      double? latitude, double? longitude);

  Future<Either<IErrorHandler, OpenMeteoCurrentResponse>> fetchCurrentWeather(
      double? latitude, double? longitude);
}

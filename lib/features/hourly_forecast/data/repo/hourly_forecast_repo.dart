import 'package:clima/core/error/error_handling.dart';
import 'package:fpdart/fpdart.dart';

import '../models/open_meteo_hourly_response_model.dart';

abstract class HourlyForecastRepository {
  Future<Either<IErrorHandler, OpenMeteoHourlyResponse>> fetchWeatherData(
      double? latitude, double? longitude);
}

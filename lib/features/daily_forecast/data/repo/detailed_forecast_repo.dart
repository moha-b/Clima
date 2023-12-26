import 'package:clima/core/error/error_handling.dart';
import 'package:fpdart/fpdart.dart';

import '../models/weather_data.dart';

abstract class DetailedForecastRepository {
  Future<Either<IErrorHandler, OpenMeteoResponse>> fetchWeatherData(
      double? latitude, double? longitude);
}

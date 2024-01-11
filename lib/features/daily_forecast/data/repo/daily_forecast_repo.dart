import 'package:fpdart/fpdart.dart';

import '../../../../core/services/network/models/failure.dart';
import '../models/open_meteo_daily_response.dart';

abstract class DailyForecastRepository {
  Future<Either<Failure, OpenMeteoDailyResponse>> fetchWeatherData(
      double? latitude, double? longitude);
}

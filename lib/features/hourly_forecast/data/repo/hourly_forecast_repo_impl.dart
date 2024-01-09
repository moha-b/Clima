import 'package:clima/core/services/network/models/error_handler.dart';
import 'package:clima/core/services/network/models/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/services/network/api_service.dart';
import '../models/open_meteo_hourly_response_model.dart';
import 'hourly_forecast_repo.dart';

class HourlyForecastRepoImpl extends HourlyForecastRepository {
  final ApiService client;
  HourlyForecastRepoImpl(this.client);
  @override
  Future<Either<Failure, OpenMeteoHourlyResponse>> fetchWeatherData(
      double? latitude, double? longitude) async {
    try {
      var result = await client.get(
        endPoint: '/forecast',
        params: {
          'hourly': 'temperature_2m,relative_humidity_2m,weather_code,is_day',
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max',
          'timezone': 'auto',
          'forecast_days': 1,
          'forecast_hours': 24,
          'latitude': latitude,
          'longitude': longitude,
        },
      );
      final data = OpenMeteoHourlyResponse.fromJson(result.data);
      return right(data);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}

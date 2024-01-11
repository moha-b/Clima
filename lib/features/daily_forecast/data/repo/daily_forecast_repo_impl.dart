import 'package:clima/core/services/network/api_service.dart';
import 'package:clima/core/services/network/models/end_points.dart';
import 'package:clima/core/services/network/models/error_handler.dart';
import 'package:clima/core/services/network/models/failure.dart';
import 'package:clima/features/daily_forecast/data/models/open_meteo_daily_response.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:fpdart/fpdart.dart';

class DailyForecastRepoImpl extends DailyForecastRepository {
  final ApiService client;
  DailyForecastRepoImpl(this.client);
  @override
  Future<Either<Failure, OpenMeteoDailyResponse>> fetchWeatherData(
      double? latitude, double? longitude) async {
    try {
      var result = await client.get(
        endPoint: EndPoints.forecast,
        params: {
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,uv_index_max,rain_sum,snowfall_sum,wind_speed_10m_max',
          'timezone': 'auto',
          'forecast_days': 16,
          'forecast_hours': 24,
          'latitude': latitude,
          'longitude': longitude
        },
      );
      return right(OpenMeteoDailyResponse.fromJson(result.data));
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  }
}

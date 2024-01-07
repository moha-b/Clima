import 'package:clima/core/error/error_handling.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../models/open_meteo_hourly_response_model.dart';
import 'hourly_forecast_repo.dart';

class HourlyForecastRepoImpl extends HourlyForecastRepository {
  @override
  Future<Either<IErrorHandler, OpenMeteoHourlyResponse>> fetchWeatherData(
      double? latitude, double? longitude) async {
    try {
      var result = await Dio().get(
          "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m,relative_humidity_2m,weather_code,is_day&daily=weather_code,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max&timezone=auto&forecast_days=1&forecast_hours=24");
      final data = OpenMeteoHourlyResponse.fromJson(result.data);
      print(data.daily.time);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handel(e));
      } else {
        return left(ServerFailure("ERROR :: ${e.toString()}"));
      }
    }
  }
}

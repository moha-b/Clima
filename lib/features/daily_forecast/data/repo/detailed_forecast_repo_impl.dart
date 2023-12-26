import 'package:clima/core/error/error_handling.dart';
import 'package:clima/features/daily_forecast/data/models/weather_data.dart';
import 'package:clima/features/daily_forecast/data/repo/detailed_forecast_repo.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class DetailedForecastRepoImpl extends DetailedForecastRepository {
  @override
  Future<Either<IErrorHandler, OpenMeteoResponse>> fetchWeatherData(
      double? latitude, double? longitude) async {
    try {
      var result = await Dio().get(
          "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,is_day,weather_code&hourly=temperature_2m,relative_humidity_2m,weather_code,is_day&daily=weather_code,sunrise,sunset,daylight_duration,sunshine_duration,uv_index_max&timezone=auto&forecast_days=16&forecast_hours=24");
      final data = OpenMeteoResponse.fromJson(result.data);
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

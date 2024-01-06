import 'package:clima/core/error/error_handling.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/services/api_service.dart';

class HomeRepoImpl extends HomeRepository {
  final ApiService client;

  HomeRepoImpl(this.client);

  @override
  Future<Either<IErrorHandler, WeatherModel>> getTodayWeather(
      double? latitude, double? longitude) async {
    try {
      var result =
          await client.get(endPoint: EndPoint.todayWeather, parameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
      });
      final weather = WeatherModel.fromJson(result);
      return right(weather);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.handel(e));
      } else {
        return left(ServerFailure("ERROR :: ${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<IErrorHandler, OpenMeteoCurrentResponse>> fetchCurrentWeather(
      double? latitude, double? longitude) async {
    try {
      var result = await Dio().get(
          "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,is_day,weather_code&timezone=auto&forecast_days=1&forecast_hours=24");
      return right(OpenMeteoCurrentResponse.fromJson(result.data));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

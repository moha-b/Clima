import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elemental/core/constant/apis.dart';
import 'package:elemental/core/error/error_handling.dart';
import 'package:elemental/core/services/api_service.dart';
import 'package:elemental/features/home/data/model/weather_model.dart';
import 'package:elemental/features/home/data/repo/home_repo.dart';

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
}

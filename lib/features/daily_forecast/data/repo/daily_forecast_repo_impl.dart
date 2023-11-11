import 'package:clima/core/error/error_handling.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/services/api_service.dart';
import '../models/forecast_5_days_model.dart';

class DailyForecastRepoImpl extends DailyForecastRepository {
  final ApiService client;

  DailyForecastRepoImpl(this.client);
  @override
  Future<Either<IErrorHandler, Forecast5DaysModel>> fetchForecast5Days(
      double? latitude, double? longitude) async {
    try {
      var result =
          await client.get(endPoint: EndPoint.forecast5Days, parameters: {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
      });

      final weather = Forecast5DaysModel.fromJson(result);
      return right(weather);
    } catch (e) {
      print(Exception(e));
      if (e is DioException) {
        return left(ServerFailure.handel(e));
      } else {
        return left(ServerFailure("ERROR :: ${e.toString()}"));
      }
    }
  }
}

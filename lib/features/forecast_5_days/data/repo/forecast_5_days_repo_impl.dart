import 'package:clima/core/error/error_handling.dart';
import 'package:clima/features/forecast_5_days/data/repo/forecast_5_days_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constant/apis.dart';
import '../../../../core/services/api_service.dart';
import '../models/forecast_5_days_model.dart';

class Forecast5DaysRepoImpl extends Forecast5DaysRepository {
  final ApiService client;

  Forecast5DaysRepoImpl(this.client);
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

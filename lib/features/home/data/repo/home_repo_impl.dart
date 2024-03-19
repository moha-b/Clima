import 'package:clima/core/network/network.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either<Failure, OpenMeteoCurrentResponse>> fetchCurrentWeather(
      double? latitude, double? longitude) async {
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.forecast,
        params: {
          'current': 'temperature_2m,is_day,weather_code',
          'timezone': 'auto',
          'forecast_days': 1,
          'forecast_hours': 1,
          'latitude': latitude,
          'longitude': longitude,
        },
      );
      return right(OpenMeteoCurrentResponse.fromJson(result.data));
    } catch (e) {
      return left(ErrorHandler.handle(e).failure!);
    }
  }
}

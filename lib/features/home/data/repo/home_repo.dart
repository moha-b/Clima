import 'package:fpdart/fpdart.dart';

import '../../../../core/network/network.dart';
import '../model/weather_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, OpenMeteoCurrentResponse>> fetchCurrentWeather(
      double? latitude, double? longitude);
}

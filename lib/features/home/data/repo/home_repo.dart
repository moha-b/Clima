import 'package:fpdart/fpdart.dart';

import '../../../../core/services/network/models/failure.dart';
import '../model/weather_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, OpenMeteoCurrentResponse>> fetchCurrentWeather(
      double? latitude, double? longitude);
}

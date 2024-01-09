import 'package:clima/core/helper/dio_helper.dart';
import 'package:clima/core/services/network/api_service.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:clima/features/home/data/repo/home_repo_impl.dart';
import 'package:clima/features/hourly_forecast/data/repo/hourly_forecast_repo.dart';
import 'package:clima/features/hourly_forecast/data/repo/hourly_forecast_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => DioHelper());
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<DioHelper>().getDio()),
  );
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerLazySingleton<HourlyForecastRepository>(
      () => HourlyForecastRepoImpl(getIt.get<ApiService>()));
}

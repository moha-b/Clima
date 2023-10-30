import 'package:clima/core/services/api_service.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo_impl.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:clima/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerLazySingleton<DailyForecastRepository>(
      () => DailyForecastRepoImpl(getIt.get<ApiService>()));
}

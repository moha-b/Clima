import 'package:clima/core/services/api_service.dart';
import 'package:clima/features/forecast_5_days/data/repo/forecast_5_days_repo.dart';
import 'package:clima/features/forecast_5_days/data/repo/forecast_5_days_repo_impl.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:clima/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerLazySingleton<Forecast5DaysRepository>(
      () => Forecast5DaysRepoImpl(getIt.get<ApiService>()));
}

import 'package:clima/core/extensions/map_weather_code_extensions.dart';
import 'package:clima/core/helper/functions.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/daily_weather_model.dart';
import '../data/repo/daily_forecast_repo.dart';

part 'daily_forecast_state.dart';

class DailyForecastCubit extends Cubit<DailyForecastState> {
  final DailyForecastRepository _repository;

  DailyForecastCubit(this._repository) : super(DailyForecastInitial());

  fetchDailyData() async {
    var result = await _repository.fetchWeatherData(
      Location.instance.position!.latitude,
      Location.instance.position!.longitude,
    );
    emit(DailyForecastInitial());
    result.fold(
      (failure) => emit(DailyForecastFailure(failure.message)),
      (response) {
        emit(
          DailyForecastSuccess(
            dailyWeather: DailyWeatherModel(
              temperature: List.generate(
                  response.temperature2mMin.length,
                  (index) => calculateAverage(
                        response.temperature2mMin[index],
                        response.temperature2mMax[index],
                      )),
              apparentTemperature: List.generate(
                  response.apparentTemperatureMax.length,
                  (index) => calculateAverage(
                        response.apparentTemperatureMax[index],
                        response.apparentTemperatureMin[index],
                      )),
              image: List.generate(
                response.weatherCode.length,
                (index) => (response.weatherCode[index] ?? -1)
                    .mapToWeatherState()
                    .getImages(false),
              ),
              uvIndexMax: response.uvIndexMax
                  .map((uvIndex) => isNotNull(uvIndex))
                  .toList(),
              windSpeed10mMax: response.windSpeed10mMax
                  .map((windSpeed) => isNotNull(windSpeed))
                  .toList(),
              rainSum: response.rainSum
                  .map((rainSum) => isNotNull(rainSum))
                  .toList(),
              snowfallSum: response.snowfallSum
                  .map((snowfallSum) => isNotNull(snowfallSum))
                  .toList(),
              time: response.time.map((data) => isNotNull(data)).toList(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:clima/core/global/enums.dart';
import 'package:clima/core/global/variables.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/features/daily_forecast/data/models/forecast_5_days_model.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/functions.dart';
import '../../home/data/model/weather_theme.dart';
import '../data/models/daily_forecast_model.dart';

part 'daily_forecast_state.dart';

class DailyForecastCubit extends Cubit<DailyForecastState> {
  DailyForecastCubit(this._repository) : super(DailyForecastInitial());
  final DailyForecastRepository _repository;
  fetchForecast5DaysData() async {
    var result = await _repository.fetchForecast5Days(
        Location.instance.position?.latitude,
        Location.instance.position?.longitude);
    result.fold(
      (failure) => emit(DailyForecastError(failure.message)),
      (forecast) {
        emit(DailyForecastLoaded(_parseWeatherData(forecast)));
      },
    );
  }

  List<DailyForecast> _parseWeatherData(Forecast5DaysModel forecast) {
    List<DailyForecast> dailyForecasts = [];
    String currentDate = "";
    WeatherTheme theme;

    for (var item in forecast.list) {
      String date = item.date;
      String humidity = "humidity ${item.main.humidity}%";
      String temperature = convertTemperatureToCelsius(item.main.temp);
      String description = item.weather[0].description;
      String main = item.weather[0].main;
      theme = WeatherTheme.mapWeatherStateToTheme(
          item.weather[0].main.mapToWeatherState());
      if (date.substring(0, 10) != currentDate) {
        date = item.date.substring(0, 10);
        dailyForecasts.add(DailyForecast(
          date: date,
          humidity: humidity,
          temperature: temperature,
          description: description,
          main: main,
          image:
              GlobalVariablesState.isNight ? theme.nightImage : theme.dayImage,
          textColor: theme.textColor,
        ));
        currentDate = date;
      }
    }
    return (dailyForecasts);
  }
}

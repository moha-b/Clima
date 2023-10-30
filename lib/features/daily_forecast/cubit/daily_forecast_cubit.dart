import 'package:clima/core/constant/constants.dart';
import 'package:clima/features/daily_forecast/data/models/daily_weather_theme.dart';
import 'package:clima/features/daily_forecast/data/models/forecast_5_days_model.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/functions.dart';
import '../data/models/daily_forecast_model.dart';

part 'daily_forecast_state.dart';

class DailyForecastCubit extends Cubit<DailyForecastState> {
  DailyForecastCubit(this._repository) : super(DailyForecastInitial());
  final DailyForecastRepository _repository;
  fetchForecast5DaysData({required double? lat, required double? lon}) async {
    var result = await _repository.fetchForecast5Days(lat, lon);
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
    DailyWeatherTheme? theme;

    for (var item in forecast.list) {
      String date = item.date;
      String humidity = "humidity ${item.main.humidity}%";
      String temperature = convertTemperatureToCelsius(item.main.temp);
      String description = item.weather[0].description;
      String main = item.weather[0].main;
      theme = dailyWeatherThemes[mapWeatherState(item.weather[0].main)];
      if (date.substring(0, 10) != currentDate) {
        date = item.date.substring(0, 10);
        dailyForecasts.add(DailyForecast(
          date: date,
          humidity: humidity,
          temperature: temperature,
          description: description,
          main: main,
          image: isNight ? theme!.nightImage : theme!.dayImage,
          textColor: theme.textColor,
        ));
        currentDate = date;
      }
    }
    return (dailyForecasts);
  }
}

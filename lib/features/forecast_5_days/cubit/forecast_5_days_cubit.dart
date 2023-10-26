import 'package:bloc/bloc.dart';
import 'package:clima/core/constant/constants.dart';
import 'package:clima/features/forecast_5_days/data/models/daily_weather_theme.dart';
import 'package:clima/features/forecast_5_days/data/models/forecast_5_days_model.dart';
import 'package:clima/features/forecast_5_days/data/repo/forecast_5_days_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../core/helper/functions.dart';
import '../data/models/daily_forecast_model.dart';

part 'forecast_5_days_state.dart';

class Forecast5DaysCubit extends Cubit<Forecast5DaysState> {
  Forecast5DaysCubit(this._repository) : super(Forecast5DaysInitial());
  final Forecast5DaysRepository _repository;

  fetchForecast5DaysData({required double? lat, required double? lon}) async {
    var result = await _repository.fetchForecast5Days(lat, lon);
    result.fold(
      (failure) => emit(Forecast5DaysError(failure.message)),
      (forecast) {
        emit(Forecast5DaysLoaded(_parseWeatherData(forecast)));
      },
    );
  }

  List<Forecast> _parseWeatherData(Forecast5DaysModel forecast) {
    List<Forecast> dailyForecasts = [];
    List<Forecast> hourlyForecasts = [];
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
        dailyForecasts.add(Forecast(
          date: date,
          humidity: humidity,
          temperature: temperature,
          description: description,
          main: main,
          image: isNight ? theme!.nightImage : theme!.dayImage,
          textColor: theme.textColor,
        ));
        currentDate = date;
      } else {
        date = item.date.substring(10);
        hourlyForecasts.add(Forecast(
          date: date,
          humidity: humidity,
          temperature: temperature,
          description: description,
          main: main,
          image: isNight ? theme!.nightImage : theme!.dayImage,
          textColor: theme.textColor,
        ));
      }
    }

    return dailyForecasts;
  }
}

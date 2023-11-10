import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/constants.dart';
import '../../../core/helper/functions.dart';
import '../../daily_forecast/data/models/daily_weather_theme.dart';
import '../../daily_forecast/data/models/forecast_5_days_model.dart';
import '../../daily_forecast/data/repo/daily_forecast_repo.dart';
import '../data/models/hourly_forecast_model.dart';

part 'hourly_forecast_state.dart';

class HourlyForecastCubit extends Cubit<HourlyForecastState> {
  HourlyForecastCubit(this._repository) : super(HourlyForecastInitial());
  final DailyForecastRepository _repository;
  fetchForecast5DaysData({required double? lat, required double? lon}) async {
    var result = await _repository.fetchForecast5Days(lat, lon);
    result.fold(
      (failure) => emit(HourlyForecastError(failure.message)),
      (forecast) {
        emit(HourlyForecastLoaded(_parseHourlyWeatherData(forecast)));
      },
    );
  }

  List<HourlyForecast> _parseHourlyWeatherData(Forecast5DaysModel forecast) {
    List<HourlyForecast> hourlyForecasts = [];

    String currentDay = DateTime.now().toString().substring(0, 10);

    for (var item in forecast.list) {
      String date = item.date;

      // Check if the item's date matches the current day
      if (date.substring(0, 10) == currentDay) {
        String humidity = "humidity ${item.main.humidity}%";
        String temperature = convertTemperatureToCelsius(item.main.temp);
        String description = item.weather[0].description;
        String main = item.weather[0].main;
        DailyWeatherTheme? theme =
            dailyWeatherThemes[mapWeatherState(item.weather[0].main)];

        hourlyForecasts.add(HourlyForecast(
          date: date.substring(11),
          humidity: humidity,
          temperature: temperature,
          description: description,
          data: item.main,
          main: main,
          image: isNight ? theme!.nightImage : theme!.dayImage,
          isExpanded: forecast.list[0] == item ? true : false,
        ));
      }
    }
    return hourlyForecasts;
  }
}

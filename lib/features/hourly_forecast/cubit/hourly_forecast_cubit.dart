import 'package:clima/core/global/enums.dart';
import 'package:clima/core/helper/converter_helper.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/variables.dart';
import '../../../core/helper/functions.dart';
import '../../daily_forecast/data/models/daily_weather_theme.dart';
import '../../daily_forecast/data/models/forecast_5_days_model.dart';
import '../../daily_forecast/data/repo/daily_forecast_repo.dart';
import '../data/models/hourly_forecast_model.dart';

part 'hourly_forecast_state.dart';

class HourlyForecastCubit extends Cubit<HourlyForecastState> {
  HourlyForecastCubit(this._repository) : super(HourlyForecastInitial());
  final DailyForecastRepository _repository;
  fetchForecast5DaysData() async {
    var result = await _repository.fetchForecast5Days(
        Location.instance.position?.latitude,
        Location.instance.position?.longitude);
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
        String humidity = "${item.main.humidity}%";
        String temperature = convertTemperatureToCelsius(item.main.temp);
        String description = item.weather[0].description;
        String main = item.weather[0].main;
        DailyWeatherTheme theme = DailyWeatherTheme.fromWeatherState(
            item.weather[0].main.mapToWeatherState());
        hourlyForecasts.add(HourlyForecast(
          hours: DateFormatter.formatHours(date),
          day: DateFormatter.formatDay(date),
          humidity: humidity,
          temperature: temperature,
          description: description,
          data: item.main,
          main: main,
          image:
              GlobalVariablesState.isNight ? theme.nightImage : theme.dayImage,
          isExpanded: forecast.list[0] == item ? true : false,
        ));
      }
    }
    return hourlyForecasts;
  }
}

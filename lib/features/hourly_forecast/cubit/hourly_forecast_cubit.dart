import 'package:clima/core/extensions/map_weather_code_extensions.dart';
import 'package:clima/core/helper/date_helper.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/features/hourly_forecast/data/repo/hourly_forecast_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/functions.dart';
import '../../home/data/model/weather_theme.dart';
import '../data/models/weather_daily_model.dart';
import '../data/models/weather_hourly_model.dart';

part 'hourly_forecast_state.dart';

class HourlyForecastCubit extends Cubit<DetailedForecastState> {
  HourlyForecastCubit(this._repository) : super(DetailedForecastInitial());
  final HourlyForecastRepository _repository;
  final List<String> _propertiesToCheck = [
    'hourly.time',
    'hourly.temperature2m',
    'daily.time',
    'daily.temperature2mMax',
    'daily.temperature2mMin',
  ];

  fetchWeatherData() async {
    var result = await _repository.fetchWeatherData(
        Location.instance.position?.latitude,
        Location.instance.position?.longitude);
    result.fold(
      (failure) => emit(DetailedForecastError(failure.message)),
      (response) {
        // To make sure there is no null values
        if (_propertiesToCheck.any((property) => isNull(response, property))) {
          emit(const DetailedForecastError(
              "Invalid or incomplete response data"));
        }
        emit(
          DetailsForecastSuccess(
            dailyForecast: Daily(
                theme: WeatherTheme.mapWeatherStateToTheme(
                    response.hourly.weatherCode[0].mapToWeatherState(),
                    response.hourly.isDay[0] == 1 ? true : false),
                date: DateHelper.formatDate(
                    response.daily.time[0], 'EEEE, d MMMM'),
                sunrise:
                    DateHelper.formatDate(response.daily.sunrise[0], 'h:mm a'),
                sunshineDuration: response.daily.sunshineDuration[0],
                daylightDuration: response.daily.daylightDuration[0],
                temperatureMax: response.daily.temperature2mMax[0],
                temperatureMin: response.daily.temperature2mMin[0],
                uvIndexMax: response.daily.uvIndexMax[0],
                sunset:
                    DateHelper.formatDate(response.daily.sunset[0], 'h:mm a'),
                apparentTemperature: (response.daily.apparentTemperatureMax[0] +
                        response.daily.apparentTemperatureMin[0]) ~/
                    2),
            hourlyForecast: WeatherHourly(
                time: response.hourly.time
                    .map((date) => DateHelper.formatDate(date, 'h a'))
                    .toList(),
                isDay: response.hourly.isDay,
                weatherCode: response.hourly.weatherCode,
                humidity: response.hourly.humidity,
                temperature: response.hourly.temperature,
                image: List<String>.generate(
                  response.hourly.weatherCode.length,
                  (index) => response.hourly.weatherCode[index]
                      .mapToWeatherState()
                      .getImages(response.hourly.isDay[index] == 1),
                )),
          ),
        );
      },
    );
  }
}

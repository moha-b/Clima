import 'package:clima/core/extensions/map_weather_code.dart';
import 'package:clima/core/helper/converter_helper.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/features/daily_forecast/data/repo/detailed_forecast_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../hourly_forecast/data/models/hourly_forecast_model.dart';
import '../data/models/daily_forecast_model.dart';

part 'detailed_forecast_state.dart';

class DetailedForecastCubit extends Cubit<DetailedForecastState> {
  DetailedForecastCubit(this._repository) : super(DetailedForecastInitial());
  final DetailedForecastRepository _repository;
  DateTime? todayDate;
  DateTime? todayHours;
  DateTime? sunset;
  DateTime? sunrise;
  fetchWeatherData() async {
    var result = await _repository.fetchWeatherData(
        Location.instance.position?.latitude,
        Location.instance.position?.longitude);
    result.fold(
      (failure) => emit(DetailedForecastError(failure.message)),
      (forecast) {
        List<DailyForecast> dailyForecast = [];
        List<HourlyForecast> hourlyForecast = [];
        if (forecast.daily != null) {
          for (int i = 0; i < forecast.daily!.time!.length; i++) {
            dailyForecast.add(DailyForecast(
              time: forecast.daily!.time![i].toString(),
              weatherCode: forecast.daily!.weatherCode![i],
              sunrise: forecast.daily!.sunrise![i],
              sunset: forecast.daily!.sunset![i],
              daylightDuration: forecast.daily!.daylightDuration![i],
              sunshineDuration: forecast.daily!.sunshineDuration![i],
              uvIndexMax: forecast.daily!.uvIndexMax![i],
            ));
          }
        } else {
          emit(const DetailedForecastError("Error processing forecast data"));
        }
        if (forecast.hourly != null) {
          todayDate = DateTime.parse(forecast.hourly!.time![0]);
          sunset = DateTime.parse(forecast.daily!.sunset![0]);
          sunrise = DateTime.parse(forecast.daily!.sunrise![0]);
          for (int i = 0; i < forecast.hourly!.time!.length; i++) {
            todayHours = DateTime.parse(forecast.hourly!.time![i]);
            hourlyForecast.add(
              HourlyForecast(
                todayDate: DateFormat('EEEE, d MMMM').format(todayDate!),
                hour: DateFormat('h a').format(todayHours!),
                temperature: forecast.hourly!.temperature2M![i],
                humidity: forecast.hourly!.relativeHumidity2M![i],
                weatherCode: forecast.hourly!.weatherCode![i],
                image: forecast.hourly!.isDay![i] == 1
                    ? getDayImage(
                        forecast.hourly!.weatherCode![i].mapToWeatherState())
                    : getNightImage(
                        forecast.hourly!.weatherCode![i].mapToWeatherState()),
                daylightDuration: forecast.daily!.daylightDuration![0],
                sunshineDuration: forecast.daily!.sunshineDuration![0],
                sunrise: DateFormat('h : m a').format(sunrise!),
                sunset: DateFormat('h : m a').format(sunset!),
                uvIndexMax: forecast.daily!.uvIndexMax![0],
              ),
            );
          }
        } else {
          emit(const DetailedForecastError("Error processing forecast data"));
        }
        emit(DetailsForecastSuccess(
          dailyForecast: dailyForecast,
          hourlyForecast: hourlyForecast,
        ));
      },
    );
  }
}

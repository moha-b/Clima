import 'package:clima/core/global/enums.dart';
import 'package:clima/core/helper/functions.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/core/utils/app_images.dart';
import 'package:clima/features/home/data/model/weather.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/model/weather_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/variables.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  var model;
  HomeCubit(this.repository) : super(HomeLoadingState());

  getTodayWeather() async {
    final data = await repository.getTodayWeather(
        Location.instance.position?.latitude,
        Location.instance.position?.longitude);
    try {
      data.fold((error) {
        emit(HomeErrorState(error: error.message));
      }, (weather) {
        /// [isNight] is a global value => lib/core/constant/variables.dart
        GlobalVariablesState.isNight = isNightTime(
            weather.sys.sunrise.toInt(), weather.sys.sunset.toInt());
        //
        WeatherTheme theme = WeatherTheme.mapWeatherStateToTheme(
            weather.weatherState.mapToWeatherState());
        //
        model = Weather(
            convertTemperatureToCelsius(weather.temperature.toDouble()),
            convertTimeToReadableDate(weather.time.toInt()),
            GlobalVariablesState.isNight ? theme.nightImage : theme.dayImage,
            theme.textColor,
            weather.weatherState,
            Location.instance.city);
        emit(
          HomeSuccessState(weatherData: model, sys: weather.sys),
        );
      });
    } catch (e) {
      print("/////////////////////////////////////////////\n $e");
    }
  }
}

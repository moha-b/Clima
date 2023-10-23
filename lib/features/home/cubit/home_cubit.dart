import 'package:clima/core/constant/constants.dart';
import 'package:clima/core/helper/functions.dart';
import 'package:clima/core/utils/app_images.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/model/weather_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  HomeCubit(this.repository) : super(HomeLoadingState());

  getTodayWeather({
    required double? latitude,
    required double? longitude,
  }) async {
    final data = await repository.getTodayWeather(latitude, longitude);
    try {
      data.fold((error) {
        emit(HomeErrorState(error: error.message));
      }, (weather) {
        /// [isNight] is a global value => lib/core/constant/constants.dart
        isNight = isNightTime(weather.sys.sunrise, weather.sys.sunset);
        WeatherTheme? theme =
            weatherThemes[mapWeatherState(weather.weatherState)];
        emit(
          HomeSuccessState(
            weatherData: weather,
            todayDate: convertTimeToReadableDate(weather.time),
            temperature: convertTemperatureToCelsius(weather.temperature),
            weatherImage: isNight ? theme!.nightImage : theme!.dayImage,
            textColor: theme.textColor,
          ),
        );
      });
    } catch (e) {
      print("/////////////////////////////////////////////\n $e");
    }
  }
}

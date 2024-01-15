import 'package:clima/core/extensions/map_weather_code_extensions.dart';
import 'package:clima/core/helper/date_helper.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/core/utils/app_images.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/model/weather_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  final double? _lat = Location.instance.position?.latitude;
  final double? _long = Location.instance.position?.longitude;
  bool isDay = false;
  HomeCubit(this._repository) : super(HomeLoadingState());
  fetchWeatherData() async {
    var result = await _repository.fetchCurrentWeather(_lat, _long);
    result.fold(
      (failure) => emit(HomeErrorState(error: failure.message)),
      (response) {
        isDay = response.isDay == 1 ? true : false;

        emit(HomeSuccessState(
          weather: WeatherData(
              // to modify the date to appear as 'month, day, year'
              date: DateHelper.formatDate(response.time, 'yMMMMd'),
              temperature: response.temperature.ceil(),
              // contains the image and text color based on it's a day or night
              theme: WeatherTheme.mapWeatherStateToTheme(
                  response.weatherCode.mapToWeatherState(), isDay),
              weatherState: response.weatherCode.mapToWeatherState(),
              isDay: isDay),
        ));
      },
    );
  }
}

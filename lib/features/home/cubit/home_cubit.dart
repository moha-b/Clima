import 'package:clima/core/extensions/map_weather_code_extensions.dart';
import 'package:clima/core/helper/date_helper.dart';
import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/core/utils/utils.dart';
import 'package:clima/features/home/data/model/weather_model.dart';
import 'package:clima/features/home/data/model/weather_theme.dart';
import 'package:clima/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository = HomeRepoImpl();
  bool isDay = false;
  WeatherTheme? theme;
  HomeCubit() : super(HomeLoadingState());
  fetchWeatherData() async {
    var result = await _repository.fetchCurrentWeather(
      Location.instance.position?.latitude,
      Location.instance.position?.longitude,
    );
    result.fold(
      (failure) => emit(HomeErrorState(error: failure.message)),
      (response) {
        isDay = response.isDay == 1 ? true : false;
        theme = WeatherTheme.mapWeatherStateToTheme(
            response.weatherCode.mapToWeatherState(), isDay);
        emit(HomeSuccessState(
          weather: WeatherData(
              // to modify the date to appear as 'month, day, year'
              date: DateHelper.formatDate(response.time, 'yMMMMd'),
              temperature: response.temperature.ceil(),
              // contains the image and text color based on it's a day or night
              theme: theme!,
              weatherState: response.weatherCode.mapToWeatherState(),
              isDay: isDay),
        ));
      },
    );
  }
}

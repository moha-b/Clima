import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/enums.dart';

class WeatherTheme {
  final String dayImage;
  final String nightImage;
  final Color textColor;

  WeatherTheme({
    required this.dayImage,
    required this.nightImage,
    required this.textColor,
  });
  factory WeatherTheme.fromWeatherState(WeatherState state) {
    switch (state) {
      case WeatherState.Storm:
        return WeatherTheme(
          dayImage: AppImages.dayStorm,
          nightImage: AppImages.nightStorm,
          textColor: AppColors.thunderstorm,
        );
      case WeatherState.Rain:
        return WeatherTheme(
          dayImage: AppImages.dayRain,
          nightImage: AppImages.nightRain,
          textColor: AppColors.rain,
        );
      case WeatherState.Snow:
        return WeatherTheme(
          dayImage: AppImages.daySnow,
          nightImage: AppImages.nightSnow,
          textColor: AppColors.snow,
        );
      case WeatherState.Wind:
        return WeatherTheme(
          dayImage: AppImages.dayWind,
          nightImage: AppImages.nightWind,
          textColor: AppColors.wind,
        );
      case WeatherState.Clear:
        return WeatherTheme(
          dayImage: AppImages.daySun,
          nightImage: AppImages.nightMoon,
          textColor: AppColors.clear,
        );
      case WeatherState.Clouds:
        return WeatherTheme(
          dayImage: AppImages.dayClouds,
          nightImage: AppImages.nightClouds,
          textColor: AppColors.cloud,
        );
      case WeatherState.Unknown:
        // TODO: Add a custom image in case anything goes wrong.
        throw 0;
    }
  }
}

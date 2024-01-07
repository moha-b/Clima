import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/enums.dart';

class WeatherTheme {
  final String image;
  final Color textColor;

  WeatherTheme({
    required this.image,
    required this.textColor,
  });

  factory WeatherTheme.mapWeatherStateToTheme(WeatherState state, bool isDay) {
    String getImageBasedOnDayTime(String dayImage, String nightImage) {
      return isDay ? dayImage : nightImage;
    }

    switch (state) {
      case WeatherState.Storm:
        return WeatherTheme(
          image:
              getImageBasedOnDayTime(AppImages.dayStorm, AppImages.nightStorm),
          textColor: AppColors.thunderstorm,
        );
      case WeatherState.Rain:
        return WeatherTheme(
          image: getImageBasedOnDayTime(AppImages.dayRain, AppImages.nightRain),
          textColor: AppColors.rain,
        );
      case WeatherState.Snow:
        return WeatherTheme(
          image: getImageBasedOnDayTime(AppImages.daySnow, AppImages.nightSnow),
          textColor: AppColors.snow,
        );
      case WeatherState.Wind:
        return WeatherTheme(
          image: getImageBasedOnDayTime(AppImages.dayWind, AppImages.nightWind),
          textColor: AppColors.wind,
        );
      case WeatherState.Clear:
        return WeatherTheme(
          image: getImageBasedOnDayTime(AppImages.daySun, AppImages.nightMoon),
          textColor: AppColors.clear,
        );
      case WeatherState.Clouds:
        return WeatherTheme(
          image: getImageBasedOnDayTime(
              AppImages.dayClouds, AppImages.nightClouds),
          textColor: AppColors.cloud,
        );
      case WeatherState.Unknown:
        // TODO: Add a custom image in case anything goes wrong.
        throw 0;
    }
  }
}

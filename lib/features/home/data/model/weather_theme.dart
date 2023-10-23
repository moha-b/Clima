import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

class WeatherTheme {
  final String dayImage;
  final String nightImage;
  final Color textColor;

  WeatherTheme({
    required this.dayImage,
    required this.nightImage,
    required this.textColor,
  });
}

final Map<String, WeatherTheme> weatherThemes = {
  'Clear': WeatherTheme(
    dayImage: AppImages.daySun,
    nightImage: AppImages.nightMoon,
    textColor: AppColors.clear,
  ),
  'Clouds': WeatherTheme(
    dayImage: AppImages.dayClouds,
    nightImage: AppImages.nightClouds,
    textColor: AppColors.cloud,
  ),
  'Rain': WeatherTheme(
    dayImage: AppImages.dayRain,
    nightImage: AppImages.nightRain,
    textColor: AppColors.rain,
  ),
  'Snow': WeatherTheme(
    dayImage: AppImages.daySnow,
    nightImage: AppImages.nightSnow,
    textColor: AppColors.snow,
  ),
  'Storm': WeatherTheme(
    dayImage: AppImages.dayStorm,
    nightImage: AppImages.nightStorm,
    textColor: AppColors.thunderstorm,
  ),
  'Wind': WeatherTheme(
    dayImage: AppImages.dayWind,
    nightImage: AppImages.nightWind,
    textColor: AppColors.wind,
  ),
};

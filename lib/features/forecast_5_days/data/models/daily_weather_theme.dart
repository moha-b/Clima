import 'dart:ui';

import '../../../../core/utils/utils.dart';

class DailyWeatherTheme {
  final String dayImage;
  final String nightImage;
  final Color textColor;

  DailyWeatherTheme({
    required this.dayImage,
    required this.nightImage,
    required this.textColor,
  });
}

final Map<String, DailyWeatherTheme> dailyWeatherThemes = {
  'Clear': DailyWeatherTheme(
    dayImage: AppImages.dailyDay,
    nightImage: AppImages.dailyNight,
    textColor: AppColors.clear,
  ),
  'Clouds': DailyWeatherTheme(
    dayImage: AppImages.dailyDayCloud,
    nightImage: AppImages.dailyNightCloud,
    textColor: AppColors.cloud,
  ),
  'Rain': DailyWeatherTheme(
    dayImage: AppImages.dailyDayRain,
    nightImage: AppImages.dailyNightRain,
    textColor: AppColors.rain,
  ),
  'Snow': DailyWeatherTheme(
    dayImage: AppImages.dailyDaySnow,
    nightImage: AppImages.dailyNightSnow,
    textColor: AppColors.snow,
  ),
  'Storm': DailyWeatherTheme(
    dayImage: AppImages.dailyDayStorm,
    nightImage: AppImages.dailyNightStorm,
    textColor: AppColors.thunderstorm,
  ),
  'Wind': DailyWeatherTheme(
    dayImage: AppImages.dailyDayWind,
    nightImage: AppImages.dailyNightWind,
    textColor: AppColors.wind,
  ),
};

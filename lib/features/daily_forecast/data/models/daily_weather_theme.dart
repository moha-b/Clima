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
    dayImage: AppLottie.dailyDay,
    nightImage: AppLottie.dailyNight,
    textColor: AppColors.clear,
  ),
  'Clouds': DailyWeatherTheme(
    dayImage: AppLottie.dailyDayCloud,
    nightImage: AppLottie.dailyNightCloud,
    textColor: AppColors.cloud,
  ),
  'Rain': DailyWeatherTheme(
    dayImage: AppLottie.dailyDayRain,
    nightImage: AppLottie.dailyNightRain,
    textColor: AppColors.rain,
  ),
  'Snow': DailyWeatherTheme(
    dayImage: AppLottie.dailyDaySnow,
    nightImage: AppLottie.dailyNightSnow,
    textColor: AppColors.snow,
  ),
  'Storm': DailyWeatherTheme(
    dayImage: AppLottie.dailyStorm,
    nightImage: AppLottie.dailyStorm,
    textColor: AppColors.thunderstorm,
  ),
  'Wind': DailyWeatherTheme(
    dayImage: AppLottie.dailyWind,
    nightImage: AppLottie.dailyWind,
    textColor: AppColors.wind,
  ),
};

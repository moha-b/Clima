import 'dart:ui';

import '../../../../core/global/enums.dart';
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
  factory DailyWeatherTheme.fromWeatherState(WeatherState state) {
    switch (state) {
      case WeatherState.Storm:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyStorm,
          nightImage: AppLottie.dailyStorm,
          textColor: AppColors.thunderstorm,
        );
      case WeatherState.Rain:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyDayRain,
          nightImage: AppLottie.dailyNightRain,
          textColor: AppColors.rain,
        );
      case WeatherState.Snow:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyDaySnow,
          nightImage: AppLottie.dailyNightSnow,
          textColor: AppColors.snow,
        );
      case WeatherState.Wind:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyWind,
          nightImage: AppLottie.dailyWind,
          textColor: AppColors.wind,
        );
      case WeatherState.Clear:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyDay,
          nightImage: AppLottie.dailyNight,
          textColor: AppColors.clear,
        );
      case WeatherState.Clouds:
        return DailyWeatherTheme(
          dayImage: AppLottie.dailyDayCloud,
          nightImage: AppLottie.dailyNightCloud,
          textColor: AppColors.cloud,
        );
      case WeatherState.Unknown:
        // TODO: Add a custom image in case anything goes wrong.
        throw 0;
    }
  }
}

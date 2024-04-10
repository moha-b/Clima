import '../enum/weather_state.dart';
import '../utils/utils.dart';

extension MapWeatherCode on int {
  WeatherState mapToWeatherState() {
    switch (this) {
      case 0:
        return WeatherState.Clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherState.Clouds;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
        return WeatherState.Rain;
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
        return WeatherState.Rain;
      case 71:
      case 73:
      case 75:
      case 77:
        return WeatherState.Snow;
      case 80:
      case 81:
      case 82:
      case 85:
      case 86:
        return WeatherState.Rain;
      case 95:
        return WeatherState.Storm;
      case 96:
      case 99:
        return WeatherState.Storm;
      default:
        return WeatherState.Unknown;
    }
  }
}

extension MapWeatherStateToImage on WeatherState {
  String getImages(bool isDay) {
    switch (this) {
      case WeatherState.Storm:
        return AppLottie.dailyStorm;
      case WeatherState.Rain:
        return isDay ? AppLottie.dailyDayRain : AppLottie.dailyNightRain;
      case WeatherState.Snow:
        return isDay ? AppLottie.dailyDaySnow : AppLottie.dailyNightSnow;
      case WeatherState.Wind:
        return AppLottie.dailyWind;
      case WeatherState.Clear:
        return isDay ? AppLottie.dailyDay : AppLottie.dailyNight;
      case WeatherState.Clouds:
        return isDay ? AppLottie.dailyDayCloud : AppLottie.dailyNightCloud;
      default:
        return AppLottie.dailyStorm;
    }
  }
}

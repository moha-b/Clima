import '../enum/weather_state.dart';

extension WeatherStateExtension on WeatherState {
  String getMessage() {
    String comparisonMessage = '';

    //
    // if (todayTemperature > yesterdayTemperature) {
    //   comparisonMessage = 'It\'s a bit warmer than yesterday';
    // } else if (todayTemperature < yesterdayTemperature) {
    //   comparisonMessage = 'It\'s a bit cooler than yesterday';
    // } else {
    //   comparisonMessage = 'It\'s the same as yesterday';
    // }

    switch (this) {
      case WeatherState.Storm:
        return 'There\'s a storm today! $comparisonMessage.';
      case WeatherState.Rain:
        return 'It\'s raining today. Don\'t forget your umbrella! $comparisonMessage.';
      case WeatherState.Snow:
        return 'It\'s a snowy day. Bundle up! $comparisonMessage.';
      case WeatherState.Wind:
        return 'It\'s windy out there! $comparisonMessage.';
      case WeatherState.Clear:
        return 'It\'s a clear day! $comparisonMessage.';
      case WeatherState.Clouds:
        return 'It\'s a cloudy day. Be careful, it might rain! $comparisonMessage.';
      case WeatherState.Unknown:
        return 'Unknown weather condition.';
      default:
        return 'Unknown weather condition.';
    }
  }
}

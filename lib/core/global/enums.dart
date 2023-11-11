enum WeatherState {
  Storm,
  Rain,
  Snow,
  Wind,
  Clear,
  Clouds,
  Unknown,
}

extension MapWeatherState on String {
  WeatherState mapToWeatherState() {
    switch (toLowerCase()) {
      case 'thunderstorm':
        return WeatherState.Storm;
      case 'drizzle':
      case 'rain':
        return WeatherState.Rain;
      case 'snow':
        return WeatherState.Snow;
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'sand':
      case 'ash':
      case 'squall':
      case 'tornado':
        return WeatherState.Wind;
      case 'clear':
        return WeatherState.Clear;
      case 'clouds':
        return WeatherState.Clouds;
      default:
        return WeatherState.Unknown;
    }
  }
}

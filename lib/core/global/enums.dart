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

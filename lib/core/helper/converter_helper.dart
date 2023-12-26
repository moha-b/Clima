import 'package:clima/core/utils/utils.dart';

import '../global/enums.dart';

class TemperatureConverter {
  static double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }
}

class DateFormatter {
  static final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  static final List<String> _daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  static String format(DateTime dateTime) {
    String month = _months[dateTime.month - 1];
    String day = dateTime.day.toString();
    String year = dateTime.year.toString();

    return '$month $day, $year';
  }

  static String formatDay(String time) {
    DateTime dateTime = DateTime.parse(time);
    String dayOfWeek = _daysOfWeek[dateTime.weekday - 1];
    String formattedDate =
        '$dayOfWeek, ${dateTime.day}, ${_months[dateTime.month - 1]}';

    return formattedDate;
  }

  static String formatHours(String time) {
    // Convert the hour-minute string to DateTime to format it as desired
    DateTime dateTime = DateTime.parse(time);

    // Format the time as "$hour AM || PM" format
    String formattedTime =
        "${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12} ${dateTime.hour < 12 ? 'AM' : 'PM'}";

    return formattedTime;
  }
}

String getDayImage(WeatherState weatherState) {
  switch (weatherState) {
    case WeatherState.Storm:
      return AppLottie.dailyStorm;
    case WeatherState.Rain:
      return AppLottie.dailyDayRain;
    case WeatherState.Snow:
      return AppLottie.dailyDaySnow;
    case WeatherState.Wind:
      return AppLottie.dailyWind;
    case WeatherState.Clear:
      return AppLottie.dailyDay;
    case WeatherState.Clouds:
      return AppLottie.dailyDayCloud;
    default:
      return 'unknown_image.png';
  }
}

String getNightImage(WeatherState weatherState) {
  switch (weatherState) {
    case WeatherState.Storm:
      return AppLottie.dailyStorm;
    case WeatherState.Rain:
      return AppLottie.dailyNightRain;
    case WeatherState.Snow:
      return AppLottie.dailyNightSnow;
    case WeatherState.Wind:
      return AppLottie.dailyWind;
    case WeatherState.Clear:
      return AppLottie.dailyNight;
    case WeatherState.Clouds:
      return AppLottie.dailyNightCloud;
    default:
      return 'unknown_image.png';
  }
}

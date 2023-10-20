class TemperatureConverter {
  static double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }
}

class DateFormatter {
  static String format(DateTime dateTime) {
    final months = [
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

    String month = months[dateTime.month - 1]; // Adjust month index
    String day = dateTime.day.toString();
    String year = dateTime.year.toString();

    return '$month $day, $year';
  }
}

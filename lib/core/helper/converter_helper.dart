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

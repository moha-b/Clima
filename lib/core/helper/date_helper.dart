import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(String inputDate, String format) {
    return DateFormat(format).format(DateTime.parse(inputDate));
  }
}

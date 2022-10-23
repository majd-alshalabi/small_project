import 'package:intl/intl.dart';

class Utils {
  static String sysDateFormat(var date) {
    return '${DateFormat("yyyy-MM-dd").format(date)} ${DateFormat("hh:mm a").format(date)}';
  }
}

import 'package:intl/intl.dart';

class DateTimeUtils {
  static final DateFormat _formatter = DateFormat.yMd();

  static String format({required DateTime date}) => _formatter.format(date);
}

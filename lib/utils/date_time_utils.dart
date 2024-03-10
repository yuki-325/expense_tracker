import 'package:intl/intl.dart';

class DateTimeUtils {
  static const YEAR_DAYS = 365;
  static final DateFormat _formatter = DateFormat.yMd();

  static String format({required DateTime date}) => _formatter.format(date);
}

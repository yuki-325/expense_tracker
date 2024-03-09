import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("logger factory test", () {
    var logger = LoggerFactory.getLogger();
    logger.i("info message");
    logger.e("error message");
    logger.w("warn message");
    logger.d("debug message");
  });
}

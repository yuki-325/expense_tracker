import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:test/test.dart';

void main() {
  group(
    LoggerFactory,
    () {
      test("logger factory test", () {
        var logger = LoggerFactory.getLogger();
        logger.i("info message");
        logger.e("error message");
        logger.w("warn message");
        logger.d("debug message");
      });
    },
  );
}

import 'package:expense_tracker/logger/custom_logger_printer.dart';
import 'package:logger/logger.dart';

class LoggerFactory {
  static Logger getLogger() {
    return Logger(
      printer: CustomLoggerPrinter(
        PrettyPrinter(
          colors: false,
          methodCount: 1,
          excludePaths: [
            'package:expense_tracker/logger/custom_logger_printer.dart'
          ],
        ),
      ),
    );
  }
}

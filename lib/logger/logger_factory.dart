import 'package:logger/logger.dart';

class LoggerFactory {
  static Logger getLogger() {
    return Logger(printer: PrettyPrinter(colors: true, methodCount: 0));
  }
}

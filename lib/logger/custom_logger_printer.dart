import 'package:logger/logger.dart';

class CustomLoggerPrinter extends LogPrinter {
  CustomLoggerPrinter(this._realPrinter,
      {debug, verbose, wtf, info, warning, error, nothing})
      : super() {
    _prefixMap = {
      Level.debug: debug ?? '  [DEBUG]',
      Level.verbose: verbose ?? '[VERBOSE]',
      Level.wtf: wtf ?? '    [WTF]',
      Level.info: info ?? '   [INFO]',
      Level.warning: warning ?? '[WARNING]',
      Level.error: error ?? '  [ERROR]',
      Level.nothing: nothing ?? '[NOTHING]',
    };
  }

  final LogPrinter _realPrinter;
  Map<Level, String>? _prefixMap;

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(event)
        .map((s) => '${_prefixMap?[event.level]}[${event.time}] $s')
        .toList();
  }
}

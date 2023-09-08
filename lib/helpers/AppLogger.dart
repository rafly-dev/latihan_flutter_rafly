import 'package:logger/logger.dart';

var _logger = Logger();

class AppLogger {
  static void log(
    //ignore:avoid-dynamic,avoid_annotating_with_dynamic
    dynamic message, {
    LogType logType = LogType.debug,
    //ignore:avoid-dynamic,avoid_annotating_with_dynamic
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.log(_logTypeToLogLevel(logType), message, error: error, stackTrace: stackTrace);
  }

  static void errorLog(
    //ignore:avoid-dynamic,avoid_annotating_with_dynamic
    dynamic message, {
    //ignore:avoid-dynamic,avoid_annotating_with_dynamic
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.log(Level.error, message, error: error, stackTrace: stackTrace);
  }

  static Level _logTypeToLogLevel(LogType logType) {
    switch (logType) {
      case LogType.verbose:
        return Level.verbose;

      case LogType.debug:
        return Level.debug;
      case LogType.info:
        return Level.info;

      case LogType.warning:
        return Level.warning;

      case LogType.error:
        return Level.error;

      case LogType.wtf:
        return Level.wtf;

      case LogType.nothing:
        return Level.nothing;
    }
  }
}

enum LogType {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
  nothing,
}

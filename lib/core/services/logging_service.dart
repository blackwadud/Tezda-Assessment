import 'package:logger/logger.dart';

class Print {
  final Logger _logger = Logger();

  void logInfo(String message) {
    _logger.i(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logError(String message) {
    _logger.e(message);
  }
}

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class Log {
  static void create(String message) {
    final logger = Logger('LOGGING');

    logger.info(message);
  }

  static setup() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      if (kDebugMode) {
        print('${rec.level.name}: ${rec.time} => ${rec.message}');
      }
    });
  }
}

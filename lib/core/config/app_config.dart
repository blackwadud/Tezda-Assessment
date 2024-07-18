import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'environment.dart';

class AppConfig {
  static String get appName {
    switch (EnvironmentConfig.environment) {
      case Environment.prod:
        return 'Tezda';
      case Environment.dev:
      default:
        return 'Tezda Test';
    }
  }

  static String? get apiBaseUrl {
    switch (EnvironmentConfig.environment) {
      case Environment.prod:
        return dotenv.env['LIVE_URL'];
      case Environment.dev:
      default:
        return dotenv.env['TEST_URL'];
    }
  }



  static bool get debug {
    switch (EnvironmentConfig.environment) {
      case Environment.prod:
        return false;
      case Environment.dev:
      default:
        return true;
    }
  }
}

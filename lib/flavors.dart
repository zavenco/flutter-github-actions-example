// ignore_for_file: constant_identifier_names
import 'package:flutter_ci_test/config.dart';

enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

extension FlavorName on Flavor {
  String get name => toString().split('.').last;
  String get shortName {
    switch (this) {
      case Flavor.DEVELOPMENT:
        return 'DEV';
      case Flavor.STAGING:
        return 'BETA';
      case Flavor.PRODUCTION:
        return 'PROD';
    }
  }
}

class F {
  static late Flavor _appFlavor;

  static Flavor get appFlavor => _appFlavor;

  static String get title {
    switch (_appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Flutter Test CI App Alpha';
      case Flavor.STAGING:
        return 'Flutter Test CI App Beta';
      case Flavor.PRODUCTION:
        return 'Flutter Test CI App';
      default:
        return 'title';
    }
  }

  static Future<void> init(Flavor flavor) async {
    _appFlavor = flavor;
    await Config.init(flavor);
  }

}

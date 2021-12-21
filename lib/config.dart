import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ci_test/app.dart';
import 'package:flutter_ci_test/flavors.dart';

class Config {
  Config._();

  static bool _developerComfort = false;

  static bool get developerComfort => _developerComfort;

  static Future<void> init(Flavor flavor) async {
    if (kDebugMode) {
      if (flavor == Flavor.DEVELOPMENT) {
        _developerComfort = true;
      }
    }

    runApp(const App());
  }
}

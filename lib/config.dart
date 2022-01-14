import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ci_test/app.dart';
import 'package:flutter_ci_test/common/rest_client/rest_client.dart';
import 'package:flutter_ci_test/common/rest_client/rest_client_dio.dart';
import 'package:flutter_ci_test/environment_config.dart';
import 'package:flutter_ci_test/flavors.dart';
import 'package:flutter_ci_test/repository/post_repository.dart';
import 'package:get_it/get_it.dart';

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

    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await _setUpGetIt();

    runApp(const App());
  }

  static Future _setUpGetIt() async {
    GetIt.I.registerSingleton<RestClient>(RestClientDio(baseUrl: EnvironmentConfig.apiBaseUrl));
    GetIt.I.registerSingleton<PostRepository>(PostRepository(restClient: GetIt.I.get<RestClient>()));
  }
}

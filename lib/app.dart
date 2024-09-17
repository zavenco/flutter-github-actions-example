import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ci_test/screen/home/home_screen.dart';
import 'package:flutter_ci_test/screen/post_details/post_details_screen.dart';
import 'package:flutter_ci_test/theme.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.light();

    return MaterialApp(
      title: F.title,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
      ),
      home: _flavorBanner(
        child: const HomeScreen(),
        show: kDebugMode,
      ),
      routes: {
        PostDetailsScreen.routeName: (context) => const PostDetailsScreen(),
      },
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              child: child,
              location: BannerLocation.topStart,
              message: F.appFlavor.shortName,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
            )
          : Container(
              child: child,
            );
}

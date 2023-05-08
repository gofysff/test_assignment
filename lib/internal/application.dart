import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_assignment/presentation/screens/screen2.dart';
import 'package:test_assignment/presentation/screens/screen3.dart';
import 'package:test_assignment/presentation/styling/theme.dart';

import '../presentation/screens/screen1.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    setVerticalModeInApplication();
    return MaterialApp(
      theme: applicationTheme(),
      routes: routes,
    );
  }

  void setVerticalModeInApplication() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => SearchCity(),
        DetailWeatherInfo.routeName: (context) => const DetailWeatherInfo(),
        Weather3Days.routeName: (context) => const Weather3Days(),
      };
}

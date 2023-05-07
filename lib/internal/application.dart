import 'package:flutter/material.dart';
import 'package:test_assignment/presentation/screen2.dart';
import 'package:test_assignment/presentation/screen3.dart';

import '../presentation/screen1.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => const SearchCity(),
        DetailWeatherInfo.routeName: (context) => const DetailWeatherInfo(),
        Weather3Days.routeName: (context) => const Weather3Days(),
      };
}

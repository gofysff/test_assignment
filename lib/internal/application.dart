import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';
import 'package:test_assignment/presentation/screens/screen2/screen2.dart';
import 'package:test_assignment/presentation/screens/screen3/screen3.dart';
import 'package:test_assignment/presentation/styling/theme.dart';
import '../presentation/screens/screen1/screen1.dart';
import 'dependencies/repository_module.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ListWeatherBloc listWeatherBloc = ListWeatherBloc();

  @override
  Widget build(BuildContext context) {
    setVerticalModeInApplication();
    return BlocProvider(
      create: (context) => CityWeatherBloc(weatherRepository),
      child: MaterialApp(
        theme: applicationTheme(),
        routes: routes,
      ),
    );
  }

  void setVerticalModeInApplication() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Map<String, WidgetBuilder> get routes => {
        '/': (context) => const SearchCity(),
        // TODO: add listWeatherBloc to Weather3Days and DetailWeatherInfo

        DetailWeatherInfo.routeName: (context) => const DetailWeatherInfo(),
        Weather3Days.routeName: (context) => const Weather3Days(),
      };

  @override
  void dispose() {
    listWeatherBloc.close();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';

class ToPreviousScreenButton extends StatelessWidget {
  const ToPreviousScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<CityWeatherBloc>(context).add(CityWeatherInitialised());
        BlocProvider.of<ListWeatherBloc>(context).add(ListWeatherInitialised());
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';
import '../../screen3/screen3.dart';

class ToDetailInfoButton extends StatelessWidget {
  const ToDetailInfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityWeatherBloc, CityWeatherState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<ListWeatherBloc>(context)
                .add(ListWeatherSuccessEvent(state.cityName));

            Navigator.of(context).pushNamed(Weather3Days.routeName);
          },
          icon: const Icon(Icons.menu_rounded),
        );
      },
    );
  }
}

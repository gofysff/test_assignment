import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/model/weather_type.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/presentation/emojies/weather_type_emojies.dart';
import 'package:test_assignment/presentation/screens/screen3/res.dart';

import 'widgets/detailed_weather_info_card.dart';
import 'widgets/to_detail_info_button.dart';
import 'widgets/to_previous_screen_button.dart';

class DetailWeatherInfo extends StatelessWidget {
  static const routeName = '/detailWeatherInfo';
  const DetailWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /// this is used to prevent user from going back to previous screen by pressing  default back button
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: const ToPreviousScreenButton(),
          actions: const [ToDetailInfoButton()],
        ),
        body: _body(),
      ),
    );
  }

  ListView _body() {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        _cityName,
        _weatherEmoji,
        _currentTemperature,
        const SizedBox(height: 150),
        const DetailedWeatherInfoCard(height: 230)
      ],
    );
  }

  BlocBuilder<CityWeatherBloc, CityWeatherState> get _currentTemperature =>
      BlocBuilder<CityWeatherBloc, CityWeatherState>(
        builder: (context, state) {
          return Center(
            child: Text(
              '${state.weather?.temp}$measurementUnit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      );

  SizedBox get _weatherEmoji => SizedBox(
        height: 200,
        child: Center(
          child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
            builder: (context, state) {
              return Text(
                state.weather?.weatherType.toEmoji() ??
                    WeatherType.drizzle.toEmoji(),
                style: const TextStyle(fontSize: 100),
              );
            },
          ),
        ),
      );

  BlocBuilder<CityWeatherBloc, CityWeatherState> get _cityName =>
      BlocBuilder<CityWeatherBloc, CityWeatherState>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.cityName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      );
}

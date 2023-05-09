import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/model/weather_type.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/presentation/emojies/weather_type_emojies.dart';
import 'package:test_assignment/presentation/screens/screen3/res.dart';
import 'package:test_assignment/presentation/screens/screen3/screen3.dart';
import 'package:weather_icons/weather_icons.dart';

import '../../utils/detail_parameter_info.dart';
import 'res.dart';

class DetailWeatherInfo extends StatelessWidget {
  static const routeName = '/detailWeatherInfo';
  const DetailWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Weather3Days.routeName);
            },
            icon: const Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<CityWeatherBloc, CityWeatherState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.city,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: Text(
                WeatherType.drizzle.toEmoji(),
                style: const TextStyle(fontSize: 100),
              ),
            ),
          ),
          BlocBuilder<CityWeatherBloc, CityWeatherState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  '${state.weather?.temp}$measurementUnit',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),
          const SizedBox(height: 150),
          const _DetailedWeatherInfoCard(
            height: 230,
          )
        ],
      ),
    );
  }
}

class _DetailedWeatherInfoCard extends StatelessWidget {
  const _DetailedWeatherInfoCard({required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        child: Column(
          children: [
            firstRow,
            secondRow,
          ],
        ),
      ),
    );
  }

  Expanded get firstRow => Expanded(
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
                  builder: (context, state) {
                    return DetailParameterInfo(
                      iconData: WeatherIcons.thermometer,
                      detailLabel: detailParameterInfo_1_1Label,
                      detailData:
                          '${state.weather?.tempMin}$unitOfTempMeasurement',
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
                  builder: (context, state) {
                    return DetailParameterInfo(
                      iconData: WeatherIcons.thermometer,
                      detailLabel: detailParameterInfo_1_2Label,
                      detailData:
                          '${state.weather?.tempMax}$unitOfTempMeasurement',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );

  Expanded get secondRow => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                return DetailParameterInfo(
                  iconData: WeatherIcons.humidity,
                  detailLabel: detailParameterInfo_2_1Label,
                  detailData: '${state.weather?.humidity}}%',
                );
              },
            ),
            BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                return DetailParameterInfo(
                  iconData: WeatherIcons.windy,
                  detailLabel: detailParameterInfo_2_2Label,
                  detailData:
                      '${state.weather?.windSpeed} $unitOfWindMeasurement',
                );
              },
            ),
          ],
        ),
      );
}

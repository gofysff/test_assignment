import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:weather_icons/weather_icons.dart';

import '../res.dart';
import 'detail_parameter_info.dart';

/// widget for detailed weather info in card in 2 rows (see [firstRowCard] and [secondRowCard] for more info)
class DetailedWeatherInfoCard extends StatelessWidget {
  const DetailedWeatherInfoCard({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        child: Column(
          children: const [
            _FirstRowCard(),
            _SecondRowCard(),
          ],
        ),
      ),
    );
  }
}

class _SecondRowCard extends StatelessWidget {
  const _SecondRowCard();

  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                return DetailParameterInfo(
                  iconData: WeatherIcons.humidity,
                  detailLabel: detailParameterInfo_2_1Label,
                  detailData: '${state.weather?.humidity}%',
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

class _FirstRowCard extends StatelessWidget {
  const _FirstRowCard();

  @override
  Widget build(BuildContext context) => Expanded(
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
}

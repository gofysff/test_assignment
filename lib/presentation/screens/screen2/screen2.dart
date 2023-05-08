import 'package:flutter/material.dart';
import 'package:test_assignment/domain/model/weather_type.dart';
import 'package:test_assignment/presentation/emojies/weather_type_emojies.dart';
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
          Center(
            child: Text(
              'Madrid',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
          Center(
            child: Text(
              '31\u2103',
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
          children: const [
            Expanded(
              child: Center(
                // child: Text('Temp min'),
                child: DetailParameterInfo(
                  iconData: WeatherIcons.thermometer,
                  detailLabel: detailParameterInfo_1_1Label,
                  detailData: '20\u2103',
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: DetailParameterInfo(
                  iconData: WeatherIcons.thermometer,
                  detailLabel: detailParameterInfo_1_2Label,
                  detailData: '25\u2103',
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
          children: const [
            DetailParameterInfo(
              iconData: WeatherIcons.humidity,
              detailLabel: detailParameterInfo_2_1Label,
              detailData: '50%',
            ),
            DetailParameterInfo(
              iconData: WeatherIcons.windy,
              detailLabel: detailParameterInfo_2_2Label,
              detailData: '2.4 km/h',
            ),
          ],
        ),
      );
}

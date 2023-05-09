import 'package:flutter/material.dart';

import '../screens/screen3/res.dart';

class ListWeatherData extends StatelessWidget {
  ListWeatherData({super.key, required this.days, required this.temp}) {
    if (days.length != temp.length) {
      throw Exception('days and minTemp must have the same length');
    }
  }

  /// days of the week (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
  final List<String> days;

  /// contains the minimum temperature, maximum temperature and average
  /// temperature for each day in corresponding order
  final List<List<int>> temp;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: formListChildren(),
    );
  }

  List<Widget> formListChildren() {
    List<Widget> listViewChildrens = [
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [Text('min'), Text('max'), Text('average')],
        ),
      )
    ];
    for (int i = 0; i < days.length; i++) {
      listViewChildrens.add(
        ListTile(
          title: Text(days[i]),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${temp[i][0]}$measurementUnit - $minimum'),
              Text('${temp[i][1]}$measurementUnit - $maximum'),
              Text('${temp[i][2]}$measurementUnit - $average')
            ],
          ),
        ),
      );
    }
    return listViewChildrens;
  }
}

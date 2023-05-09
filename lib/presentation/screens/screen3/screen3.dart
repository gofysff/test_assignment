import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';
import 'package:test_assignment/presentation/screens/screen3/res.dart';

class Weather3Days extends StatelessWidget {
  static const routeName = '/weather3Days';
  const Weather3Days({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          titleAppBar,
          style: Theme.of(context).primaryTextTheme.titleLarge,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: BlocBuilder<ListWeatherBloc, ListWeatherState>(
                  builder: (context, statelist) {
                    return BlocBuilder<CityWeatherBloc, CityWeatherState>(
                      builder: (context, stateCity) {
                        if (statelist.isSorted) {
                          return Text(
                            '$labelText${stateCity.city} $sortedBy $sortingAction2',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        } else {
                          return Text(
                            '$labelText${stateCity.city} $sortedBy $sortingAction1',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                BlocProvider.of<ListWeatherBloc>(context)
                    .add(ListWeatherChangeSortEvent());
              },
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<ListWeatherBloc, ListWeatherState>(
                    builder: (context, state) {
                      if (state.isSorted) {
                        return const Center(
                            child: Text('$sortBy $sortingAction1'));
                      } else {
                        return const Center(
                            child: Text('$sortBy $sortingAction2'));
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            // TODO:
            // exampleListWeather
          ],
        ),
      ),
    );
  }

  Widget get exampleListWeather => ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [Text('min'), Text('max'), Text('average')],
            ),
          ),
          ListTile(
            title: const Text('Monday'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('20°C - min'),
                Text('25°C - max'),
                Text('22°C - average')
              ],
            ),
          ),
          ListTile(
            title: const Text('Monday'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('20°C - min'),
                Text('25°C - max'),
                Text('22°C - average')
              ],
            ),
          ),
        ],
      );
}

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
    // return ListView(
    //   shrinkWrap: true,
    //   children: listViewChildrens,
    // );
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

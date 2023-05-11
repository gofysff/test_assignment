import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';
import 'package:test_assignment/presentation/screens/screen3/res.dart';
import 'package:test_assignment/presentation/screens/screen3/widgets/list_weather_data.dart';

class Weather3Days extends StatelessWidget {
  static const routeName = '/weather3Days';
  const Weather3Days({super.key});

  @override
  Widget build(BuildContext context) {
    final city = BlocProvider.of<CityWeatherBloc>(context).state.city;
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
                  builder: (context, stateList) {
                    if (stateList.isSorted) {
                      return Text(
                        '$labelText$city $sortedBy $sortingAction2',
                        style: Theme.of(context).textTheme.titleMedium,
                      );
                    } else {
                      return Text(
                        '$labelText$city $sortedBy $sortingAction1',
                        style: Theme.of(context).textTheme.titleMedium,
                      );
                    }
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
            BlocBuilder<ListWeatherBloc, ListWeatherState>(
              builder: (context, state) {
                if (state.status.isInitial || state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status.isError) {
                  return const Center(child: Text('Error'));
                }
                // is loaded
                return ListWeatherData(
                    days: state.showWeakDays, temp: state.showAllTemp);
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/list_weather/list_weather_bloc.dart';

import '../res.dart';

class ChangeSortingTypeButton extends StatelessWidget {
  const ChangeSortingTypeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<ListWeatherBloc>(context).add(
          ListWeatherChangeSortEvent(),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: _buttonText(),
        ),
      ),
    );
  }

  BlocBuilder<ListWeatherBloc, ListWeatherState> _buttonText() {
    return BlocBuilder<ListWeatherBloc, ListWeatherState>(
      builder: (context, state) {
        if (state.isSorted) {
          return const Center(child: Text('$sortBy $sortingAction1'));
        } else {
          return const Center(child: Text('$sortBy $sortingAction2'));
        }
      },
    );
  }
}

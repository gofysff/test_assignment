import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';

import '../../../styling/colors.dart';
import '../res.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            errorText,
            style: TextStyle(color: textPrimaryColor, fontSize: 50),
          ),
          const SizedBox(height: 30),
          restartButton,
        ],
      ),
    );
  }

  Widget get restartButton => SizedBox(
        width: double.infinity,
        height: 50,
        child: Builder(builder: (context) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundElevatedButtonsColor,
            ),
            onPressed: () {
              controller.clear();
              BlocProvider.of<CityWeatherBloc>(context)
                  .add(CityWeatherInitialEvent());
            },
            child: Text(
              restartButtonText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }),
      );
}

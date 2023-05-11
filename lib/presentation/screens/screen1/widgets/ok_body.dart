import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';

import '../../../styling/colors.dart';
import '../res.dart';

/// This widget is used to show the text field and the confirm button
/// to the user
/// this is initial state of our screen
class OkBody extends StatelessWidget {
  const OkBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [textField, confirmButton],
    );
  }

  Widget get textField => TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      );

  Widget get confirmButton => SizedBox(
        width: double.infinity,
        height: 50,
        child: Builder(builder: (context) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundElevatedButtonsColor,
            ),
            onPressed: () {
              // TODO: add validation
              final text = controller.text.trim();
              controller.clear();
              BlocProvider.of<CityWeatherBloc>(context).add(
                CityWeatherChangeEvent(text),
              );
            },
            child: Text(
              confirmButtonText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }),
      );
}

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
      children: [
        _CustomTextField(controller: controller),
        _ConfirmButton(controller: controller)
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  const _CustomTextField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      );
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
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
                CityWeatherChanged(text),
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

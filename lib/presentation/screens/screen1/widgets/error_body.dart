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
          _RestartButton(controller: controller),
        ],
      ),
    );
  }
}

class _RestartButton extends StatefulWidget {
  const _RestartButton({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<_RestartButton> createState() => _RestartButtonState();
}

class _RestartButtonState extends State<_RestartButton> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundElevatedButtonsColor,
          ),
          onPressed: () {
            widget.controller.clear();
            BlocProvider.of<CityWeatherBloc>(context)
                .add(CityWeatherInitialised());
          },
          child: Text(
            restartButtonText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
}

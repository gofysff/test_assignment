import 'package:flutter/material.dart';

import '../styling/colors.dart';
import 'screen2.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});
  static const routeName = '/';

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Weather App',
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [textField, confirmButton],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget get textField => TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter the city name',
        ),
      );

  Widget get confirmButton => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundElevatedButtonsColor,
          ),
          onPressed: () {
            // TODO: add validation
            // TODO: add logic to get data from API
            // call to bloc
            Navigator.pushNamed(context, DetailWeatherInfo.routeName);
          },
          child:
              Text('Confirm', style: Theme.of(context).textTheme.titleMedium),
        ),
      );
}

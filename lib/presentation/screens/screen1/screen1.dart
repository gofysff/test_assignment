import 'package:flutter/material.dart';

import '../../styling/colors.dart';
import '../screen2/screen2.dart';
import 'res.dart';

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
            appBarTitleText,
            style: Theme.of(context).primaryTextTheme.titleLarge,
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
          hintText: hintText,
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
          child: Text(
            confirmButtonText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
}

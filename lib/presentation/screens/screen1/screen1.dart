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
        //TODO: add logic to show error or ok body
        // set consumer here
        child: okBody,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showSnackBarWihError() {
    //TODO: test this
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(errorText),
      ),
    );
  }

  Widget get okBody => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textField, confirmButton],
      );

  Widget get errorBody => const Center(
        child: Text(
          errorText,
          style: TextStyle(color: textPrimaryColor, fontSize: 50),
        ),
      );

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

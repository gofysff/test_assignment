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
  late double _heightScreen;

  @override
  void didChangeDependencies() {
    _heightScreen = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

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

  void _showSnackBarWihError({double bottomMargin = 500.0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: const Text(errorText),
        margin: EdgeInsets.only(bottom: bottomMargin),
      ),
    );
  }

  Widget get okBody => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [textField, confirmButton],
      );

  Widget get errorBody => Center(
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

  Widget get restartButton => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundElevatedButtonsColor,
          ),
          onPressed: () {
            // call again to bloc
            //tODO: complete this
          },
          child: Text(
            restartButtonText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
}

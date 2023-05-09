import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';

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
  GlobalKey<ScaffoldState> firstScreenKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    _heightScreen = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Center(
  //         child: Text(
  //           appBarTitleText,
  //           style: Theme.of(context).primaryTextTheme.titleLarge,
  //         ),
  //       ),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       //TODO: add logic to show error or ok body
  //       // set consumer here
  //       child: okBody,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: firstScreenKey,
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
        child: BlocConsumer<CityWeatherBloc, CityWeatherState>(
          listener: (context, state) {
            if (state.status.isError) {
              _showSnackBarWihError(bottomMargin: _heightScreen / 2);
            } else if (state.status.isSuccess) {
              Navigator.of(context).pushNamed(DetailWeatherInfo.routeName);
            }
          },
          builder: (context, state) {
            if (state.status.isInitial) {
              return okBody;
            } else if (state.status.isError) {
              return errorBody;
            } else if (state.status.isLoading || state.status.isSuccess) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        ),
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
            BlocProvider.of<CityWeatherBloc>(context).add(
              CityWeatherEventChange(_controller.text.trim()),
            );
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
            BlocProvider.of<CityWeatherBloc>(context)
                .add(CityWeatherEventInitial());
          },
          child: Text(
            restartButtonText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
}

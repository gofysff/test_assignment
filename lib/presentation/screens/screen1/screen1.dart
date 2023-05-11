// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment/domain/screen_blocs/city_weather/city_weather_bloc.dart';
import '../screen2/screen2.dart';
import 'res.dart';
import 'widgets/error_body.dart';
import 'widgets/ok_body.dart';

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
        child: _body,
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

  Widget get _body => BlocConsumer<CityWeatherBloc, CityWeatherState>(
        listener: (context, state) {
          if (state.status.isError) {
            _showSnackBarWihError(bottomMargin: _heightScreen / 2);
          } else if (state.status.isSuccess) {
            Navigator.of(context).pushNamed(DetailWeatherInfo.routeName);
          }
        },
        builder: (context, state) {
          if (state.status.isInitial) {
            return OkBody(controller: _controller);
          } else if (state.status.isError) {
            return ErrorBody(controller: _controller);
          } else if (state.status.isLoading || state.status.isSuccess) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox();
        },
      );
}

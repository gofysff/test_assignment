import 'package:dio/dio.dart';
import 'package:test_assignment/data/api/exceptions/execution_response_exception.dart';
import 'package:test_assignment/data/api/exceptions/parsing_response_from_api_exception.dart';
import 'package:test_assignment/data/api/model/weather_api.dart';

import 'package:test_assignment/internal/dependencies/api_key.dart';

import '../weather_repositiry_service.dart';

/// class what is responsible for getting data from open weather api

class OpenWeatherService implements WeatherRepositoryService {
  static const _baseUrl = 'http://api.openweathermap.org/data/2.5/forecast/';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  Future<Response<dynamic>> _makeRequestToApi(String cityName,
      {String apiType = ''}) async {
    // apitype can be: daily, and other if U'r not poor like me and have money for premium account
    try {
      final Response response = await _dio.get(
        '$apiType?q=$cityName&appid=$apiKey&units=metric',
      );
      return response;
    } catch (e) {
      throw ExecutionRequestException(e.toString());
    }
  }

  @override
  Future<WeatherApi> getWeatherByCityName(String cityName) async {
    final Response response = await _makeRequestToApi(cityName);
    try {
      return WeatherApi.fromOpenWeatherApi3hours(response.data);
    } catch (e) {
      throw ParsingResponseFromApiException(e.toString());
    }
  }

  @override
  Future<List<WeatherApi>> getWeatherByCityNameFor3Days(String cityName) async {
    final Response response = await _makeRequestToApi(cityName);
    try {
      return _formListWeatherApiFromResponse(response);
    } catch (e) {
      throw ParsingResponseFromApiException(e.toString());
    }
  }

  List<WeatherApi> _formListWeatherApiFromResponse(Response response) {
    // form for 3 days
    // one day has 8 timestamps
    final List<WeatherApi> listWeatherApi = [];
    for (int i = 0; i < 3 * 8; i += 8) {
      listWeatherApi.add(
        WeatherApi.fromOpenWeatherApi3hours(response.data, indexTimeStamp: i),
      );
    }
    return listWeatherApi;
  }
}

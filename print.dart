import 'package:dio/dio.dart';

void main(List<String> args) async {
  String apiType = '';
  String cityName = 'London';
  const apiKey = 'b24bf4696e95ec39a3a6ceeaa7340768';
  // print(
  //     'api.openweathermap.org/data/2.5/forecast/$apiType?q=$cityName&appid=$apiKey&units=metric');
  // print(
  //     'api.openweathermap.org/data/2.5/forecast/daily?lat=44.34&lon=10.99&cnt=7&appid=$apiKey');
  print(
      'api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=$apiKey');

  const baseUrl = 'https://api.openweathermap.org/data/2.5/forecast/';
  final Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );
  print('$baseUrl$apiType?q=$cityName&appid=$apiKey&units=metric');
  final response = await dio.get(
    '$apiType?q=$cityName&appid=$apiKey&units=metric',
  );

  print(response.toString());
}

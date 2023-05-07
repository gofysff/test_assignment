import 'package:test_assignment/data/api/model/weather_api.dart';

/// interface what declare how we can get weather data from different sources
/// different sources can be: (rest api, graphql, local database, firebase, etc)
abstract class WeatherRepositoryService {
  Future<WeatherApi> getWeatherByCityName(String cityName);
  Future<List<WeatherApi>> getWeatherByCityNameFor3Days(String cityName);
}

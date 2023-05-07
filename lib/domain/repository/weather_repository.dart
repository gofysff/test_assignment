import 'package:test_assignment/domain/model/weather.dart';

/// interface what declare how we can get weather data from different sources
/// all possible implementation of repository should implement this interface
abstract class WeatherRepository {
  Future<Weather> getWeatherByCityName(String cityName);
  Future<List<Weather>> getWeatherByCityNameFor3Days(String cityName);
}

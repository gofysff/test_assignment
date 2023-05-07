import 'creation_methods/open_weather_current_creation.dart';
import 'creation_methods/open_weather_daily_creation.dart';

/// class what will be used to get data from the api
/// this class has all fields same type as in the api response
/// we use openweathermap.org api
class WeatherApi {
  final double windSpeed;
  final int humidity;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int weatherTypeCode;

  WeatherApi(
      {required this.tempMin,
      required this.tempMax,
      required this.windSpeed,
      required this.humidity,
      required this.temp,
      required this.weatherTypeCode});

  /// creation model from json from this api https://openweathermap.org/current
  factory WeatherApi.fromOpenWeatherCurrentJson(Map<String, dynamic> json) =>
      createFromOpenWeatherCurrentJson(json);

  /// creation model from json from this api https://openweathermap.org/forecast16
  factory WeatherApi.fromOpenWeatherDailyJson(
          Map<String, dynamic> json, int indexTimeStamp) =>
      createFromOpenWeatherCurrentJsonfromOpenWeatherDailyJson(
          json, indexTimeStamp);
}

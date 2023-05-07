import '../weather_api.dart';

/// creation model from json from this api https://openweathermap.org/current
/// used in facotory constructor of WeatherApi

WeatherApi createFromOpenWeatherCurrentJson(Map<String, dynamic> json) =>
    WeatherApi(
      weatherTypeCode: json['weather'][0]['id'],
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );

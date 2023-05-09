import '../weather_api.dart';

///Creation model from json from this api https://openweathermap.org/forecast5
/// Used in facotory constructor of [WeatherApi]
WeatherApi createFrom3hours(Map<String, dynamic> json, int indexTimeStamp) =>
    WeatherApi(
      tempMin: json['list'][indexTimeStamp]['main']['temp_min'],
      tempMax: json['list'][indexTimeStamp]['main']['temp_max'],
      windSpeed: json['list'][indexTimeStamp]['wind']['speed'],
      humidity: json['list'][indexTimeStamp]['main']['humidity'],
      temp: json['list'][indexTimeStamp]['main']['temp'],
      weatherTypeCode: json['list'][indexTimeStamp]['weather'][0]['id'],
    );

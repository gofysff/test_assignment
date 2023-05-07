import '../weather_api.dart';

/// creation model from json from this api https://openweathermap.org/forecast16
/// used in facotory constructor of [WeatherApi]
WeatherApi createFromOpenWeatherCurrentJsonfromOpenWeatherDailyJson(
        Map<String, dynamic> json, int indexTimeStamp) =>
    WeatherApi(
      humidity: json['list'][indexTimeStamp]['humidity'],
      windSpeed: json['list'][indexTimeStamp]['wind']['speed'],
      temp: json['list'][indexTimeStamp]['temp']['day'],
      tempMin: json['list'][indexTimeStamp]['temp']['temp_min'],
      tempMax: json['list'][indexTimeStamp]['temp']['temp_max'],
      weatherTypeCode: json['list'][indexTimeStamp]['weather'][0]['id'],
    );

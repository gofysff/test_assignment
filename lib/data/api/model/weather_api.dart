/// class what will be used to get data from the api
/// this class has all fields same type as in the api response
/// we use openweathermap.org api
class WeatherApi {
  final double windSpeed;
  final int humidity;
  final double temp;
  final double tempMin;
  final double tempMax;

  WeatherApi(
      {required this.tempMin,
      required this.tempMax,
      required this.windSpeed,
      required this.humidity,
      required this.temp});

  factory WeatherApi.fromCurrentJson(Map<String, dynamic> json) {
    // response to this format https://openweathermap.org/current
    return WeatherApi(
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );
  }

  factory WeatherApi.fromDailyForecast(
      Map<String, dynamic> json, int indexTimeStamp) {
    // response to this format https://openweathermap.org/forecast16
    return WeatherApi(
      humidity: json['list'][indexTimeStamp]['humidity'],
      windSpeed: json['list'][indexTimeStamp]['wind']['speed'],
      temp: json['list'][indexTimeStamp]['temp']['day'],
      tempMin: json['list'][indexTimeStamp]['temp']['temp_min'],
      tempMax: json['list'][indexTimeStamp]['temp']['temp_max'],
    );
  }
}

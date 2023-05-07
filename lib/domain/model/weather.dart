import 'package:test_assignment/domain/model/weather_type.dart';

/// key wheather model in domain layer
class Weather {
  final int temp;
  final int tempMin;
  final int tempMax;
  final int humidity;
  final double windSpeed;
  final WeatherType weatherType;

  Weather(this.temp, this.humidity, this.windSpeed, this.tempMin, this.tempMax,
      this.weatherType);
}

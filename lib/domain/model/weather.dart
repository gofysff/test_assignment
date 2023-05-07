/// key wheather model in domain layer
class Weather {
  final int temp;
  final int tempMin;
  final int tempMax;
  final int humidity;
  final double windSpeed;

  Weather(this.temp, this.humidity, this.windSpeed, this.tempMin, this.tempMax);
}

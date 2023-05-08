import 'package:test_assignment/domain/model/weather_type.dart';

extension WeatherEmojiesExtension on WeatherType {
  String toEmoji() {
    switch (this) {
      case WeatherType.thunderstorm:
        return '🌩';
      case WeatherType.drizzle:
        return '🌧';
      case WeatherType.rain:
        return '☔️';
      case WeatherType.snow:
        return '☃️';
      case WeatherType.atmosphere:
        return '🌫';
      case WeatherType.clear:
        return '☀️';
      case WeatherType.clouds:
        return '☁️';
      case WeatherType.unknown:
        return '🤷‍';
    }
  }
}

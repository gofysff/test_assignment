enum WeatherType {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  clouds,
  unknown
}

extension WeatherIconExtension on WeatherType {
  String get icon {
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

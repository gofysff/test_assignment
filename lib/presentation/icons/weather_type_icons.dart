import 'package:test_assignment/domain/model/weather_type.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/material.dart';

extension WeatherIconExtension on WeatherType {
  IconData toIconData() {
    switch (this) {
      case WeatherType.thunderstorm:
        return WeatherIcons.thunderstorm;
      case WeatherType.drizzle:
        return WeatherIcons.raindrops;
      TODO: // complete this
      default:
        return Icons.not_interested;
    }
  }
}

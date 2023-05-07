import 'package:test_assignment/data/api/model/weather_api.dart';
import 'package:test_assignment/domain/model/weather.dart';

import '../../domain/model/weather_type.dart';

///  convert data from api type to data type from domain layer (what we will need later)
Weather convertFromWeatherApi(WeatherApi weatherApi) => Weather(
      weatherApi.temp.toInt(),
      weatherApi.humidity,
      weatherApi.windSpeed,
      weatherApi.tempMin.toInt(),
      weatherApi.tempMax.toInt(),
      convertWeatherTypeCodeToWeatherType(weatherApi.weatherTypeCode),
    );

WeatherType convertWeatherTypeCodeToWeatherType(int code) {
  if (code < 300) {
    return WeatherType.thunderstorm;
  } else if (code < 400) {
    return WeatherType.drizzle;
  } else if (code < 600) {
    return WeatherType.rain;
  } else if (code < 700) {
    return WeatherType.snow;
  } else if (code < 800) {
    return WeatherType.atmosphere;
  } else if (code == 800) {
    return WeatherType.clear;
  } else if (code <= 804) {
    return WeatherType.clouds;
  } else {
    return WeatherType.unknown;
  }
}

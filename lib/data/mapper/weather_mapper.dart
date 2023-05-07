import 'package:test_assignment/data/api/model/weather_api.dart';
import 'package:test_assignment/domain/model/weather.dart';

///  convert data from api type to data type from domain layer (what we will need later)
Weather convertFromWeatherApi(WeatherApi weatherApi) => Weather(
      weatherApi.temp.toInt(),
      weatherApi.humidity,
      weatherApi.windSpeed,
      weatherApi.tempMin.toInt(),
      weatherApi.tempMax.toInt(),
    );

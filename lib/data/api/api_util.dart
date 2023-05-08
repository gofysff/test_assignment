import 'package:test_assignment/data/mapper/weather_mapper.dart';
import 'package:test_assignment/domain/model/weather.dart';

import 'services/weather_repositiry_service.dart';

/// This is top level class for API
/// abstracting the API calls

class ApiUtil {
  final WeatherRepositoryService _weatherRepositoryService;

  ApiUtil(this._weatherRepositoryService);

  Future<Weather> getWeatherByCityName(String cityName) async {
    final result =
        await _weatherRepositoryService.getWeatherByCityName(cityName);
    return convertFromWeatherApi(result);
  }

  Future<List<Weather>> getWeatherByCityNameFor3Days(String cityName) async {
    final result =
        await _weatherRepositoryService.getWeatherByCityNameFor3Days(cityName);
    final convertedResult =
        result.map((e) => convertFromWeatherApi(e)).toList();
    return convertedResult;
  }
}

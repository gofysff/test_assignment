import 'package:test_assignment/data/api/api_util.dart';
import 'package:test_assignment/domain/model/weather.dart';
import 'package:test_assignment/domain/repository/weather_repository.dart';

/// specific implementation of [WeatherDataRepository] for getting data from data layer via [ApiUtil]
/// work only with Api_Util
class WeatherDataRepository implements WeatherRepository {
  final ApiUtil _apiUtil;

  WeatherDataRepository(this._apiUtil);

  @override
  Future<Weather> getWeatherByCityName(String cityName) =>
      _apiUtil.getWeatherByCityName(cityName);

  @override
  Future<List<Weather>> getWeatherByCityNameFor3Days(String cityName) =>
      _apiUtil.getWeatherByCityNameFor3Days(cityName);
}

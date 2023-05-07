import 'package:test_assignment/domain/repository/specific_weather_repository/weather_data_repository.dart';
import 'package:test_assignment/domain/repository/weather_repository.dart';
import 'api_module.dart';

/// This is only instance of object what implement [WeatherRepository] from domain layer
final WeatherRepository weatherRepository = WeatherDataRepository(apiUtil);

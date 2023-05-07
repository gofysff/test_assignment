import 'package:test_assignment/data/api/api_util.dart';
import 'package:test_assignment/data/api/services/specific_serviece/open_weather_service.dart';

/// this is only one instance of [ApiUtil] what we can use in our app
/// here we specify what the specific [WeatherRepositoryService] is using inside ApiUtil
final ApiUtil apiUtil = ApiUtil(
  OpenWeatherService(),
);

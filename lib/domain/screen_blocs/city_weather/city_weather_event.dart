// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CityWeatherInitialised extends CityWeatherEvent {}

/// event for changing city name
class CityWeatherChanged extends CityWeatherEvent {
  CityWeatherChanged(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}

part of 'city_weather_bloc.dart';

@immutable
abstract class CityWeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CityEventInitial extends CityWeatherEvent {}

class CityEventChange extends CityWeatherEvent {
  CityEventChange(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}

part of 'list_weather_bloc.dart';

@immutable
abstract class ListWeatherEvent extends Equatable {}

/// used when [CityWeatherBloc] state is success
class ListWeatherSuccessEvent extends ListWeatherEvent {
  final String city;

  /// weather for 3 days
  final List<Weather> weathers;
  ListWeatherSuccessEvent(this.city, this.weathers);

  @override
  List<Object?> get props => [city, weathers];
}

/// used when [CityWeatherBloc] state isn't success
class ListWeatherInitialEvent extends ListWeatherEvent {
  @override
  List<Object?> get props => [];
}

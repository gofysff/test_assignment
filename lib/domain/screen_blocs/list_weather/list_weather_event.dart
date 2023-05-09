part of 'list_weather_bloc.dart';

@immutable
abstract class ListWeatherEvent extends Equatable {}

/// used when [CityWeatherBloc] state is success
class ListWeatherSuccessEvent extends ListWeatherEvent {
  final String city;

  ListWeatherSuccessEvent(
    this.city,
  );

  @override
  List<Object?> get props => [city];
}

/// used when [CityWeatherBloc] state isn't success
class ListWeatherInitialEvent extends ListWeatherEvent {
  @override
  List<Object?> get props => [];
}

/// used when  we want to sort list of weather or stop sorting
class ListWeatherChangeSortEvent extends ListWeatherEvent {
  @override
  List<Object?> get props => [];
}

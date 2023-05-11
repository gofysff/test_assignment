part of 'list_weather_bloc.dart';

@immutable
abstract class ListWeatherEvent extends Equatable {}

/// used when [CityWeatherBloc] state is success
class ListWeatherEndedWithSuccess extends ListWeatherEvent {
  final String city;

  ListWeatherEndedWithSuccess(
    this.city,
  );

  @override
  List<Object?> get props => [city];
}

/// used when [CityWeatherBloc] state isn't success
class ListWeatherInitialised extends ListWeatherEvent {
  @override
  List<Object?> get props => [];
}

/// used when  we want to sort list of weather or stop sorting
class ListWeatherChangedSortingType extends ListWeatherEvent {
  @override
  List<Object?> get props => [];
}

part of 'list_weather_bloc.dart';

class ListWeatherState extends Equatable {
  /// List of 3 days weather from current day like Monday, Tuesday, Wednesday
  /// with weather
  final List<WeekDayedWeather> weathers = [];

  /// Sorted [weathers] by criteria what we select
  /// Now it is [minTemp]
  final List<WeekDayedWeather> weathersSorted = [];

  ListWeatherState({required List<WeekDayedWeather> weathers}) {
    this.weathers.addAll(weathers);
  }

  /// Sort [weathers] by [criteria](minTemp in weather)
  void sortWeathersByCriteria() {
    weathersSorted.clear();
    weathersSorted.addAll(weathers);
    weathersSorted.sort(
      (a, b) => a.weather.tempMin.compareTo(b.weather.tempMin),
    );
  }

  @override
  List<Object?> get props => [weathers, weathersSorted];
}

class ListWeatherInitial extends ListWeatherState {
  ListWeatherInitial({required super.weathers});
}

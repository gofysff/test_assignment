// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_weather_bloc.dart';

enum ListWeatherStatus { initial, error, loading, success }

extension ChecskListWeatherStatus on ListWeatherStatus {
  bool get isInitial => this == ListWeatherStatus.initial;
  bool get isError => this == ListWeatherStatus.error;
  bool get isLoading => this == ListWeatherStatus.loading;
  bool get isSuccess => this == ListWeatherStatus.success;
}

class ListWeatherState extends Equatable {
  final ListWeatherStatus status;

  /// List of 3 days weather from current day like Monday, Tuesday, Wednesday
  /// with weather
  final List<WeekDayedWeather> _weathers = [];

  /// Sorted [_weathers] by criteria what we select
  /// Now it is [minTemp]
  final List<WeekDayedWeather> _weathersSorted = [];

  final bool isSorted;

  /// return sorted or not sorted [WeekDayedWeather] according to [isSorted]
  List<WeekDayedWeather> get _showWeakDayedWeathers =>
      isSorted ? _weathersSorted : _weathers;

  /// return sorted or not sorted [_weathers] according to [isSorted]
  List<Weather> get _showWeathers =>
      _showWeakDayedWeathers.map((e) => e.weather).toList();

  /// return sorted or not sorted weakdays according to [isSorted]
  List<String> get showWeakDays =>
      _showWeakDayedWeathers.map((e) => intToEnglishMapper(e.weekday)).toList();

  /// return sorted or not sorted [min, max, average temp] according to [isSorted]
  List<List<int>> get showAllTemp {
    final List<List<int>> result = [];
    for (final weather in _showWeathers) {
      result.add([weather.tempMin, weather.tempMax, weather.temp]);
    }
    return result;
  }

  ListWeatherState({
    required this.status,
    required List<WeekDayedWeather> weathers,
    this.isSorted = true,
  }) {
    _weathers.addAll(weathers);
    sortWeathersByCriteria();
  }

  /// Sort [_weathers] by [criteria](minTemp in weather)
  void sortWeathersByCriteria() {
    _weathersSorted.clear();
    _weathersSorted.addAll(_weathers);
    _weathersSorted.sort(
      (a, b) => a.weather.tempMin.compareTo(b.weather.tempMin),
    );
  }

  ListWeatherState copyWith({
    ListWeatherStatus? status,
    List<WeekDayedWeather>? weathers,
    bool? isSorted,
  }) =>
      ListWeatherState(
        status: status ?? this.status,
        weathers: weathers ?? _weathers,
        isSorted: isSorted ?? this.isSorted,
      );

  @override
  List<Object?> get props => [_weathers, _weathersSorted, status, isSorted];
}

class ListWeatherInitial extends ListWeatherState {
  ListWeatherInitial({required super.status, required super.weathers});
}

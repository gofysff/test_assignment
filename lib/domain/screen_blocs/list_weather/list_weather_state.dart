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
  final List<WeekDayedWeather> weathers = [];

  /// Sorted [weathers] by criteria what we select
  /// Now it is [minTemp]
  final List<WeekDayedWeather> weathersSorted = [];

  final bool isSorted;

  /// return sorted or not sorted [WeekDayedWeather] according to [isSorted]
  List<WeekDayedWeather> get showWeakDayedWeathers =>
      isSorted ? weathersSorted : weathers;

  /// return sorted or not sorted weakdays according to [isSorted]
  List<String> get showWeakDays =>
      showWeakDayedWeathers.map((e) => intToEnglishMapper(e.weekday)).toList();

  /// return sorted or not sorted [weathers] according to [isSorted]
  List<Weather> get showWeathers =>
      showWeakDayedWeathers.map((e) => e.weather).toList();

  ListWeatherState({
    required this.status,
    required List<WeekDayedWeather> weathers,
    this.isSorted = true,
  }) {
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

  ListWeatherState copyWith({
    ListWeatherStatus? status,
    List<WeekDayedWeather>? weathers,
    bool? isSorted,
  }) {
    return ListWeatherState(
      status: status ?? this.status,
      weathers: weathers ?? this.weathers,
      isSorted: isSorted ?? this.isSorted,
    );
  }

  @override
  List<Object?> get props => [weathers, weathersSorted];
}

class ListWeatherInitial extends ListWeatherState {
  ListWeatherInitial({required super.status, required super.weathers});
}

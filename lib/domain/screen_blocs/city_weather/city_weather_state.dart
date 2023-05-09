// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'city_weather_bloc.dart';

enum CityWeatherStatus { initial, error, loading, success }

extension CityStatusBoolX on CityWeatherStatus {
  bool get isInitial => this == CityWeatherStatus.initial;
  bool get isError => this == CityWeatherStatus.error;
  bool get isLoading => this == CityWeatherStatus.loading;
  bool get isSuccess => this == CityWeatherStatus.success;
}

class CityWeatherState extends Equatable {
  const CityWeatherState({
    this.city = '',
    this.status = CityWeatherStatus.initial,
    this.weather,
  });

  final String city;
  final CityWeatherStatus status;
  final Weather? weather;

  @override
  List<Object?> get props => [city, status];

  CityWeatherState copyWith({
    String? city,
    CityWeatherStatus? status,
    Weather? weather,
  }) {
    return CityWeatherState(
      city: city ?? this.city,
      status: status ?? this.status,
      weather: weather,
    );
  }
}

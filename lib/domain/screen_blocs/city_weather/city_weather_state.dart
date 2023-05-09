// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'city_weather_bloc.dart';

enum CityStatus { initial, error, loading, success }

extension CityStatusBoolX on CityStatus {
  bool get isInitial => this == CityStatus.initial;
  bool get isError => this == CityStatus.error;
  bool get isLoading => this == CityStatus.loading;
  bool get isSuccess => this == CityStatus.success;
}

class CityWeatherState extends Equatable {
  const CityWeatherState({
    this.city = '',
    this.status = CityStatus.initial,
    this.weather,
  });

  final String city;
  final CityStatus status;
  final Weather? weather;

  @override
  List<Object?> get props => [city, status];

  CityWeatherState copyWith({
    String? city,
    CityStatus? status,
    Weather? weather,
  }) {
    return CityWeatherState(
      city: city ?? this.city,
      status: status ?? this.status,
      weather: weather,
    );
  }
}

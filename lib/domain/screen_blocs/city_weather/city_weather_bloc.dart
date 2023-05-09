import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_assignment/domain/model/weather.dart';
import 'package:test_assignment/domain/repository/weather_repository.dart';

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {
  final WeatherRepository _weatherRepository;

  CityWeatherBloc(this._weatherRepository) : super(const CityWeatherState()) {
    on<CityWeatherEvent>(
      (event, emit) {
        if (event is CityWeatherEventInitial) {
          _onInitialEvent(emit);
        } else if (event is CityWeatherEventChange) {
          _onCityEventChange(emit, event);
        }
        // tODO: decide if we need this
        else if (event is CityWeatherEventSuccess) {
          _onSuccessEvent(emit, event);
        }
      },
    );
  }

  void _onSuccessEvent(
      Emitter<CityWeatherState> emit, CityWeatherEventSuccess event) {
    // tODO: decide if we need this

    emit(
      state.copyWith(
          city: event.city, status: CityStatus.success, weather: event.weather),
    );
  }

  void _onInitialEvent(Emitter<CityWeatherState> emit) {
    emit(
      state.copyWith(city: '', status: CityStatus.initial, weather: null),
    );
  }

  void _onCityEventChange(
      Emitter<CityWeatherState> emit, CityWeatherEventChange event) {
    emit(
      state.copyWith(city: event.city, status: CityStatus.loading),
    );

    _weatherRepository
        .getWeatherByCityName(event.city)
        .then(
          (value) => emit(
            state.copyWith(
                city: event.city, status: CityStatus.success, weather: value),
          ),
        )
        .catchError(
          (e) => emit(
            state.copyWith(city: event.city, status: CityStatus.error),
          ),
        );
  }
}

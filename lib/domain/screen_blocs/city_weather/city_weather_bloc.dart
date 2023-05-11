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
    on<CityWeatherEvent>((event, emit) async {
      if (event is CityWeatherChanged) {
        await _onCityEventChange(emit, event);
      }
      if (event is CityWeatherInitialised) {
        _onInitialEvent(emit);
      }
    });
  }

  void _onInitialEvent(Emitter<CityWeatherState> emit) {
    emit(
      state.copyWith(
          cityName: '', status: CityWeatherStatus.initial, weather: null),
    );
  }

  Future<void> _onCityEventChange(
      Emitter<CityWeatherState> emit, CityWeatherChanged event) async {
    emit(
      state.copyWith(cityName: event.city, status: CityWeatherStatus.loading),
    );

    try {
      Weather weather =
          await _weatherRepository.getWeatherByCityName(event.city);
      emit(
        state.copyWith(
            cityName: event.city,
            status: CityWeatherStatus.success,
            weather: weather),
      );
    } catch (e) {
      print('we catch error');
      print(e);
      emit(
        state.copyWith(cityName: event.city, status: CityWeatherStatus.error),
      );
    }
  }
}

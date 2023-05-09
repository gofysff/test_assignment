import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_assignment/domain/model/dated_weather.dart';
import 'package:test_assignment/domain/model/weather.dart';
import 'package:test_assignment/domain/repository/weather_repository.dart';

part 'list_weather_event.dart';
part 'list_weather_state.dart';

class ListWeatherBloc extends Bloc<ListWeatherEvent, ListWeatherState> {
  final WeatherRepository _weatherRepository;

  ListWeatherBloc(this._weatherRepository)
      : super(ListWeatherInitial(
            weathers: const [], status: ListWeatherStatus.initial)) {
    on<ListWeatherEvent>(
      (event, emit) async {
        if (event is ListWeatherInitialEvent) {
          emit(
            ListWeatherInitial(
                weathers: const [], status: ListWeatherStatus.initial),
          );
        } else if (event is ListWeatherSuccessEvent) {
          await _onSuccessEvent(emit, event);
        }
      },
    );
  }

  Future<void> _onSuccessEvent(
      Emitter<ListWeatherState> emit, ListWeatherSuccessEvent event) async {
    emit(state.copyWith(status: ListWeatherStatus.loading));
    try {
      List<Weather> weathers =
          await _weatherRepository.getWeatherByCityNameFor3Days(event.city);
      emit(
        ListWeatherState(status: ListWeatherStatus.success, weathers: [
          WeekDayedWeather.today(weathers[0]),
          WeekDayedWeather.tomorrow(weathers[1]),
          WeekDayedWeather.dayAfterTomorrow(weathers[2]),
        ]),
      );
    } catch (e) {
      print('we catch error');
      print(e);
      emit(
        state.copyWith(status: ListWeatherStatus.error),
      );
    }
  }
}

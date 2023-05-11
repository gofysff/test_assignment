import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_assignment/domain/model/dated_weather.dart';
import 'package:test_assignment/domain/model/weather.dart';
import 'package:test_assignment/domain/repository/weather_repository.dart';
import 'package:test_assignment/presentation/mappers/int_to_string_day.dart';

part 'list_weather_event.dart';
part 'list_weather_state.dart';

class ListWeatherBloc extends Bloc<ListWeatherEvent, ListWeatherState> {
  final WeatherRepository _weatherRepository;

  ListWeatherBloc(this._weatherRepository)
      : super(
          ListWeatherInitial(
              weathers: const [], status: ListWeatherStatus.initial),
        ) {
    on<ListWeatherEvent>(
      (event, emit) async {
        if (event is ListWeatherInitialEvent) {
          _onInitialEvent(emit);
        } else if (event is ListWeatherSuccessEvent) {
          await _onSuccessEvent(emit, event);
        } else if (event is ListWeatherChangeSortEvent) {
          _onChangeSortEvent(emit);
        }
      },
    );
  }

  void _onInitialEvent(Emitter<ListWeatherState> emit) {
    emit(
      ListWeatherInitial(weathers: const [], status: ListWeatherStatus.initial),
    );
  }

  Future<void> _onSuccessEvent(
      Emitter<ListWeatherState> emit, ListWeatherSuccessEvent event) async {
    emit(state.copyWith(status: ListWeatherStatus.loading));
    try {
      List<Weather> weathers =
          await _weatherRepository.getWeatherByCityNameFor3Days(event.city);
      emit(
        ListWeatherState(
          status: ListWeatherStatus.success,
          weathers: [
            WeekDayedWeather.today(weathers[0]),
            WeekDayedWeather.tomorrow(weathers[1]),
            WeekDayedWeather.dayAfterTomorrow(weathers[2]),
          ],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: ListWeatherStatus.error),
      );
    }
  }

  void _onChangeSortEvent(Emitter<ListWeatherState> emit) {
    emit(
      state.copyWith(
        isSorted: state.isSorted ? false : true,
      ),
    );
  }
}

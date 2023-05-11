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
        if (event is ListWeatherInitialised) {
          _onInitialised(emit);
        } else if (event is ListWeatherEndedWithSuccess) {
          await _onCompletedWithSuccess(emit, event);
        } else if (event is ListWeatherChangedSortingType) {
          _onChangedSortType(emit);
        }
      },
    );
  }

  void _onInitialised(Emitter<ListWeatherState> emit) {
    emit(
      ListWeatherInitial(weathers: const [], status: ListWeatherStatus.initial),
    );
  }

  Future<void> _onCompletedWithSuccess(
      Emitter<ListWeatherState> emit, ListWeatherEndedWithSuccess event) async {
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

  void _onChangedSortType(Emitter<ListWeatherState> emit) {
    emit(
      state.copyWith(
        isSorted: state.isSorted ? false : true,
      ),
    );
  }
}

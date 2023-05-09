import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_assignment/domain/model/dated_weather.dart';
import 'package:test_assignment/domain/model/weather.dart';

part 'list_weather_event.dart';
part 'list_weather_state.dart';

class ListWeatherBloc extends Bloc<ListWeatherEvent, ListWeatherState> {
  ListWeatherBloc() : super(ListWeatherInitial(weathers: const [])) {
    on<ListWeatherEvent>(
      (event, emit) {
        if (event is ListWeatherInitialEvent) {
          emit(
            ListWeatherInitial(weathers: const []),
          );
        } else if (event is ListWeatherSuccessEvent) {
          _onSuccessEvent(emit, event);
        }
      },
    );
  }

  void _onSuccessEvent(
      Emitter<ListWeatherState> emit, ListWeatherSuccessEvent event) {
    emit(
      ListWeatherState(weathers: [
        WeekDayedWeather.today(event.weathers[0]),
        WeekDayedWeather.tomorrow(event.weathers[1]),
        WeekDayedWeather.dayAfterTomorrow(event.weathers[2]),
      ]),
    );
  }
}

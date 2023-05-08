import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_weather_event.dart';
part 'list_weather_state.dart';

class ListWeatherBloc extends Bloc<ListWeatherEvent, ListWeatherState> {
  ListWeatherBloc() : super(ListWeatherInitial()) {
    on<ListWeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'weather.dart';

class WeekDayedWeather {
  final Weather weather;
  final int weekday;

  WeekDayedWeather(this.weather, this.weekday);

  WeekDayedWeather.today(this.weather) : weekday = DateTime.now().weekday;

  WeekDayedWeather.tomorrow(this.weather)
      : weekday = DateTime.now().add(const Duration(days: 1)).weekday;

  WeekDayedWeather.dayAfterTomorrow(this.weather)
      : weekday = DateTime.now().add(const Duration(days: 2)).weekday;
}

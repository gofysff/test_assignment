import 'package:test_assignment/domain/model/dated_weather.dart';

extension IntToStringDay on WeekDayedWeather {
  String get dayString => intToEnglishMapper(weekday);
}

/// in english
String intToEnglishMapper(int day) {
  switch (day) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return 'Unknown';
  }
}

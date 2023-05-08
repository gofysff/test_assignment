import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData applicationTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    cardColor: backgroundCardColor,
    scaffoldBackgroundColor: backgroundAppColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundAppBarColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: textAccentColor,
        fontSize: 50,
      ),
      titleMedium: TextStyle(
        color: textPrimaryColor,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        color: textMiddleColor,
        fontSize: 16,
      ),
    ),
    primaryTextTheme: const TextTheme(
      /// used in app bar
      titleLarge: TextStyle(
        color: textPrimaryColor,
        fontSize: 24,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
    ),
  );
}

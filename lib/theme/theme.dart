import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: _hslToColor([24, 9.8, 10]),
      secondary: _hslToColor([60, 4.8, 95.9]),
      background: _hslToColor([0, 0, 100]),
      surface: _hslToColor([0, 0, 100]),
      onBackground: _hslToColor([20, 14.3, 4.1]),
      onSurface: _hslToColor([20, 14.3, 4.1]),
    ),
    scaffoldBackgroundColor: _hslToColor([0, 0, 100]),
    dividerColor: _hslToColor([20, 5.9, 90]),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _hslToColor([20, 5.9, 90]),
    ),
    cardTheme: CardTheme(
      color: _hslToColor([0, 0, 100]),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _hslToColor([0, 0, 100]),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: _hslToColor([20, 14.3, 4.1])), // Text color for light mode
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: _hslToColor([60, 9.1, 97.8]),
      secondary: _hslToColor([12, 6.5, 15.1]),
      background: _hslToColor([20, 14.3, 4.1]),
      surface: _hslToColor([20, 14.3, 4.1]),
      onBackground: _hslToColor([20, 14.3, 4.1]),
      onSurface: _hslToColor([20, 14.3, 4.1]),
    ),
    scaffoldBackgroundColor: _hslToColor([20, 14.3, 4.1]),
    dividerColor: _hslToColor([12, 6.5, 15.1]),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _hslToColor([12, 6.5, 15.1]),
    ),
    cardTheme: CardTheme(
      color: _hslToColor([20, 14.3, 4.1]),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _hslToColor([20, 14.3, 4.1]),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // Text color for dark mode
    ),
  );

  static Color _hslToColor(List<double> hsl) {
    return HSLColor.fromAHSL(1, hsl[0], hsl[1] / 100, hsl[2] / 100).toColor();
  }
}

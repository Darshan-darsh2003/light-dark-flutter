import 'dart:async';
import 'package:flutter/material.dart';
import 'package:light_dark/theme/theme.dart';

enum ThemeEvent { toggle }

class ThemeBloc {
  late ThemeData _currentTheme;
  final _themeController = StreamController<ThemeData>.broadcast();

  ThemeBloc() {
    _currentTheme = CustomTheme.lightTheme; // Default theme
    _themeController.sink.add(_currentTheme);
  }

  Stream<ThemeData> get themeStream => _themeController.stream;

  void dispose() {
    _themeController.close();
  }

  void toggleTheme() {
    _currentTheme = _currentTheme == CustomTheme.lightTheme
        ? CustomTheme.darkTheme
        : CustomTheme.lightTheme;
    _themeController.sink.add(_currentTheme);
  }
}

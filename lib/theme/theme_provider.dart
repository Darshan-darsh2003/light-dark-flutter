import 'package:flutter/material.dart';
import 'package:light_dark/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = CustomTheme.lightTheme;

  ThemeData get getTheme => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == CustomTheme.lightTheme) {
      _themeData = CustomTheme.darkTheme;
    } else {
      _themeData = CustomTheme.lightTheme;
    }
    notifyListeners();
  }
}

import 'package:chatapp/themes/dark_mode.dart';
import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode; // Fixed typo

  set themeData(ThemeData themeData) { // Fixed setter name
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    themeData = (_themeData == lightMode) ? darkMode : lightMode;
  }
}

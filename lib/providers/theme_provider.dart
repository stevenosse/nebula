import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData appTheme;

  ThemeProvider() {
    this.appTheme = this.lightTheme;
  }

  final ThemeData lightTheme = ThemeData();

  setAppTheme(ThemeData theme) {
    this.appTheme = theme;
    notifyListeners();
  }
}

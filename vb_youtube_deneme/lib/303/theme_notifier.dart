import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get getTheme => isLightTheme ? ThemeData.light() : ThemeData.dark();
}

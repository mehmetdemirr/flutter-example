import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.blueGrey[500],
  canvasColor: Colors.white70,
  primaryColor: Colors.blueGrey,
  secondaryHeaderColor: Colors.black54,
  appBarTheme: const AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.blueGrey,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blueGrey[500],
  ),
  listTileTheme: const ListTileThemeData(
      tileColor: Colors.black12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)))),
  checkboxTheme: CheckboxThemeData(
    checkColor: const MaterialStatePropertyAll<Color>(Colors.white),
    fillColor: MaterialStatePropertyAll<Color>(Colors.blueGrey.shade800),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStatePropertyAll<Color>(Colors.blueGrey.shade100),
    trackColor: MaterialStatePropertyAll<Color>(Colors.blueGrey.shade800),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStatePropertyAll<Color>(Colors.black12),
    ),
  ),
);

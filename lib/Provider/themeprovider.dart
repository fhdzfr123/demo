

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class CustomTheme {
  static final ThemeData lightThemeData = ThemeData(
    buttonColor: Colors.white,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.white,textStyle: TextStyle(color: Colors.black)),
    ),
  );

  static final ThemeData darkThemeData = ThemeData(
    buttonColor: Colors.black,
    primaryColor: Colors.grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
      headline1: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    scaffoldBackgroundColor: Color(0xFF1A1716),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.black12,textStyle: TextStyle(color: Colors.orange)),
    ),
  );
}
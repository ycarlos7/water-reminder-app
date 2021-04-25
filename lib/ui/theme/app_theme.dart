import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    accentColor: Color(0xFF8762FF),
    indicatorColor: Color(0xFF382469),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    unselectedWidgetColor: Color(0xFFF0F7FF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xFF382469),
        fontWeight: FontWeight.w700,
        fontSize: 60.0,
      ),
      headline4: TextStyle(
        color: Color(0xFF382469),
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
      caption: TextStyle(
        color: Colors.grey[400],
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ),
  );
}

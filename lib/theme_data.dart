import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: const MaterialColor(
    0xFF121212,
    <int, Color>{
      50: Color(0xFF121212),
      100: Color(0xFF121212),
      200: Color(0xFF121212),
      300: Color(0xFF121212),
      400: Color(0xFF121212),
      500: Color(0xFF121212),
      600: Color(0xFF121212),
      700: Color(0xFF121212),
      800: Color(0xFF121212),
      900: Color(0xFF121212),
    },
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  dialogBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: const MaterialColor(
    0xFF121212,
    <int, Color>{
      50: Color(0xFF121212),
      100: Color(0xFF121212),
      200: Color(0xFF121212),
      300: Color(0xFF121212),
      400: Color(0xFF121212),
      500: Color(0xFF121212),
      600: Color(0xFF121212),
      700: Color(0xFF121212),
      800: Color(0xFF121212),
      900: Color(0xFF121212),
    },
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  dialogBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
  ),
);
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: const Color(0xFF3C3C3C),
  shadowColor: const Color(0xFF2A2A2A),
  scaffoldBackgroundColor: const Color(0xFF121212),
  dialogBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFFFAFAFA)
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xFFFAFAFA)
    )
  )
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  cardColor: const Color(0xFFF1F1F1),
  shadowColor: const Color(0xFFE8E8E8),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  dialogBackgroundColor: const Color(0xFFFAFAFA),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFAFAFA),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF121212)
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xFF121212)
    )
  )
);
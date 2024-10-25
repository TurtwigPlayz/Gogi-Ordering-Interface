import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redColor = Color(0xFFE53935);
const Color greenColor = Color.fromARGB(255, 30, 158, 37);
const Color blueColor = Color.fromARGB(255, 84, 104, 239);

final String? fontFamily = GoogleFonts.ubuntu().fontFamily;

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
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color(0xFFFAFAFA),
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFFFAFAFA),
      fontFamily: fontFamily,
    ),
  ),
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
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color(0xFF121212),
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFF121212),
      fontFamily: fontFamily,
    ),
  ),
);
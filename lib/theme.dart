import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.teal, // your accent color
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
      titleLarge: TextStyle(
          color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

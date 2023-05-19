import 'package:flutter/material.dart';

class RandomUserTheme {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontSize: 24.0, color: Colors.green),
      bodyMedium: TextStyle(fontSize: 20.0, color: Colors.green),
      bodySmall: TextStyle(fontSize: 16.0, color: Colors.green),
    ),
  );
}

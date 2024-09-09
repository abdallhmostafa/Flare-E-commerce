import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = const TextTheme().copyWith(
    headlineLarge: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    displaySmall: const TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(0, 0, 0, 0.5),
    ),
    labelMedium: const TextStyle(fontSize: 16.0, color: Colors.black),

    labelSmall: const TextStyle(
        fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.normal),
  );
  static TextTheme dartTextTheme = const TextTheme().copyWith(
    headlineLarge: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    displaySmall: const TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    labelSmall: const TextStyle(fontSize: 14.0, color: Colors.white),
    labelMedium: const TextStyle(fontSize: 16.0, color: Colors.white),
  );
}

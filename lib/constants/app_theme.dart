import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._privateConstructor();

  static final _lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 2, 163, 158),
  );

  static final _darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 0, 99, 95),
  );

  static final baseTheme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: _lightColorScheme.onPrimaryContainer,
      foregroundColor: _lightColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: _lightColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: _lightColorScheme.primaryContainer),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: _lightColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
  );

  static final darkTheme = baseTheme.copyWith(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: _darkColorScheme.onPrimaryContainer,
      foregroundColor: _darkColorScheme.primaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: _darkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: _darkColorScheme.primaryContainer),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: _darkColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
  );
}

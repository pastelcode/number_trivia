import 'package:flutter/material.dart';

/// An interface for application themes.
mixin ApplicationTheme {
  /// The primary color of the application.
  static Color get primaryColor => Colors.green;

  /// Whether application should use Material3 design system.
  static bool get useMaterial3 => true;

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        centerTitle: true,
      );

  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
      );

  static ColorScheme get _darkColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      );

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: useMaterial3,
        appBarTheme: _appBarTheme,
        colorScheme: _lightColorScheme,
      );

  /// The dark [ThemeData] to pass to a [MaterialApp].
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: useMaterial3,
        appBarTheme: _appBarTheme,
        colorScheme: _darkColorScheme,
      );
}

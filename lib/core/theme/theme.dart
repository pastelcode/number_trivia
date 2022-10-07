import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static ThemeData get _baseTheme => ThemeData(
        useMaterial3: useMaterial3,
        appBarTheme: _appBarTheme,
      );

  /// The text theme for application
  static TextTheme get textTheme => GoogleFonts.sourceSansProTextTheme(
        _baseTheme.textTheme,
      );

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme => _baseTheme.copyWith(
        colorScheme: _lightColorScheme,
        textTheme: textTheme,
      );

  /// The dark [ThemeData] to pass to a [MaterialApp].
  static ThemeData get darkTheme => _baseTheme.copyWith(
        colorScheme: _darkColorScheme,
        textTheme: textTheme,
      );
}

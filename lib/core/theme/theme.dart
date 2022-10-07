import 'package:flutter/material.dart';

/// An interface for application themes.
mixin ApplicationTheme {
  /// The primary color of the application.
  static Color get primaryColor => Colors.green;

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      );

  /// The dark [ThemeData] to pass to a [MaterialApp].
  static ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
      );
}

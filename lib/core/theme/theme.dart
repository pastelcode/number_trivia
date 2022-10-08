import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// An interface for application themes.
mixin ApplicationTheme {
  /// The primary color of the application.
  static Color get primaryColor => Colors.orange;

  static AppBarTheme get _appBarTheme => const AppBarTheme(
        centerTitle: true,
      );

  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
      );

  static ColorScheme get _darkColorScheme => ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
      );

  static ThemeData _getThemeBasedOnColorScheme({
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: colorScheme.surface,
      ),
    );
  }

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme {
    final theme = _getThemeBasedOnColorScheme(
      colorScheme: _lightColorScheme,
    );
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }

  /// The dark [ThemeData] to pass to a [MaterialApp].
  static ThemeData get darkTheme {
    final theme = _getThemeBasedOnColorScheme(
      colorScheme: _darkColorScheme,
    );
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}

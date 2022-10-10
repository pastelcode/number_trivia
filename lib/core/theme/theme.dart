import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// An interface for application themes.
mixin ApplicationTheme {
  /// The border radius for common elements in application.
  static double get borderRadius => 10;

  /// The primary color of the application.
  static Color get primaryColor => Colors.cyan;

  /// The height for global app bars.
  static double get appBarHeight => 75;

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
        ),
      );

  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: primaryColor,
        surfaceTint: Colors.transparent,
      );

  static ColorScheme get _darkColorScheme => ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
      );

  static ThemeData _getThemeBasedOnColorScheme({
    required ColorScheme colorScheme,
  }) {
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
    );

    return ThemeData(
      colorScheme: colorScheme.copyWith(
        surfaceTint: colorScheme.surface,
      ),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: appBarHeight,
        backgroundColor: colorScheme.surface,
      ),
      canvasColor: colorScheme.surfaceVariant,
      scaffoldBackgroundColor: colorScheme.surface,
      bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: colorScheme.surface,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              ApplicationTheme.borderRadius,
            ),
          ),
        ),
      ),
      inputDecorationTheme: _inputDecorationTheme,
      textButtonTheme: TextButtonThemeData(
        style: buttonStyle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle,
      ),
    );
  }

  /// The light [ThemeData] to pass to a [MaterialApp].
  static ThemeData get lightTheme {
    final theme = _getThemeBasedOnColorScheme(
      colorScheme: _lightColorScheme,
    );
    return theme.copyWith(
      textTheme: GoogleFonts.interTextTheme(
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
      textTheme: GoogleFonts.interTextTheme(
        theme.textTheme,
      ),
    );
  }
}

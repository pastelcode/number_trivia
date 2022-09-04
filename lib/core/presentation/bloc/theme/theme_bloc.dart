import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';

/// {@template theme_bloc}
/// Bloc to manage application theme mode state.
/// It does not use any custom state, it uses [ThemeMode] enum to decide
/// whether theme mode is set to [ThemeMode.system], [ThemeMode.dark] or
/// [ThemeMode.light].
/// {@endtemplate}
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  /// {@macro theme_bloc}
  ThemeBloc()
      : super(
          ThemeMode.system,
        ) {
    on<ChangeThemeEvent>(
      _changeTheme,
    );
    on<ResetThemeEvent>(
      _resetTheme,
    );
  }

  void _changeTheme(
    ChangeThemeEvent event,
    Emitter<ThemeMode> emit,
  ) {
    emit(
      event.themeMode,
    );
  }

  void _resetTheme(
    ResetThemeEvent event,
    Emitter<ThemeMode> emit,
  ) {
    emit(
      ThemeMode.system,
    );
  }
}

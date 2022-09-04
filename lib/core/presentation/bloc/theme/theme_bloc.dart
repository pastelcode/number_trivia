import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';

/// {@template theme_bloc}
/// Bloc to manage application theme mode state.
/// It does not use any custom state, it uses [ThemeMode] enum to decide
/// whether theme mode is set to [ThemeMode.system], [ThemeMode.dark] or
/// [ThemeMode.light].
/// {@endtemplate}
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeMode> {
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

  final _storageKey = 'themeMode';

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final themeMode = json[_storageKey] as ThemeMode?;
    return themeMode ?? ThemeMode.system;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    final json = {
      _storageKey: state,
    };
    return json;
  }
}

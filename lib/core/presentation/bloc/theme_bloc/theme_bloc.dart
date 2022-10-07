import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';

/// {@template theme_bloc}
/// A bloc to manage application theme mode.
///
/// It does not use any custom state, it uses [ThemeMode] enum to decide
/// whether theme mode is set to [ThemeMode.system], [ThemeMode.dark] or
/// [ThemeMode.light].
///
/// Events:
/// - [ChangeTheme]
/// {@endtemplate}
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeMode> {
  /// {@macro theme_bloc}
  ThemeBloc()
      : super(
          ThemeMode.system,
        ) {
    on<ChangeTheme>(
      _changeTheme,
    );
  }

  void _changeTheme(
    ChangeTheme event,
    Emitter<ThemeMode> emit,
  ) {
    emit(
      event.themeMode,
    );
  }

  /// Key to save last theme mode to local storage.
  final _storageKey = 'theme-mode';

  @override
  ThemeMode fromJson(
    Map<String, dynamic> json,
  ) {
    final themeMode = json[_storageKey] as String?;
    if (themeMode == 'light') {
      return ThemeMode.light;
    }
    if (themeMode == 'dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic> toJson(
    ThemeMode state,
  ) {
    final json = {
      _storageKey: state.name,
    };
    return json;
  }
}

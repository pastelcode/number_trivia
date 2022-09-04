part of 'theme_bloc.dart';

/// {@template theme_event}
/// Base event class for [ThemeBloc].
/// {@endtemplate}
abstract class ThemeEvent extends Equatable {
  /// {@macro theme_event}
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

/// {@template change_theme_event}
/// Event to change the theme mode to [themeMode].
/// {@endtemplate}
class ChangeThemeEvent extends ThemeEvent {
  /// {@macro change_theme_event}
  const ChangeThemeEvent({
    required this.themeMode,
  });

  /// The theme mode to change bloc state to.
  final ThemeMode themeMode;

  @override
  List<Object> get props => [
        themeMode,
      ];
}

/// {@template reset_theme}
/// Event that resets the theme state to [ThemeMode.system].
/// {@endtemplate}
class ResetThemeEvent extends ThemeEvent {
  /// {@macro reset_theme}
  const ResetThemeEvent();
}

part of 'theme_bloc.dart';

/// {@template theme_event}
/// A base event class for [ThemeBloc].
/// {@endtemplate}
abstract class ThemeEvent extends Equatable {
  /// {@macro theme_event}
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

/// {@template change_theme_event}
/// An event to change the theme mode to [themeMode].
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

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

/// {@template change_theme}
/// An event to change the theme mode to [themeMode] value.
/// {@endtemplate}
class ChangeTheme extends ThemeEvent {
  /// {@macro change_theme_event}
  const ChangeTheme({
    required this.themeMode,
  });

  /// The theme mode to change bloc state to.
  final ThemeMode themeMode;

  @override
  List<Object> get props => [
        themeMode,
      ];
}

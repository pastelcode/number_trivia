part of 'main.dart';

/// {@template ui_root}
/// The root entry for application UI.
/// {@endtemplate}
class _UiRoot extends StatelessWidget {
  /// {@macro ui_root}
  const _UiRoot();

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (
        BuildContext context,
        ThemeMode state,
      ) {
        return MaterialApp(
          theme: ApplicationTheme.lightTheme,
          darkTheme: ApplicationTheme.darkTheme,
          title: 'Number trivia',
          themeMode: state,
          home: const ScrollConfiguration(
            behavior: _ScrollBehaviorModified(),
            child: NumberTriviaPage(),
          ),
        );
      },
    );
  }
}

class _ScrollBehaviorModified extends ScrollBehavior {
  const _ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(
    _,
  ) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}

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
          title: 'Number trivia',
          themeMode: state,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SizedBox(),
        );
      },
    );
  }
}

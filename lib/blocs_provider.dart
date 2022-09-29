part of 'main.dart';

/// {@template blocs_provider}
/// The root entry for the application that creates all blocs to manage states.
/// {@endtemplate}
class _BlocsProvider extends StatelessWidget {
  /// {@macro blocs_provider}
  const _BlocsProvider();

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (
            BuildContext context,
          ) {
            return ThemeBloc();
          },
        ),
      ],
      child: const _UiRoot(),
    );
  }
}

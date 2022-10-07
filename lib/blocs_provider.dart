part of 'main.dart';

/// {@template blocs_provider}
/// The root entry for the application that creates all blocs to manage states.
/// {@endtemplate}
class _BlocsProvider extends StatelessWidget {
  /// {@macro blocs_provider}
  const _BlocsProvider({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (
            _,
          ) {
            return ThemeBloc();
          },
        ),
        BlocProvider(
          create: (
            _,
          ) {
            return NumberTriviaBloc(
              getNumberTrivia: getIt(),
              inputConverter: getIt(),
            );
          },
        ),
      ],
      child: child,
    );
  }
}

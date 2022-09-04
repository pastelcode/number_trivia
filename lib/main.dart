import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:number_trivia/core/presentation/bloc/theme/theme_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // <- Set up Hydrated Bloc
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // ->
  HydratedBlocOverrides.runZoned(
    () => runApp(const _NumberTriviaApp()),
    storage: storage,
  );
}

/// {@template number_trivia_app_state_provider}
/// Root entry class for application that creates all core blocs.
/// {@endtemplate}
class NumberTriviaApp extends StatelessWidget {
  /// {@macro number_trivia_app_state_provider}
  const NumberTriviaApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: const _NumberTriviaApp(),
    );
  }
}

/// {@template number_trivia_app}
/// Root entry class for application UI.
/// {@endtemplate}
class _NumberTriviaApp extends StatelessWidget {
  /// {@macro number_trivia_app}
  const _NumberTriviaApp();

  @override
  Widget build(BuildContext context) {
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

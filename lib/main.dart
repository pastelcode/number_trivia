import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:number_trivia/core/presentation/bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'blocs_provider.dart';
part 'ui_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // <- Set up Hydrated Bloc
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // Set up Hydrated Bloc ->

  HydratedBlocOverrides.runZoned(
    () {
      runApp(
        const _BlocsProvider(),
      );
    },
    storage: storage,
  );
}

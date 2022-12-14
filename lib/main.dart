import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:number_trivia/core/presentation/bloc/bloc.dart';
import 'package:number_trivia/core/theme/theme.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:number_trivia/features/number_trivia/presentation/pages/pages.dart';
import 'package:number_trivia/injection_container.dart';
import 'package:path_provider/path_provider.dart';

part 'blocs_provider.dart';
part 'ui_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  LicenseRegistry.addLicense(
    () async* {
      final license = await rootBundle.loadString(
        'assets/fonts/Inter/OFL.txt',
      );
      yield LicenseEntryWithLineBreaks(
        [
          'Inter',
        ],
        license,
      );
    },
  );

  await initInjectionContainer();

  await MobileAds.instance.initialize();

  // <- Set up Hydrated Bloc
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  // Set up Hydrated Bloc ->

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  HydratedBlocOverrides.runZoned(
    () {
      runApp(
        const _BlocsProvider(
          child: _UiRoot(),
        ),
      );
    },
    storage: storage,
  );
}

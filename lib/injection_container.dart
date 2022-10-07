import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:number_trivia/core/services/services.dart';
import 'package:number_trivia/core/utils/utils.dart';
import 'package:number_trivia/features/number_trivia/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The GetIt instance.
final getIt = GetIt.instance;

/// Inits all feature and core dependencies.
Future<void> initInjectionContainer() async {
  // |- Features
  initNumberTriviaInjectionContainer();
  // Features -|

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt
        // |- Core
        ..registerLazySingleton(
          () {
            return InputConverter();
          },
        )
        ..registerLazySingleton<NetworkInfo>(
          () {
            return NetworkInfoImpl(
              connectionChecker: getIt(),
            );
          },
        )
        // Core -|

        // |- Use cases
        // Use cases -|

        // |- Repositories
        // Repositories -|

        // |- Data sources
        // Data sources -|

        // |- External
        ..registerLazySingleton(
          () {
            return InternetConnectionChecker();
          },
        )
        ..registerLazySingleton(
          () {
            return http.Client();
          },
        )
        ..registerLazySingleton(
          () {
            return sharedPreferences;
          },
        )
      // External -|
      ;
}

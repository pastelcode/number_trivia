import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/repositories.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/repositories.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/use_cases.dart';
import 'package:number_trivia/injection_container.dart';

/// Inits the dependencies for number trivia feature.
void initNumberTriviaInjectionContainer() {
  getIt
        // |- Use cases
        ..registerLazySingleton(
          () {
            return GetNumberTrivia(
              repository: getIt(),
            );
          },
        )
        // Use cases -|

        // |- Repositories
        ..registerLazySingleton<NumberTriviaRepository>(
          () {
            return NumberTriviaRepositoryImpl(
              remoteDataSource: getIt(),
              localDataSource: getIt(),
              networkInfo: getIt(),
            );
          },
        )
        // Repositories -|

        // |- Data sources
        ..registerLazySingleton<NumberTriviaRemoteDataSource>(
          () {
            return NumberTriviaRemoteDataSourceImpl(
              httpClient: getIt(),
            );
          },
        )
        ..registerLazySingleton<NumberTriviaLocalDataSource>(
          () {
            return NumberTriviaLocalDataSourceImpl(
              sharedPreferences: getIt(),
            );
          },
        )
      // Data sources -|
      ;
}

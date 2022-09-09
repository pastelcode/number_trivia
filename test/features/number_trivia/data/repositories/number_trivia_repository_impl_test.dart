import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/platform/platform.dart';
import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/repositories.dart';

class MockNumberTriviaRemoteDataSource extends Mock
    with NumberTriviaRemoteDataSource {}

class MockNumberTriviaLocalDataSource extends Mock
    with NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock with NetworkInfo {}

void main() {
  late final NumberTriviaRepositoryImpl repository;
  late final MockNumberTriviaRemoteDataSource remoteDataSource;
  late final MockNumberTriviaLocalDataSource localDataSource;
  late final MockNetworkInfo networkInfo;

  setUp(
    () {
      remoteDataSource = MockNumberTriviaRemoteDataSource();
      localDataSource = MockNumberTriviaLocalDataSource();
      networkInfo = MockNetworkInfo();
      repository = NumberTriviaRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo,
      );
    },
  );
}

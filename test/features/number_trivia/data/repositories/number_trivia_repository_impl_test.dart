import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/services/services.dart';
import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/repositories.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

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

  group(
    'getNumberTrivia',
    () {
      // DATA FOR THE MOCKS AND ASSERTIONS
      // We'll use these three variables throughout all the tests
      const number = 1;
      const numberTriviaType = NumberTriviaType.trivia;
      final numberTriviaModel = NumberTriviaModel(
        text: 'test trivia',
        number: number,
      );
      final numberTrivia = numberTriviaModel.toEntity();

      test(
        'should check if the device is online',
        () async {
          // arrange
          when(
            () {
              return networkInfo.isConnected;
            },
          ).thenAnswer(
            (
              _,
            ) async {
              return true;
            },
          );
          when(
            () {
              return remoteDataSource.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );
            },
          ).thenAnswer(
            (
              _,
            ) async {
              return numberTriviaModel;
            },
          );

          // act
          await repository.getNumberTrivia(
            number: number,
            type: numberTriviaType,
          );

          // assert
          verify(
            () {
              return networkInfo.isConnected;
            },
          );
        },
      );

      group(
        'device is online',
        () {
          // This setUp applies only to the 'device is online' group
          setUp(
            () {
              when(
                () {
                  return networkInfo.isConnected;
                },
              ).thenAnswer(
                (
                  _,
                ) async {
                  return true;
                },
              );
              when(
                () {
                  return localDataSource.cacheNumberTrivia(
                    triviaToCache: numberTriviaModel,
                  );
                },
              ).thenAnswer(
                (
                  void result,
                ) async {
                  return result;
                },
              );
            },
          );

          test(
            'should return remote data when the call to remote data source is successful',
            () async {
              // arrange
              when(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: number,
                    type: numberTriviaType,
                  );
                },
              ).thenAnswer(
                (
                  _,
                ) async {
                  return numberTriviaModel;
                },
              );

              // act
              final result = await repository.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );

              // assert
              verify(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: number,
                    type: numberTriviaType,
                  );
                },
              );
              expect(
                result,
                equals(
                  Right<Failure, NumberTrivia>(
                    numberTrivia,
                  ),
                ),
              );
            },
          );

          test(
            'should cache the data locally when the call to remote data source is successful',
            () async {
              // arrange
              when(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: number,
                    type: numberTriviaType,
                  );
                },
              ).thenAnswer(
                (
                  _,
                ) async {
                  return numberTriviaModel;
                },
              );

              // act
              await repository.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );

              // assert
              verify(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: number,
                    type: numberTriviaType,
                  );
                },
              );
              verify(
                () {
                  return localDataSource.cacheNumberTrivia(
                    triviaToCache: numberTriviaModel,
                  );
                },
              );
            },
          );

          test(
            'should return server failure when the call to remote data source is unsuccessful',
            () async {
              // arrange
              when(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: any(
                      named: 'number',
                    ),
                    type: numberTriviaType,
                  );
                },
              ).thenThrow(
                const ServerException(
                  statusCode: 400,
                ),
              );

              // act
              final result = await repository.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );

              // assert
              verify(
                () {
                  return remoteDataSource.getNumberTrivia(
                    number: number,
                    type: numberTriviaType,
                  );
                },
              );
              verifyZeroInteractions(
                localDataSource,
              );
              expect(
                result,
                equals(
                  const Left<Failure, NumberTrivia>(
                    ServerFailure(
                      statusCode: 400,
                    ),
                  ),
                ),
              );
            },
          );
        },
      );

      group(
        'device is offline',
        () {
          setUp(
            () {
              when(
                () {
                  return networkInfo.isConnected;
                },
              ).thenAnswer(
                (
                  _,
                ) async {
                  return false;
                },
              );
            },
          );

          test(
            'should return last locally cached data when the cached data is present',
            () async {
              // arrange
              when(
                localDataSource.getLastNumberTrivia,
              ).thenAnswer(
                (
                  _,
                ) async {
                  return numberTriviaModel;
                },
              );

              // act
              final result = await repository.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );

              // assert
              verifyZeroInteractions(
                remoteDataSource,
              );
              verify(
                localDataSource.getLastNumberTrivia,
              );
              expect(
                result,
                equals(
                  Right<Failure, NumberTrivia>(
                    numberTrivia,
                  ),
                ),
              );
            },
          );

          test(
            'should return CacheFailure failure when there is no cached data present',
            () async {
              // arrange
              when(
                localDataSource.getLastNumberTrivia,
              ).thenThrow(
                const CacheException(),
              );

              // act
              final result = await repository.getNumberTrivia(
                number: number,
                type: numberTriviaType,
              );

              // assert
              verifyZeroInteractions(
                remoteDataSource,
              );
              verify(
                localDataSource.getLastNumberTrivia,
              );
              expect(
                result,
                equals(
                  const Left<Failure, NumberTrivia>(
                    CacheFailure(),
                  ),
                ),
              );
            },
          );
        },
      );
    },
  );
}

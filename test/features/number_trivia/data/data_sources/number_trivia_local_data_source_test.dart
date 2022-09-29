import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/data/data_sources/data_sources.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences sharedPreferences;
  late NumberTriviaLocalDataSourceImpl numberTriviaLocalDataSource;

  setUp(
    () {
      sharedPreferences = MockSharedPreferences();
      numberTriviaLocalDataSource = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: sharedPreferences,
      );
    },
  );

  group(
    'getLastNumberTrivia',
    () {
      final numberTriviaModel = NumberTriviaModel.fromJson(
        fixture(
          fileName: 'trivia.json',
        ),
      );

      const sharedPreferencesKey = 'CACHED_NUMBER_TRIVIA';

      test(
        'should return NumberTriviaModel from SharedPreferences when there is one in the cache',
        () async {
          // arrange
          when(
            () {
              return sharedPreferences.getString(
                any(),
              );
            },
          ).thenReturn(
            fixture(
              fileName: 'trivia.json',
            ),
          );

          // act
          final result =
              await numberTriviaLocalDataSource.getLastNumberTrivia();

          // assert
          verify(
            () {
              return sharedPreferences.getString(
                sharedPreferencesKey,
              );
            },
          );
          expect(
            result,
            equals(
              numberTriviaModel,
            ),
          );
        },
      );

      test(
        'should throw CacheException when there is not a previously cached number trivia model',
        () async {
          // arrange
          when(
            () {
              return sharedPreferences.getString(
                any(),
              );
            },
          ).thenReturn(
            null,
          );

          // act
          final call = numberTriviaLocalDataSource.getLastNumberTrivia;

          // assert
          expect(
            call,
            throwsA(
              isA<CacheException>(),
            ),
          );
        },
      );
    },
  );
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
                'CACHED_NUMBER_TRIVIA',
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
    },
  );
}

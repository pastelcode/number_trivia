import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final numberTriviaModel = NumberTriviaModel(
    text: 'Test text',
    number: 1,
  );

  test(
    'should be a model of NumberTrivia entity',
    () async {
      // assert
      expect(
        numberTriviaModel,
        isA<ModelOf<NumberTrivia>>(),
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when the JSON number is an integer',
        () async {
          // arrange
          final jsonMap = fixture(
            fileName: 'trivia.json',
          );

          // act
          final result = NumberTriviaModel.fromJson(
            jsonMap,
          );

          // assert
          expect(
            result,
            numberTriviaModel,
          );
        },
      );
      test(
        '''
should return a valid model when the JSON number is regarded as a double''',
        () async {
          // arrange
          final jsonMap = fixture(
            fileName: 'trivia_double.json',
          );

          // act
          final result = NumberTriviaModel.fromJson(
            jsonMap,
          );

          // assert
          expect(
            result,
            numberTriviaModel,
          );
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        'should return a JSON string containing the proper data',
        () {
          // act
          final result = numberTriviaModel.toJson();

          // assert
          const expectedJson = '{"text":"Test text","number":1}';
          expect(
            result,
            expectedJson,
          );
        },
      );
    },
  );
}

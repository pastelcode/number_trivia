import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/repositories.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/usecases.dart';

class MockNumberTriviaRepository extends Mock with NumberTriviaRepository {}

void main() {
  late final GetNumberTrivia usecase;
  late final MockNumberTriviaRepository mockRepository;

  setUp(
    () {
      mockRepository = MockNumberTriviaRepository();
      usecase = GetNumberTrivia(
        repository: mockRepository,
      );
    },
  );

  const testNumber = 1;
  const testNumberTriviaType = NumberTriviaType.trivia;
  const testNumberTrivia = NumberTrivia(
    text: 'test',
    number: 1,
  );

  test(
    'should get trivia for the number from the repository',
    () async {
      // arrange
      when(
        () => mockRepository.getNumberTrivia(
          number: 1,
          type: NumberTriviaType.trivia,
        ),
      ).thenAnswer(
        (_) async => const Right(
          testNumberTrivia,
        ),
      );

      // act
      final result = await usecase(
        params: const GetNumberTriviaParams(
          number: testNumber,
          type: testNumberTriviaType,
        ),
      );

      // assert
      expect(
        result,
        const Right<Failure, NumberTrivia>(
          testNumberTrivia,
        ),
      );
      verify(
        () => mockRepository.getNumberTrivia(
          number: testNumber,
          type: testNumberTriviaType,
        ),
      );
      verifyNoMoreInteractions(
        mockRepository,
      );
    },
  );
}

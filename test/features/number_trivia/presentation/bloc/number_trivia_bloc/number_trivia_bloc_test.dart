import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/utils/utils.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/use_cases.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';

class MockGetNumberTrivia extends Mock implements GetNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late NumberTriviaBloc numberTriviaBloc;
  late MockGetNumberTrivia getNumberTrivia;
  late MockInputConverter inputConverter;

  setUp(
    () {
      getNumberTrivia = MockGetNumberTrivia();
      inputConverter = MockInputConverter();
      numberTriviaBloc = NumberTriviaBloc(
        getNumberTrivia: getNumberTrivia,
        inputConverter: inputConverter,
      );
    },
  );

  test(
    'bloc initial state should be Empty',
    () {
      // assert
      expect(
        numberTriviaBloc.state,
        equals(
          const Empty(),
        ),
      );
    },
  );

  group(
    'GetTrivia',
    () {
      const numberString = '1';
      const number = 1;
      const triviaType = NumberTriviaType.trivia;
      const numberTrivia = NumberTrivia(
        text: 'test trivia',
        number: number,
      );

      test(
        'should call the input converter to validate and convert the string to an unsigned integer',
        () async {
          // arrange
          when(
            () {
              return inputConverter.stringToUnsignedInteger(
                stringNumber: any(
                  named: 'stringNumber',
                ),
              );
            },
          ).thenReturn(
            const Right(
              number,
            ),
          );

          // act
          numberTriviaBloc.add(
            const GetTrivia(
              numberString: numberString,
              type: triviaType,
            ),
          );
          await untilCalled(
            () {
              return inputConverter.stringToUnsignedInteger(
                stringNumber: numberString,
              );
            },
          );

          // assert
          verify(
            () {
              return inputConverter.stringToUnsignedInteger(
                stringNumber: numberString,
              );
            },
          );
        },
      );

      test(
        'should emit [Failed] when the input is invalid',
        () async {
          // arrange
          when(
            () {
              return inputConverter.stringToUnsignedInteger(
                stringNumber: any(
                  named: 'stringNumber',
                ),
              );
            },
          ).thenReturn(
            const Left(
              InvalidInputFailure(
                message: InputConverter.stringToUnsignedIntegerError,
              ),
            ),
          );

          // act
          numberTriviaBloc.add(
            const GetTrivia(
              numberString: numberString,
              type: triviaType,
            ),
          );

          // assert
          final expected = [
            const Failed(
              failure: InvalidInputFailure(
                message: InputConverter.stringToUnsignedIntegerError,
              ),
            ),
          ];
          await expectLater(
            numberTriviaBloc.stream.asBroadcastStream(),
            emitsInOrder(
              expected,
            ),
          );
        },
      );
    },
  );
}

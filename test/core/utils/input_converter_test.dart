import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/utils/utils.dart';

void main() {
  late InputConverter inputConverter;

  setUp(
    () {
      inputConverter = InputConverter();
    },
  );

  group(
    'stringToUnsignedInteger',
    () {
      test(
        'should return an integer when the string represents an unsigned integer',
        () async {
          // arrange
          const string = '123';

          // act
          final result = inputConverter.stringToUnsignedInteger(
            stringNumber: string,
          );

          // assert
          expect(
            result,
            equals(
              const Right<Failure, int>(
                123,
              ),
            ),
          );
        },
      );

      test(
        'should return a failure when the string is not an integer',
        () async {
          // arrange
          const string = 'hello';

          // act
          final result = inputConverter.stringToUnsignedInteger(
            stringNumber: string,
          );

          // assert
          expect(
            result,
            const Left<Failure, int>(
              InvalidInputFailure(
                message: InputConverter.stringToUnsignedIntegerError,
              ),
            ),
          );
        },
      );

      test(
        'should return a failure when the string represents a negative integer',
        () async {
          // arrange
          const string = '-123';

          // act
          final result = inputConverter.stringToUnsignedInteger(
            stringNumber: string,
          );

          // assert
          expect(
            result,
            const Left<Failure, int>(
              InvalidInputFailure(
                message: InputConverter.stringToUnsignedIntegerError,
              ),
            ),
          );
        },
      );
    },
  );
}

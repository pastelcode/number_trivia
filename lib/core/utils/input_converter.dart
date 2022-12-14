import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/errors.dart';

/// An input converter.
class InputConverter {
  /// The error message for the failure that is returned from
  /// [stringToUnsignedInteger].
  static const stringToUnsignedIntegerError =
      'The number must be a positive integer or zero';

  /// Converts [stringNumber] representing an unsigned integer to its own
  /// integer type.
  ///
  /// Returns a [InvalidInputFailure] if [stringNumber] does not represent a
  /// valid unsigned integer.
  Either<Failure, int> stringToUnsignedInteger({
    required String stringNumber,
  }) {
    final result = int.tryParse(
      stringNumber,
    );
    if (result == null || result < 0) {
      return const Left(
        InvalidInputFailure(
          message: stringToUnsignedIntegerError,
        ),
      );
    }
    return Right(
      result,
    );
  }
}

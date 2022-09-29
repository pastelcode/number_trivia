import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

/// {@template number_trivia_repository}
/// An interface for number trivia repository.
/// {@endtemplate}
mixin NumberTriviaRepository {
  /// Gets a fact about [number].
  Future<Either<Failure, NumberTrivia>> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  });
}

part of 'repositories.dart';

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

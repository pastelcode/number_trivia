part of 'datasources.dart';

/// {@template number_trivia_remote_data_source}
/// An interface for remote number trivia repository.
/// {@endtemplate}
mixin NumberTriviaRemoteDataSource {
  /// Gets a model of [NumberTrivia].
  Future<NumberTriviaModel> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  });
}

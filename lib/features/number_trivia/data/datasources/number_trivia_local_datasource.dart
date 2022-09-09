part of 'datasources.dart';

/// {@template number_trivia_local_data_source}
/// An interface for number trivia local data source.
/// {@endtemplate}
mixin NumberTriviaLocalDataSource {
  /// Gets the last [NumberTriviaModel] that was saved to local cache.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Saves a [NumberTriviaModel] to local cache.
  Future<void> cacheNumberTrivia({
    required NumberTriviaModel triviaToCache,
  });
}

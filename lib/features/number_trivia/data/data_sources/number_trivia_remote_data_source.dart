import 'package:number_trivia/features/number_trivia/data/models/models.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

/// {@template number_trivia_remote_data_source}
/// An interface for remote number trivia repository.
/// {@endtemplate}
mixin NumberTriviaRemoteDataSource {
  /// Gets a model of [NumberTrivia].
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  });
}

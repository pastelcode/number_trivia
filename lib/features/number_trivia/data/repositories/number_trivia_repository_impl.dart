part of 'repositories.dart';

/// {@template number_trivia_repository_impl}
/// An implementation of [NumberTriviaRepository].
/// {@endtemplate}
class NumberTriviaRepositoryImpl extends Equatable with NumberTriviaRepository {
  /// {@macro number_trivia_repository_impl}
  const NumberTriviaRepositoryImpl();

  @override
  Future<Either<Failure, NumberTrivia>> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  }) {
    // TODO: implement getNumberTrivia
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

part of 'repositories.dart';

/// {@template number_trivia_repository_impl}
/// An implementation of [NumberTriviaRepository].
/// {@endtemplate}
class NumberTriviaRepositoryImpl extends Equatable with NumberTriviaRepository {
  /// {@macro number_trivia_repository_impl}
  const NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// The remote data source to fetch information.
  final NumberTriviaRemoteDataSource remoteDataSource;

  /// The local data source to fetch and to save information.
  final NumberTriviaLocalDataSource localDataSource;

  /// The device network information.
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getNumberTrivia({
    required int number,
    required NumberTriviaType type,
  }) {
    // TODO(pastelcode): implement getNumberTrivia
    throw UnimplementedError();
  }

  @override
  // TODO(pastelcode): implement props
  List<Object?> get props => throw UnimplementedError();
}

part of 'usecases.dart';

/// {@template get_number_trivia}
/// Use case to get a [NumberTrivia] from its corresponding repository.
/// {@endtemplate}
class GetNumberTrivia with Usecase<NumberTrivia, GetNumberTriviaParams> {
  /// {@macro get_number_trivia}
  const GetNumberTrivia({
    required this.repository,
  });

  /// Repository to fetch data from.
  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call({
    required GetNumberTriviaParams params,
  }) {
    return repository.getNumberTrivia(
      number: params.number,
      type: params.type,
    );
  }
}

/// {@template get_number_trivia_params}
/// Data holder class for [GetNumberTrivia] use case parameters.
/// {@endtemplate}
class GetNumberTriviaParams extends Equatable {
  /// {@macro get_number_trivia_params}
  const GetNumberTriviaParams({
    required this.number,
    required this.type,
  });

  /// {@macro number_trivia__number}
  final int number;

  /// {@macro number_trivia__type}
  final NumberTriviaType type;

  @override
  List<Object?> get props => [
        number,
      ];
}

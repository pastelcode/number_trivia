import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/domain/use_cases/use_cases.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/repositories.dart';

/// {@template get_number_trivia}
/// Gets a [NumberTrivia].
/// {@endtemplate}
class GetNumberTrivia with UseCase<NumberTrivia, GetNumberTriviaParams> {
  /// {@macro get_number_trivia}
  const GetNumberTrivia({
    required this.repository,
  });

  /// The repository to fetch data from.
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
/// A data holder class for [GetNumberTrivia] use case parameters.
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

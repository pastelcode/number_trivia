import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/errors/errors.dart';

/// {@template usecase}
/// Interface that contains common methods for use cases.
/// {@endtemplate}
mixin Usecase<Entity, Params> {
  /// This function makes possible to use the usecase class as a callable class.
  /// Example:
  /// ```dart
  /// final MyUsecase myUsecase = MyUsecase();
  /// final result = myUsecase();
  /// ```
  Future<Either<Failure, Entity>> call({
    required Params params,
  });
}

/// {@template no_params}
/// A class to indicate a use case needs no params to be executed.
/// {@endtemplate}
class NoParams extends Equatable {
  /// {@macro no_params}
  const NoParams();

  @override
  List<Object?> get props => [];
}

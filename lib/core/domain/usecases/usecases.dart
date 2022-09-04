import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/errors.dart';

/// {@template usecase}
/// Interface that contains common methods for use cases.
/// {@endtemplate}
mixin Usecase<Entity> {
  /// This function makes possible to use the usecase class as a callable class.
  /// Example:
  /// ```dart
  /// final MyUsecase myUsecase = MyUsecase();
  /// final result = myUsecase();
  /// ```
  Future<Either<Failure, Entity>> call();
}

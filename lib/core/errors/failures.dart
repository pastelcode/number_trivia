import 'package:equatable/equatable.dart';

/// {@template failure}
/// Interface to represent a failure when fetching data from repositories.
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// {@macro failure}
  const Failure();

  @override
  List<Object?> get props => [];
}

/// {@template server_failure}
/// A server failure.
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro server_failure}
  const ServerFailure({
    required this.statusCode,
  });

  /// The status code of the failed request.
  final int statusCode;

  @override
  List<Object?> get props => [
        statusCode,
      ];
}

/// {@template cache_failure}
/// A cache failure.
/// {@endtemplate}
class CacheFailure extends Failure {
  /// {@macro cache_failure}
  const CacheFailure();
}

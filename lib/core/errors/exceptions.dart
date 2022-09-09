part of 'errors.dart';

/// {@template custom_exception}
/// A base class for custom exceptions.
/// {@endtemplate}
abstract class _CustomException extends Equatable implements Exception {
  /// {@macro custom_exception}
  const _CustomException({
    this.message,
  });

  /// The message of this exception.
  final String? message;

  @override
  String toString() {
    return '$this: [message: $message]';
  }

  @override
  List<Object?> get props {
    return [
      message,
    ];
  }
}

/// {@template server_exception}
/// A server exception.
/// {@endtemplate}
class ServerException extends _CustomException {
  /// {@macro server_exception}
  const ServerException({
    super.message,
    required this.statusCode,
  });

  /// The status code for the failed request.
  final int statusCode;

  @override
  String toString() {
    return '$this: [message: $message statusCode: $statusCode]';
  }

  @override
  List<Object?> get props {
    return [
      message,
      statusCode,
    ];
  }
}

/// {@template cache_exception}
/// A cache exception.
/// {@endtemplate}
class CacheException extends _CustomException {
  /// {@macro cache_exception}
  const CacheException({
    super.message,
  });
}

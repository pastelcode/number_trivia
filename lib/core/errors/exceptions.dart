import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/utils/utils.dart';

/// {@template custom_exception}
/// A base class for custom exceptions.
/// {@endtemplate}
abstract class _CustomException extends Equatable implements Exception {
  /// {@macro custom_exception}
  const _CustomException({
    required this.message,
  });

  /// The title for this exception.
  String get title => '$runtimeType';

  /// The title for this exception in a human readable format.
  String get titleAsHumanReadable => formatClassName(
        className: title,
      );

  /// The message of this exception.
  final String message;

  @override
  String toString() {
    return '$title: [${props.map<String>(
          (
            Map<String, dynamic> element,
          ) {
            final keyName = element.entries.toList()[0].key;
            final value = element.entries.toList()[0].value;
            return '$keyName: $value';
          },
        ).toList().join(
          ', ',
        )}]';
  }

  /// **Note**: for [toString] to work properly, [props] should be a list
  /// of map with the name of the prop as the key and its corresponding value.
  @override
  List<Map<String, dynamic>> get props => [];
}

/// {@template server_exception}
/// A server exception.
/// {@endtemplate}
class ServerException extends _CustomException {
  /// {@macro server_exception}
  const ServerException({
    required super.message,
    required this.statusCode,
  });

  /// The status code for the failed request.
  final int statusCode;

  @override
  List<Map<String, dynamic>> get props => [
        {
          'message': message,
        },
        {
          'status code': statusCode,
        },
      ];
}

/// {@template cache_exception}
/// A cache exception.
/// {@endtemplate}
class CacheException extends _CustomException {
  /// {@macro cache_exception}
  const CacheException({
    required super.message,
  });
}

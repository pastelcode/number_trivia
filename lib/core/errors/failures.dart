import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/utils/utils.dart';

/// {@template failure}
/// Interface to represent a failure when fetching data from repositories.
/// {@endtemplate}
abstract class Failure extends Equatable {
  /// {@macro failure}
  const Failure({
    required this.message,
  });

  /// The title for this failure.
  String get title => '$runtimeType';

  /// The title for this failure in a human readable format.
  String get titleAsHumanReadable => formatClassName(
        className: title,
      );

  /// The message for this failure.
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

/// {@template server_failure}
/// A server failure.
/// {@endtemplate}
class ServerFailure extends Failure {
  /// {@macro server_failure}
  const ServerFailure({
    required super.message,
    required this.statusCode,
  });

  /// The status code of the failed request.
  final int statusCode;

  @override
  List<Map<String, dynamic>> get props => [
        {
          'Status code': statusCode,
        },
      ];
}

/// {@template cache_failure}
/// A cache failure.
/// {@endtemplate}
class CacheFailure extends Failure {
  /// {@macro cache_failure}
  const CacheFailure({
    required super.message,
  });
}

/// {@template invalid_input_failure}
/// A failure to indicate a input string conversion went wrong.
/// {@endtemplate}
class InvalidInputFailure extends Failure {
  /// {@macro invalid_input_failure}
  const InvalidInputFailure({
    required super.message,
  });

  @override
  List<Map<String, dynamic>> get props => [
        {
          'message': message,
        },
      ];
}

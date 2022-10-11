import 'package:number_trivia/core/extensions/extensions.dart';

/// Useful extensions on [Object].
extension ObjectExtensions on Object {
  /// Formats a class name to a human readable string.
  ///
  /// {@tool snippet}
  ///
  /// Example:
  ///
  /// ```dart
  /// print(
  ///   formatClassName(
  ///     className: 'MyClass',
  ///   ),
  /// ); // My Class
  /// ```
  /// {@end-tool}
  String get getHumanReadableClassName => '$runtimeType'
          .split(
        '',
      )
          .fold<String>(
        '',
        (
          String previousValue,
          String element,
        ) {
          return '$previousValue${element.containsUppercase ? ' ' : ''}$element'
              .trim();
        },
      );
}

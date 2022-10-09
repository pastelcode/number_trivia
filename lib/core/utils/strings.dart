/// An extension to check for uppercase and lowercase letters on strings.
extension StringValidators on String {
  /// Checks if this string contains a uppercase letter.
  bool get containsUppercase => contains(RegExp('[A-Z]'));

  /// Checks if this string contains a lowercase letter.
  bool get containsLowercase => contains(RegExp('[a-z]'));
}

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
String formatClassName({
  required String className,
}) {
  return className
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

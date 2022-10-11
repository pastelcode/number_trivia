/// An extension to check for uppercase and lowercase letters on strings.
extension StringExtensions on String {
  /// Checks if this string contains a uppercase letter.
  bool get containsUppercase => contains(
        RegExp(
          '[A-Z]',
        ),
      );

  /// Checks if this string contains a lowercase letter.
  bool get containsLowercase => contains(
        RegExp(
          '[a-z]',
        ),
      );
}

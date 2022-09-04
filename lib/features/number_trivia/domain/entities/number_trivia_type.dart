part of 'entities.dart';

/// {@template number_trivia_type}
/// Available types for facts in [NumberTrivia].
/// {@endtemplate}
enum NumberTriviaType {
  /// Random fact type about [NumberTrivia.number].
  trivia,

  /// Math fact type about [NumberTrivia.number].
  math,

  /// Date fact type about [NumberTrivia.number].
  date,

  /// Year fact type about [NumberTrivia.number].
  year,
}

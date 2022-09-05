part of 'entities.dart';

/// {@template number_trivia}
/// Entity for number trivia.
/// {@endtemplate}
class NumberTrivia extends Equatable {
  /// {@macro number_trivia}
  const NumberTrivia({
    required this.text,
    required this.number,
    required this.type,
  });

  /// {@template number_trivia__text}
  /// Fact about [number].
  /// {@endtemplate}
  final String text;

  /// {@template number_trivia__number}
  /// Number to get a fact about.
  /// {@endtemplate}
  final int number;

  /// {@template number_trivia__type}
  /// The fact type for [number].
  /// {@endtemplate}
  final NumberTriviaType type;

  @override
  List<Object?> get props => [
        text,
        number,
        type,
      ];
}

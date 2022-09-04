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

  /// Fact about [number].
  final String text;

  /// Number to get a fact about.
  final int number;

  /// The fact type for [number].
  final NumberTriviaType type;

  @override
  List<Object?> get props => [
        text,
        number,
        type,
      ];
}

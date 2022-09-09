part of 'entities.dart';

/// {@template number_trivia}
/// An entity for number trivia.
/// {@endtemplate}
class NumberTrivia extends Equatable {
  /// {@macro number_trivia}
  const NumberTrivia({
    required this.text,
    required this.number,
  });

  /// {@template number_trivia__text}
  /// The fact about [number].
  /// {@endtemplate}
  final String text;

  /// {@template number_trivia__number}
  /// The number to get a fact about it.
  /// {@endtemplate}
  final int number;

  @override
  List<Object?> get props => [
        text,
        number,
      ];
}

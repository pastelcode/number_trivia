part of 'number_trivia_bloc.dart';

/// {@template number_trivia_event}
/// A base event class for [NumberTriviaBloc].
/// {@endtemplate}
abstract class NumberTriviaEvent extends Equatable {
  /// {@macro number_trivia_event}
  const NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

/// {@template get_trivia}
/// An event to get a trivia of type [type] and with number [numberString].
/// {@endtemplate}
class GetTrivia extends NumberTriviaEvent {
  /// {@macro get_trivia}
  const GetTrivia({
    required this.numberString,
    required this.type,
  });

  /// The number to get a trivia for.
  ///
  /// It is of type [String] because a text field value always is [String] and
  /// bloc it is in charge to cast that value to a valid [num] value, according
  /// to the S of SOLID principle.
  final String numberString;

  /// The type to get a trivia for [numberString].
  final NumberTriviaType type;

  @override
  List<Object> get props => [
        numberString,
        type,
      ];
}

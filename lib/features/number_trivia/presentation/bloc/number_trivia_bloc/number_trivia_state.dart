part of 'number_trivia_bloc.dart';

/// {@template number_trivia_state}
/// A base state class for [NumberTriviaBloc].
/// {@endtemplate}
abstract class NumberTriviaState extends Equatable {
  /// {@macro number_trivia_state}
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

/// {@template empty}
/// An empty state representing that a trivia has not yet been fetched.
/// {@endtemplate}
class Empty extends NumberTriviaState {
  /// {@macro empty}
  const Empty();
}

/// {@template loading}
/// A loading state representing that a trivia is being fetched.
/// {@endtemplate}
class Loading extends NumberTriviaState {
  /// {@macro loading}
  const Loading();
}

/// {@template loaded}
/// A loaded state representing that a trivia has been fetched as [trivia].
/// {@endtemplate}
class Loaded extends NumberTriviaState {
  /// {@macro loaded}
  const Loaded({
    required this.trivia,
  });

  /// The trivia that has been fetched.
  final NumberTrivia trivia;

  @override
  List<Object> get props => [
        trivia,
      ];
}

/// {@template not_found}
/// A state representing that a trivia was not found for a number.
/// {@endtemplate}
class NotFound extends NumberTriviaState {
  /// {@macro not_found}
  const NotFound({
    required this.failure,
  });

  /// The failure this state contains
  final Failure failure;
}

/// {@template failed}
/// A failed state representing that a failure has been returned from operations
/// like converting input, fetching a trivia or something else.
/// {@endtemplate}
class Failed extends NumberTriviaState {
  /// {@macro failed}
  const Failed({
    required this.failure,
  });

  /// The [Failure] this state contains.
  final Failure failure;

  @override
  List<Object> get props => [
        failure,
      ];
}

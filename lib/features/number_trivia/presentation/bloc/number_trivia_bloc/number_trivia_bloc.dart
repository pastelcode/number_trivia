import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

/// {@template number_trivia_bloc}
/// A bloc to manage fetching of [NumberTrivia].
///
/// Events:
/// - [GetTrivia]
///
/// States:
///
/// {@endtemplate}
class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  /// {@macro number_trivia_bloc}
  NumberTriviaBloc()
      : super(
          const Empty(),
        ) {
    on<GetTrivia>(
      _getTriviaHandler,
    );
  }

  Future<void> _getTriviaHandler(
    GetTrivia event,
    Emitter<NumberTriviaState> emit,
  ) async {}
}

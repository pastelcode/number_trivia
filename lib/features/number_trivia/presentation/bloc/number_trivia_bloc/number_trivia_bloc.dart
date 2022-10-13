import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/utils/input_converter.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/domain/use_cases/use_cases.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

/// {@template number_trivia_bloc}
/// A bloc to manage fetching of [NumberTrivia].
///
/// Events:
/// - [GetTrivia]
///
/// States:
/// - [Empty]
/// - [Loading]
/// - [Loaded]
/// - [NotFound]
/// - [Failed]
/// {@endtemplate}
class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  /// {@macro number_trivia_bloc}
  NumberTriviaBloc({
    required this.getNumberTrivia,
    required this.inputConverter,
  }) : super(
          const Empty(),
        ) {
    on<GetTrivia>(
      _getTriviaHandler,
    );
  }

  /// The use case to get a [NumberTrivia].
  final GetNumberTrivia getNumberTrivia;

  /// The input converter utility class.
  final InputConverter inputConverter;

  Future<void> _getTriviaHandler(
    GetTrivia event,
    Emitter<NumberTriviaState> emit,
  ) async {
    await inputConverter
        .stringToUnsignedInteger(
      stringNumber: event.numberString,
    )
        .fold(
      (
        Failure failure,
      ) {
        emit(
          Failed(
            failure: failure,
          ),
        );
      },
      (
        int number,
      ) async {
        emit(
          const Loading(),
        );
        final failureOrTrivia = await getNumberTrivia(
          params: GetNumberTriviaParams(
            number: number,
            type: event.type,
          ),
        );
        failureOrTrivia.fold(
          (
            Failure failure,
          ) {
            emit(
              failure is NotFoundFailure
                  ? NotFound(
                      failure: failure,
                    )
                  : Failed(
                      failure: failure,
                    ),
            );
          },
          (
            NumberTrivia numberTrivia,
          ) {
            emit(
              Loaded(
                trivia: numberTrivia,
              ),
            );
          },
        );
      },
    );
  }
}

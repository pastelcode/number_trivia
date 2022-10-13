part of '../../pages/number_trivia_page.dart';

class _TriviaDisplayer extends StatelessWidget {
  const _TriviaDisplayer();

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
      builder: (
        BuildContext context,
        NumberTriviaState state,
      ) {
        if (state is Empty) {
          return const _EmptyState();
        }
        if (state is Loading) {
          return const LoadingIndicator();
        }
        if (state is NotFound) {
          return const _NotFound();
        }
        if (state is Failed) {
          return FailureState(
            failure: state.failure,
          );
        }
        return _Content(
          trivia: (state as Loaded).trivia,
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.trivia,
  });

  final NumberTrivia trivia;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _Number(
          number: trivia.number,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          trivia.text,
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

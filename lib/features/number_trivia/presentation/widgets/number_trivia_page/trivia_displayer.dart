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
        if (state is Empty || state is Loading) {
          return const LoadingIndicator();
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

class _Number extends StatefulWidget {
  const _Number({
    required this.number,
  });

  final int number;

  @override
  State<_Number> createState() => __NumberState();
}

class __NumberState extends State<_Number> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );

    return RotationTransition(
      turns: _animation,
      child: Text(
        '${widget.number}',
        style: theme.textTheme.headline2!.copyWith(
          fontSize: 64,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

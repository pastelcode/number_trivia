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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Text(
            'Try searching a trivia!',
          ),
          SizedBox(
            height: 30,
          ),
          _ArrowDown(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class _ArrowDown extends StatefulWidget {
  const _ArrowDown();

  @override
  State<_ArrowDown> createState() => __ArrowDownState();
}

class __ArrowDownState extends State<_ArrowDown>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      seconds: 2,
    ),
    vsync: this,
  )..repeat(
      reverse: true,
    );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(
      0,
      1.5,
    ),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Icon(
        FlutterRemix.arrow_down_s_line,
      ),
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

class __NumberState extends State<_Number> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(
      seconds: 2,
    ),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

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

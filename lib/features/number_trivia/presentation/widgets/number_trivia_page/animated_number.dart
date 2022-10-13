part of '../../pages/number_trivia_page.dart';

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

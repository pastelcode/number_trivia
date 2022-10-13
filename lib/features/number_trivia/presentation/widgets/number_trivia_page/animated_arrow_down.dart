part of '../../pages/number_trivia_page.dart';

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

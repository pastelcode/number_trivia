part of '../../pages/number_trivia_page.dart';

class _NotFound extends StatelessWidget {
  const _NotFound();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Assets.animations.sad.lottie(
          height: 75,
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Could not found a trivia',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Try another number!',
        )
      ],
    );
  }
}

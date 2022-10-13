part of '../../pages/number_trivia_page.dart';

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

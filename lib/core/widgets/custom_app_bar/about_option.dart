part of 'custom_app_bar.dart';

class _AboutOption extends StatelessWidget {
  const _AboutOption();

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListTile(
      title: const Text('About'),
      onTap: () {
        _showAboutOption(
          context: context,
        );
      },
    );
  }

  Future<void> _showAboutOption({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text('About'),
      children: <Widget>[
        Assets.animations.ghost.lottie(
          height: 125,
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Hi!',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              const Text.rich(
                TextSpan(
                  text: 'Developed by ',
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Pastel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Assets.svg.pastelcode.svg(
                height: 75,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
          onPressed: () {},
          icon: const Icon(
            FlutterRemix.github_line,
          ),
          title: const Text(
            'Github',
          ),
        ),
        Button(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationIcon: const Icon(
                FlutterRemix.shuffle_line,
              ),
              applicationName: 'Number Trivia',
              applicationVersion: '1.0.0',
            );
          },
          icon: const Icon(
            FlutterRemix.information_line,
          ),
          title: const Text(
            'More info',
          ),
        ),
      ],
    );
  }
}

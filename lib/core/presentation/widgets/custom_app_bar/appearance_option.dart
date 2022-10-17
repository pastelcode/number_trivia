part of 'custom_app_bar.dart';

class _AppearanceOptions extends StatelessWidget {
  const _AppearanceOptions();

  @override
  Widget build(
    BuildContext context,
  ) {
    return ListTile(
      title: const Text('Appearance'),
      onTap: () {
        _showAppearanceOption(
          context: context,
        );
      },
    );
  }

  Future<void> _showAppearanceOption({
    required BuildContext context,
  }) async {
    await showCustomModalBottomSheet<void>(
      context: context,
      title: const Text('Appearance'),
      child: const _AppearanceOptionsContent(),
    );
  }
}

class _AppearanceOptionsContent extends StatelessWidget {
  const _AppearanceOptionsContent();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (
            BuildContext context,
            ThemeMode state,
          ) {
            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              children: <Widget>[
                _AppearanceOption(
                  themeMode: ThemeMode.light,
                  currentThemeMode: state,
                  name: 'Light',
                  icon: Assets.illustrations.sun.svg(),
                ),
                _AppearanceOption(
                  themeMode: ThemeMode.dark,
                  currentThemeMode: state,
                  name: 'Dark',
                  icon: Assets.illustrations.moon.svg(),
                ),
                _AppearanceOption(
                  themeMode: ThemeMode.system,
                  currentThemeMode: state,
                  name: 'System',
                  icon: Assets.illustrations.computer.svg(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

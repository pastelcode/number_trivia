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
}

Future<void> _showAppearanceOption({
  required BuildContext context,
}) async {
  await showCustomModalBottomSheet<void>(
    context: context,
    title: const Text('Appearance'),
    children: <Widget>[
      BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (
          BuildContext context,
          ThemeMode state,
        ) {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              _AppearanceOption(
                themeMode: ThemeMode.light,
                currentThemeMode: state,
                name: 'Light',
                icon: const Icon(
                  FlutterRemix.sun_line,
                ),
              ),
              _AppearanceOption(
                themeMode: ThemeMode.dark,
                currentThemeMode: state,
                name: 'Dark',
                icon: const Icon(
                  FlutterRemix.moon_line,
                ),
              ),
              _AppearanceOption(
                themeMode: ThemeMode.system,
                currentThemeMode: state,
                name: 'System',
                icon: const Icon(
                  FlutterRemix.computer_line,
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}

class _AppearanceOption extends StatelessWidget {
  const _AppearanceOption({
    super.key,
    required this.currentThemeMode,
    required this.icon,
    required this.name,
    required this.themeMode,
  });

  final ThemeMode currentThemeMode;
  final Widget icon;
  final String name;
  final ThemeMode themeMode;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final isSelected = currentThemeMode == themeMode;

    return GestureDetector(
      onTap: () {
        context.read<ThemeBloc>().add(
              ChangeTheme(
                themeMode: themeMode,
              ),
            );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? theme.primaryColor : Colors.transparent,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Text(name),
            ],
          ),
        ),
      ),
    );
  }
}

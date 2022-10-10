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
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
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
                icon: SvgPicture.asset(
                  'assets/svg/sun.svg',
                ),
              ),
              _AppearanceOption(
                themeMode: ThemeMode.dark,
                currentThemeMode: state,
                name: 'Dark',
                icon: SvgPicture.asset(
                  'assets/svg/moon.svg',
                ),
              ),
              _AppearanceOption(
                themeMode: ThemeMode.system,
                currentThemeMode: state,
                name: 'System',
                icon: SvgPicture.asset(
                  'assets/svg/computer.svg',
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

    return TextButton(
      onPressed: () {
        context.read<ThemeBloc>().add(
              ChangeTheme(
                themeMode: themeMode,
              ),
            );
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        side: BorderSide(
          width: 3,
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: icon,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

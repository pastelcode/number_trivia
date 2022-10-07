part of 'custom_app_bar.dart';

/// {@template application_menu}
/// An icon button that shows the application menu.
/// {@endtemplate}
class ApplicationMenu extends StatelessWidget {
  /// {@macro application_menu}
  const ApplicationMenu({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        FlutterRemix.menu_4_line,
      ),
    );
  }
}

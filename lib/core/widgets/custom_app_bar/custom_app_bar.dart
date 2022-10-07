import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

part 'application_menu.dart';

/// {@template custom_app_bar}
/// A custom application bar with essential actions.
/// {@endtemplate}
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro custom_app_bar}
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  /// The title for this app bar.
  final Widget title;

  /// The actions for this app bar.
  ///
  /// Application menu icon button is provided by default.
  final List<Widget>? actions;

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      leading: Navigator.canPop(
        context,
      )
          ? IconButton(
              onPressed: () {},
              icon: const Icon(
                FlutterRemix.arrow_left_s_line,
              ),
            )
          : null,
      title: title,
      actions: <Widget>[
        ...?actions,
        const ApplicationMenu(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );
}

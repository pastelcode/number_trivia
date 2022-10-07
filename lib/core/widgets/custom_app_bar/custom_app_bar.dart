import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:number_trivia/core/presentation/bloc/bloc.dart';
import 'package:number_trivia/core/widgets/widgets.dart';

part 'appearance_option.dart';
part 'application_menu_button.dart';

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
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(
      context,
    );

    return AppBar(
      leading: (parentRoute != null && parentRoute.canPop)
          ? const CustomBackButton()
          : null,
      title: title,
      actions: <Widget>[
        ...?actions,
        const ApplicationMenuButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );
}
import 'package:flutter/material.dart';

/// {@template button}
/// A custom button.
/// {@endtemplate}
class Button extends StatelessWidget {
  /// {@macro button}
  const Button({
    super.key,
    required this.onPressed,
    this.icon,
    required this.title,
    this.isPrimary = false,
    this.isHorizontal = false,
  });

  /// The callback when button is pressed.
  final void Function()? onPressed;

  /// The icon for this button.
  final Widget? icon;

  /// The title for this button.
  final Widget title;

  /// Whether background should be foreground color and vice versa.
  final bool isPrimary;

  /// Whether [icon] and [title] should be in a [Row] instead of [Column].
  final bool isHorizontal;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final children = <Widget>[
      if (icon != null) ...[
        icon!,
        SizedBox(
          height: isHorizontal ? 0 : 10,
          width: isHorizontal ? 10 : 0,
        ),
      ],
      title,
    ];

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            isPrimary ? theme.colorScheme.primary : theme.colorScheme.onSurface,
      ),
      child: isHorizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
    );
  }
}

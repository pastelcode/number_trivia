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
    this.isVertical = false,
    this.tooltip = '',
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
  final bool isVertical;

  /// The tooltip to show on long press.
  final String tooltip;

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
          height: isVertical ? 10 : 0,
          width: isVertical ? 0 : 10,
        ),
      ],
      title,
    ];

    const mainAxisAlignment = MainAxisAlignment.center;
    const mainAxisSize = MainAxisSize.min;

    return Tooltip(
      message: tooltip,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isPrimary ? theme.colorScheme.primary : null,
        ),
        child: isVertical
            ? Column(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                children: children,
              )
            : Row(
                mainAxisAlignment: mainAxisAlignment,
                mainAxisSize: mainAxisSize,
                children: children,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

/// {@template custom_back_button}
/// A custom back button.
/// {@endtemplate}
class CustomBackButton extends StatelessWidget {
  /// {@macro custom_back_button}
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(
        FlutterRemix.arrow_left_line,
        size: 20,
      ),
      onPressed: () {
        Navigator.maybePop(
          context,
        );
      },
    );
  }
}

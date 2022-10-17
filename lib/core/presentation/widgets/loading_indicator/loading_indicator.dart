import 'package:flutter/material.dart';
import 'package:number_trivia/gen/assets.gen.dart';

/// {@template loading_indicator}
/// A custom loading indicator that uses a Lottie animation.
/// {@endtemplate}
class LoadingIndicator extends StatelessWidget {
  /// {@macro loading_indicator}
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );

    final animation = theme.brightness == Brightness.light
        ? Assets.animations.loadingBlack
        : Assets.animations.loadingWhite;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: animation.lottie(),
          ),
        ],
      ),
    );
  }
}

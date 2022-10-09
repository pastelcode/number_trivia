import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    final animationMode =
        theme.brightness == Brightness.light ? 'black' : 'white';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Lottie.asset(
              'assets/animations/loading_$animationMode.json',
            ),
          ),
        ],
      ),
    );
  }
}

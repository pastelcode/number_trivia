import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:number_trivia/core/errors/errors.dart';
import 'package:number_trivia/core/theme/theme.dart';

/// {@template failure_state}
/// A widget that shows a failure.
/// {@endtemplate}
class FailureState extends StatelessWidget {
  /// {@macro failure_state}
  const FailureState({
    super.key,
    required this.failure,
  });

  /// The failure to show.
  final Failure failure;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );

    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: theme.errorColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(
            ApplicationTheme.borderRadius,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            FlutterRemix.error_warning_line,
            size: 48,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            failure.titleAsHumanReadable,
            style: theme.textTheme.headline6,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            failure.toString(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

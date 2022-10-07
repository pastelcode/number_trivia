import 'package:flutter/material.dart';

/// {@template number_trivia_page}
/// A page for the user to get a trivia about a number.
/// {@endtemplate}
class NumberTriviaPage extends StatelessWidget {
  /// {@macro number_trivia_page}
  const NumberTriviaPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Trivia'),
      ),
    );
  }
}

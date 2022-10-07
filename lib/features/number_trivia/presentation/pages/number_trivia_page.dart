import 'package:flutter/material.dart';
import 'package:number_trivia/core/widgets/widgets.dart';

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
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Number Trivia'),
      ),
    );
  }
}

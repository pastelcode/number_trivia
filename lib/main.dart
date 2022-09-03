import 'package:flutter/material.dart';

void main() {
  runApp(const NumberTriviaApp());
}

/// {@template number_trivia_app}
/// Root entry class for application.
/// {@endtemplate}
class NumberTriviaApp extends StatelessWidget {
  /// {@macro number_trivia_app}
  const NumberTriviaApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number trivia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SizedBox(),
    );
  }
}

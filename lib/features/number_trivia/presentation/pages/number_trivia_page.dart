import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:number_trivia/core/presentation/widgets/widgets.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/entities.dart';
import 'package:number_trivia/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:number_trivia/gen/assets.gen.dart';

part '../widgets/number_trivia_page/animated_arrow_down.dart';
part '../widgets/number_trivia_page/animated_number.dart';
part '../widgets/number_trivia_page/empty_state.dart';
part '../widgets/number_trivia_page/form.dart';
part '../widgets/number_trivia_page/not_found.dart';
part '../widgets/number_trivia_page/number_input.dart';
part '../widgets/number_trivia_page/trivia_displayer.dart';
part '../widgets/number_trivia_page/type_input.dart';

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
    final size = MediaQuery.of(
      context,
    ).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Number Trivia'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: size.height / 3,
              child: const _TriviaDisplayer(),
            ),
            const SizedBox(
              height: 20,
            ),
            const _NumberForm(),
            const SizedBox(
              height: 80,
            ),
            const MyBannerAd(),
          ],
        ),
      ),
    );
  }
}

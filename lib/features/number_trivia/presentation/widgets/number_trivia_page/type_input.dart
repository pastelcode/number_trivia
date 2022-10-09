part of '../../pages/number_trivia_page.dart';

class _TypeInput extends StatelessWidget {
  const _TypeInput({
    required this.onChanged,
  });

  final void Function(
    NumberTriviaType? value,
  )? onChanged;

  @override
  Widget build(
    BuildContext context,
  ) {
    return DropdownButtonFormField<NumberTriviaType>(
      icon: const Icon(
        FlutterRemix.arrow_drop_down_line,
      ),
      hint: const Text('Type'),
      elevation: 0,
      items: List.generate(
        NumberTriviaType.values.length,
        (
          int index,
        ) {
          final value = NumberTriviaType.values[index];
          final name = '${value.name.substring(
                0,
                1,
              ).toUpperCase()}${value.name.substring(
            1,
          )}';

          return DropdownMenuItem(
            value: value,
            child: Text(
              name,
            ),
          );
        },
      ),
      onChanged: onChanged,
    );
  }
}

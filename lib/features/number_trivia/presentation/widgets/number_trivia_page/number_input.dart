part of '../../pages/number_trivia_page.dart';

class _NumberInput extends StatelessWidget {
  const _NumberInput({
    required this.onChanged,
  });

  final void Function(
    String value,
  ) onChanged;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text('Number'),
        hintText: '5155',
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (
        String? value,
      ) {
        return int.tryParse(
                  value!,
                ) ==
                null
            ? 'Should be a valid number'
            : null;
      },
      onChanged: onChanged,
    );
  }
}

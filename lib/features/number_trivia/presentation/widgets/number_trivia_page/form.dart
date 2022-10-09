part of '../../pages/number_trivia_page.dart';

class _NumberForm extends StatefulWidget {
  const _NumberForm();

  @override
  State<_NumberForm> createState() => __NumberFormState();
}

class __NumberFormState extends State<_NumberForm> {
  final formKey = GlobalKey<FormState>();
  String number = '';
  NumberTriviaType type = NumberTriviaType.trivia;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _NumberInput(
                  onChanged: (
                    String value,
                  ) {
                    number = value;
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: _TypeInput(
                  onChanged: (
                    NumberTriviaType? value,
                  ) {
                    type = value!;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Button(
                  onPressed: () {
                    _getTrivia(
                      context: context,
                    );
                  },
                  icon: const Icon(
                    FlutterRemix.search_line,
                  ),
                  title: const Text('Search'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Button(
                  onPressed: () {},
                  icon: const Icon(
                    FlutterRemix.shuffle_line,
                  ),
                  title: const Text('Random'),
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getTrivia({
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      context.read<NumberTriviaBloc>().add(
            GetTrivia(
              numberString: number,
              type: type,
            ),
          );
    }
  }
}

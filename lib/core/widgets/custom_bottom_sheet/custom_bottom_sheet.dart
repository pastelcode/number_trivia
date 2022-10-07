import 'package:flutter/material.dart';
import 'package:number_trivia/core/widgets/widgets.dart';

/// Shows a custom modal bottom sheet.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  List<Widget>? children,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    builder: (
      BuildContext context,
    ) {
      return _CustomBottomSheet(
        title: title,
        children: children,
      );
    },
  );
}

class _CustomBottomSheet extends StatelessWidget {
  const _CustomBottomSheet({
    this.title,
    this.children,
  });

  final Widget? title;
  final List<Widget>? children;

  @override
  Widget build(
    BuildContext context,
  ) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.8,
      initialChildSize: 0.4,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              centerTitle: false,
              title: title,
              leading: const CustomBackButton(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ...?children,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:number_trivia/core/theme/theme.dart';

/// Shows a custom modal bottom sheet.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  List<Widget>? children,
  EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 20,
  ),
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
}) async {
  final width = MediaQuery.of(
    context,
  ).size.width;

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxWidth: width * 0.95,
    ),
    builder: (
      BuildContext context,
    ) {
      return _CustomBottomSheet(
        title: title,
        padding: padding,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      );
    },
  );
}

class _CustomBottomSheet extends StatelessWidget {
  const _CustomBottomSheet({
    this.title,
    this.children,
    required this.padding,
    required this.mainAxisAlignment,
  });

  final Widget? title;
  final List<Widget>? children;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;

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
              toolbarHeight: ApplicationTheme.appBarHeight,
              pinned: true,
              centerTitle: false,
              title: title != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          DefaultTextStyle.merge(
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            child: title!,
                          ),
                          const CloseButton(),
                        ],
                      ),
                    )
                  : null,
              automaticallyImplyLeading: false,
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Column(
                      mainAxisAlignment: mainAxisAlignment,
                      children: children ?? <Widget>[],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

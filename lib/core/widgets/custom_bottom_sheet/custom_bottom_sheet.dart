import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_trivia/core/theme/theme.dart';
import 'package:number_trivia/core/widgets/widgets.dart';

/// Shows a custom modal bottom sheet.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  List<Widget>? children,
  EdgeInsets padding = EdgeInsets.zero,
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
  });

  final Widget? title;
  final List<Widget>? children;
  final EdgeInsets padding;

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
                  ? DefaultTextStyle.merge(
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                      ),
                      child: title!,
                    )
                  : null,
              leading: const CustomBackButton(),
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    ...?children,
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

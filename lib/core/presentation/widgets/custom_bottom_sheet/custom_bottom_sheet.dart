import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_trivia/core/presentation/widgets/custom_back_button/custom_back_button.dart';
import 'package:number_trivia/core/theme/theme.dart';

/// Shows a custom modal bottom sheet.
///
/// Consider using a [StatelessWidget] that returns a [Column] to pass [child]
/// to take advantage of Flutter's Hot Reload.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  Widget? title,
  Widget? child,
  EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 20,
  ),
}) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  final result = await showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    builder: (
      BuildContext context,
    ) {
      return _CustomBottomSheet(
        title: title,
        padding: padding,
        child: child,
      );
    },
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  return result;
}

class _CustomBottomSheet extends StatelessWidget {
  const _CustomBottomSheet({
    this.title,
    this.child,
    required this.padding,
  });

  final Widget? title;
  final Widget? child;
  final EdgeInsets padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.8,
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
                  ? Row(
                      children: <Widget>[
                        const CustomBackButton(),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultTextStyle.merge(
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          child: title!,
                        ),
                      ],
                    )
                  : null,
              automaticallyImplyLeading: false,
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    if (child != null) ...[child!] else ...<Widget>[],
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

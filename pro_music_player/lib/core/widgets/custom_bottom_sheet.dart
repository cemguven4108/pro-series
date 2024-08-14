import 'package:flutter/material.dart';

void customBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      reverseCurve: Curves.linear,
      reverseDuration: const Duration(milliseconds: 500),
    ),
    scrollControlDisabledMaxHeightRatio: 1,
    builder: builder,
  );
}

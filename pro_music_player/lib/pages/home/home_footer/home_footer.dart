import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_sheet/home_footer_sheet.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_nav_bar/home_footer_navigation_bar.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_progress_bar.dart';

class HomeFooter extends ConsumerWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HomeFooterSheet(),
        HomeFooterProgressBar(),
        HomeFooterNavigationBar(),
      ],
    );
  }
}

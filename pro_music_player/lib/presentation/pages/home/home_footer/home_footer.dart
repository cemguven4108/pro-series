import 'package:flutter/material.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_carousel/home_footer_carousel.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_nav_bar/home_footer_navigation_bar.dart';
import 'package:pro_music_player/widgets/custom_progress_bar.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        HomeFooterCarousel(),
        CustomProgressBar(),
        HomeFooterNavigationBar(),
      ],
    );
  }
}

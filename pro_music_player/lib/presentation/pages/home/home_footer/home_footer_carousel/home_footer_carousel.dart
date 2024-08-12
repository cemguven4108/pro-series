import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_carousel/home_footer_carousel_controls.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_carousel/home_footer_carousel_slider/home_footer_carousel_slider.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';

class HomeFooterCarousel extends ConsumerWidget {
  const HomeFooterCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = ref.watch(audioPlayerNotifierProvider.select(
      (value) => value.audioSource != null,
    ));

    return AnimatedSize(
      duration: const Duration(seconds: 1),
      child: isInitialized
          ? Container(
              height: 50,
              color: const Color.fromARGB(255, 50, 50, 50),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HomeFooterCarouselSlider(),
                  HomeFooterCarouselControls()
                ],
              ),
            )
          : const SizedBox(
              width: double.infinity,
              height: double.minPositive,
            ),
    );
  }
}

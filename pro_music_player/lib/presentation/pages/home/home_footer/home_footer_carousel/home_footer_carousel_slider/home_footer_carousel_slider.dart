import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_carousel/home_footer_carousel_slider/home_footer_carousel_slider_body.dart';
import 'package:pro_music_player/presentation/pages/home/home_footer/home_footer_carousel/home_footer_carousel_slider/home_footer_carousel_slider_frame.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/providers/carousel_provider.dart/carousel_slider_provider.dart';
import 'package:pro_music_player/presentation/state/providers/songs_provider/songs_provider.dart';
import 'package:pro_music_player/widgets/custom_bottom_sheet.dart';

class HomeFooterCarouselSlider extends ConsumerWidget {
  const HomeFooterCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(carouselSliderNotifierProvider);
    final initialIndex = ref.read(audioPlayerNotifierProvider).currentIndex;
    final songs = ref.watch(songsNotifierProvider);

    void handlePageChanged(int index) {
      final currentIndex = ref.read(audioPlayerNotifierProvider).currentIndex;

      if (index > currentIndex!) {
        ref.read(audioPlayerNotifierProvider.notifier).next();
      } else if (index < currentIndex) {
        ref.read(audioPlayerNotifierProvider.notifier).previous();
      }
    }

    void handleOnTap() {
      final currentIndex = ref.read(audioPlayerNotifierProvider).currentIndex;

      showSongPageSheet(
        context: context,
        song: songs[currentIndex!],
      );
    }

    return Expanded(
      child: GestureDetector(
        onTap: handleOnTap,
        child: CarouselSlider.builder(
          carouselController: notifier,
          options: CarouselOptions(
            viewportFraction: 1,
            animateToClosest: true,
            initialPage: initialIndex ?? 0,
            onPageChanged: (index, reason) => handlePageChanged(index),
          ),
          itemCount: songs.length,
          itemBuilder: (_, index, pageViewIndex) {
            return Row(
              children: <Widget>[
                HomeFooterCarouselSliderFrame(
                  id: songs[index].id,
                ),
                Expanded(
                  child: HomeFooterCarouselSliderBody(
                    title: songs[index].title,
                    artist: songs[index].artist,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

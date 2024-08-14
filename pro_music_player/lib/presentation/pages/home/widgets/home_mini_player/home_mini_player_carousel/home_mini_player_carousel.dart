import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/core/widgets/custom_bottom_sheet.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_mini_player/home_mini_player_carousel/home_mini_player_carousel_body.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_mini_player/home_mini_player_carousel/home_mini_player_carousel_frame.dart';
import 'package:pro_music_player/presentation/pages/song/song_page.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/carousel_slider/carousel_slider_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/songs/songs_provider.dart';

class HomeMiniPlayerCarousel extends ConsumerWidget {
  const HomeMiniPlayerCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carousel = ref.watch(carouselSliderNotifierProvider);
    final songs = ref.watch(songsNotifierProvider);

    void handlePageChanged(int index) {
      final currentIndex = ref.read(audioPlayerProvider).currentIndex;

      if (index > currentIndex) {
        ref.read(audioPlayerProvider.notifier).next();
      } else if (index < currentIndex) {
        ref.read(audioPlayerProvider.notifier).previous();
      }
    }

    void handleOnTap() {
      customBottomSheet(
        context: context,
        builder: (_) => const SongPage(),
      );
    }

    return GestureDetector(
      onTap: handleOnTap,
      onVerticalDragUpdate: (details) {
        if (details.localPosition.dy < 0) {
          customBottomSheet(
            context: context,
            builder: (_) => const SongPage(),
          );
        }
      },
      child: CarouselSlider.builder(
        carouselController: carousel.carouselController,
        options: CarouselOptions(
          viewportFraction: 1,
          animateToClosest: true,
          initialPage: ref.read(audioPlayerProvider.select(
            (value) => value.currentIndex,
          )),
          onPageChanged: (index, reason) => handlePageChanged(index),
        ),
        itemCount: songs.length,
        itemBuilder: (_, index, pageViewIndex) {
          return Row(
            children: <Widget>[
              HomeMiniPlayerCarouselFrame(
                artwork: songs[index].artwork,
              ),
              Expanded(
                child: HomeMiniPlayerCarouselBody(
                  title: songs[index].title,
                  artist: songs[index].artist,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

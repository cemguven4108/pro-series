import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/core/widgets/frame_widget.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/carousel_slider/carousel_slider_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/songs/songs_provider.dart';

class SongCarousel extends ConsumerWidget {
  const SongCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carousel = ref.watch(carouselSliderNotifierProvider);
    final songs = ref.watch(songsNotifierProvider);

    return CarouselSlider.builder(
      carouselController: carousel.carouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        animateToClosest: true,
        aspectRatio: 1 / 1,
        initialPage: ref.read(audioPlayerProvider.select(
          (value) => value.currentIndex,
        )),
        onPageChanged: (index, reason) {
          final currentIndex = ref.read(audioPlayerProvider).currentIndex;

          if (index > currentIndex) {
            ref.read(audioPlayerProvider.notifier).next();
          } else if (index < currentIndex) {
            ref.read(audioPlayerProvider.notifier).previous();
          }
        },
      ),
      itemCount: songs.length,
      itemBuilder: (_, index, pageViewIndex) {
        return FrameWidget(
          borderRadius: BorderRadius.circular(15),
          artwork: songs[index].artwork,
        );
      },
    );
  }
}

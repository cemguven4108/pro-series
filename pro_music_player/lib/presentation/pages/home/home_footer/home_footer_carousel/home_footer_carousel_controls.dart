import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/providers/carousel_provider.dart/carousel_slider_provider.dart';

class HomeFooterCarouselControls extends ConsumerWidget {
  const HomeFooterCarouselControls({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerNotifierProvider.select(
      (value) => value.playing,
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () {
            final index = ref.read(audioPlayerNotifierProvider).currentIndex;
            ref.read(audioPlayerNotifierProvider.notifier).togglePlay(
                  index: index!,
                );
          },
          icon: Icon(
            isPlaying ? Icons.pause_outlined : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(carouselSliderNotifierProvider.notifier).nextPage();
            ref.read(audioPlayerNotifierProvider.notifier).next();
          },
          icon: const Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

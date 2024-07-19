import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';

class HomeFooterControls extends ConsumerWidget {
  const HomeFooterControls({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerProvider.select(
      (value) => value.isPlaying,
    ));

    print("HomeFooterControls Building");

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () {
            final index = ref.read(audioPlayerProvider).currentIndex;
            ref.read(audioPlayerProvider.notifier).togglePlay(
                  index: index,
                );
          },
          icon: Icon(
            isPlaying ? Icons.pause_outlined : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(audioPlayerProvider.notifier).next();
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';

class HomeFooterControls extends ConsumerWidget {
  const HomeFooterControls({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerProvider).isPlaying;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: () {
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/current_song/current_song_provider.dart';

class HomeTileButton extends ConsumerWidget {
  const HomeTileButton({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(currentSongProvider
        .select((value) => value.index == index && value.isPlaying));

    return IconButton(
      icon: isPlaying
          ? const Icon(
              Icons.pause,
              color: Colors.white,
            )
          : const Icon(
              Icons.play_arrow,
            ),
      onPressed: () {
        ref.read(audioPlayerProvider.notifier).togglePlay(
              index: index,
            );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';

class HomeMiniPlayerControls extends ConsumerWidget {
  const HomeMiniPlayerControls({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerProvider.select(
      (value) => value.isPlaying,
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          color: const Color.fromARGB(255, 50, 50, 50),
          child: IconButton(
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
        ),
        Container(
          color: const Color.fromARGB(255, 50, 50, 50),
          child: IconButton(
            onPressed: () {
              ref.read(audioPlayerProvider.notifier).next();
            },
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_body/home_body_controls_progress_bar.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';

class HomeBodyControls extends ConsumerWidget {
  const HomeBodyControls({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerProvider.select(
      (value) => value.isPlaying,
    ));

    final currentIndex = ref.watch(audioPlayerProvider.select(
      (value) => value.currentIndex,
    ));

    return currentIndex == index
        ? Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const HomeBodyControlsProgressBar(),
              buildIconButton(
                isPlaying: isPlaying,
                index: index,
                ref: ref,
              ),
            ],
          )
        : buildIconButton(
            isPlaying: false,
            index: index,
            ref: ref,
          );
  }

  Widget buildIconButton({
    required bool isPlaying,
    required int index,
    required WidgetRef ref,
  }) {
    return IconButton(
      onPressed: () {
        ref.read(audioPlayerProvider.notifier).togglePlay(
              index: index,
            );
      },
      icon: Icon(
        color: Colors.white70,
        isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
  }
}

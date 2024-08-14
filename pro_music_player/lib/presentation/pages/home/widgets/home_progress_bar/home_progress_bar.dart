import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/core/widgets/linear_progress_bar.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';

class HomeProgressBar extends ConsumerWidget {
  const HomeProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(audioPlayerProvider.select(
      (value) => value.position,
    ));

    return LinearProgressBar(value: position);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';

class HomeBodyControlsProgressBar extends ConsumerWidget {
  const HomeBodyControlsProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(audioPlayerProvider.select(
      (value) => value.position,
    ));

    return CircularProgressIndicator(
      color: Colors.white,
      value: position,
    );
  }
}

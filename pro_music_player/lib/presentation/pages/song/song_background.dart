import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/state/riverpod/palette_generator/palette_generator_provider.dart';

class SongBackground extends ConsumerWidget {
  const SongBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final background = ref.watch(paletteGeneratorProvider);

    return background.maybeWhen(
      data: (data) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              data,
              Colors.black,
            ],
          )),
        );
      },
      orElse: () {
        return Container(
          color: Colors.black,
        );
      },
    );
  }
}

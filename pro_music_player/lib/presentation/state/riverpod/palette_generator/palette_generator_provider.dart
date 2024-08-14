import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pro_music_player/presentation/state/riverpod/current_song/current_song_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'palette_generator_provider.g.dart';

@riverpod
Future<Color> paletteGenerator(PaletteGeneratorRef ref) async {
  final state = ref.watch(currentSongProvider);

  if (state.song.artwork == null) {
    return Colors.deepPurple;
  }

  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    MemoryImage(state.song.artwork!),
    size: const Size(50, 50),
    maximumColorCount: 1,
  );

  return paletteGenerator.dominantColor?.color ?? Colors.grey.shade700;
}

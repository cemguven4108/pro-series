import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'palette_generator_provider.g.dart';

@riverpod
Future<Color> paletteGenerator(PaletteGeneratorRef ref) async {
  final index = ref.read(audioPlayerNotifierProvider).currentIndex;
  
  if (index == null) return Colors.grey.shade700;

  final song = ref.read(audioPlayerNotifierProvider).queue[index];

  final image = await OnAudioQuery().queryArtwork(
    song.id,
    ArtworkType.AUDIO,
  );

  if (image == null) {
    return Colors.grey.shade700;
  }

  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    MemoryImage(image),
    size: const Size(200, 200), // Size of the image to analyze
    maximumColorCount: 1, // Number of colors to extract
  );

  return paletteGenerator.dominantColor!.color;
}

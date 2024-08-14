import 'package:flutter/foundation.dart' show immutable;
import 'package:pro_music_player/models/music_model.dart';

@immutable
class CurrentSongState {
  final MusicModel song;
  final int index;
  final bool isPlaying;

  const CurrentSongState({
    required this.song,
    required this.index,
    required this.isPlaying,
  });
}

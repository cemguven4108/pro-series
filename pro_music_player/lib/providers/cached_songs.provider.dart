import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cached_songs.provider.g.dart';

@riverpod
CachedSongsNotifier cachedSongs(CachedSongsRef ref) {
  return CachedSongsNotifier();
}

class CachedSongsNotifier extends StateNotifier<List<MusicModel>> {
  CachedSongsNotifier() : super([]);

  void setSongs(List<MusicModel> songs) {
    state = songs;
  }

  List<MusicModel> get songs => state;
}

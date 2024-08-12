import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/state/providers/audio_query/audio_query_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_provider.g.dart';

@riverpod
class SongsNotifier extends _$SongsNotifier {
  @override
  List<MusicModel> build() {
    _init();
    return [];
  }

  void _init() {
    ref.listen(
      audioQueryProvider,
      (prev, next) {
        next.whenData((data) {
          state = data;
        });
      },
    );
  }

  MusicModel? getSongByIndex(int index) {
    if (index < state.length) {
      return state[index];
    }
    return null;
  }

  MusicModel? getSongById(int id) {
    for (var song in state) {
      if (song.id == id) {
        return song;
      }
    }
    return null;
  }
}
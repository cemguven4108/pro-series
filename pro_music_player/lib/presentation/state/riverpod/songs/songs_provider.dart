import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_provider.g.dart';

@riverpod
class SongsNotifier extends _$SongsNotifier {
  @override
  List<MusicModel> build() {
    return [];
  }

  void init(List<MusicModel> songs) {
    state = songs;
  }
}

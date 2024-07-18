import 'package:on_audio_query/on_audio_query.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_provider.g.dart';

@riverpod
Future<List<MusicModel>> songs(SongsRef ref) async {
  final query = await OnAudioQuery().querySongs();

  return query.map((song) => MusicModel.fromSongModel(song)).toList();
}

// final songsProvider = StateNotifierProvider<SongsNotifier, List<MusicModel>>(
//   (ref) => SongsNotifier(),
// );

// class SongsNotifier extends StateNotifier<List<MusicModel>> {
//   SongsNotifier() : super([]) {
//     _loadSongs();
//   }

//   void _loadSongs() async {
//     final songs = await OnAudioQuery().querySongs();

//     state = songs.map((song) => MusicModel.fromSongModel(song)).toList();
//   }
// }

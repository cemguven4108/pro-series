import 'package:on_audio_query/on_audio_query.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_provider.g.dart';

@riverpod
Future<List<MusicModel>> songs(SongsRef ref) async {
  final query = await OnAudioQuery().querySongs(
    ignoreCase: true,
    sortType: SongSortType.TITLE,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
  );

  final songsList = query
      .map(
        (song) => MusicModel.fromSongModel(song),
      )
      .toList();

  return songsList;
}

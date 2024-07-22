import 'package:on_audio_query/on_audio_query.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'songs_notifier.g.dart';

@riverpod
class AsyncSongsNotifier extends _$AsyncSongsNotifier {
  @override
  FutureOr<List<MusicModel>> build() async {
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

  FutureOr<MusicModel?> getSongById(int id) async {
    final song = state.maybeWhen(
      data: (value) {
        return value.firstWhere((element) => element.id == id);
      },
      orElse: () => null,
    );

    return song;
  }
}

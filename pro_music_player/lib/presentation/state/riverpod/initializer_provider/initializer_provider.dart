import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_query/audio_query_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/songs/songs_provider.dart';
import 'package:pro_music_player/presentation/usecases/preference_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initializer_provider.g.dart';

@riverpod
void initialization(InitializationRef ref) {
  final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);

  void init(List<MusicModel> songs) async {
    ref.read(songsNotifierProvider.notifier).init(songs);

    final preference = await PreferenceService().getPlayerPreferences();

    await audioPlayerNotifier.init(
      songs,
      initialIndex: preference.lastIndex,
      initialPosition: preference.lastPosition,
    );
  }

  ref.listen(
    audioQueryProvider,
    (previous, next) {
      next.whenData(
        (songs) {
          if (songs.isNotEmpty) init(songs);
        },
      );
    },
  );
}

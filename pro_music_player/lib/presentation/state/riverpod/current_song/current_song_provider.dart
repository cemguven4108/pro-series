import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/riverpod/current_song/current_song_state.dart';
import 'package:pro_music_player/presentation/state/riverpod/songs/songs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_song_provider.g.dart';

@riverpod
CurrentSongState currentSong(CurrentSongRef ref) {
  final currentIndex = ref.watch(
    audioPlayerProvider.select((value) => value.currentIndex),
  );
  final isPlaying = ref.watch(
    audioPlayerProvider.select((value) => value.isPlaying),
  );

  final songs = ref.read(songsNotifierProvider);

  return CurrentSongState(
    song: songs[currentIndex],
    index: currentIndex,
    isPlaying: isPlaying,
  );
}

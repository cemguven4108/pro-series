import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/providers/audio_player_state.dart';
import 'package:pro_music_player/providers/songs_provider.dart';
import 'package:pro_music_player/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
  (ref) {
    final audioPlayer = AudioPlayer();
    final songs = ref.read(songsProvider);
    final preferencesService = PreferencesService();

    return AudioPlayerNotifier(
      audioPlayer,
      songs,
      preferencesService,
    );
  },
);

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  final AudioPlayer _audioPlayer;
  final AsyncValue<List<MusicModel>> _songs;
  final PreferencesService _preferencesService;

  AudioPlayerNotifier(
    this._audioPlayer,
    this._songs,
    this._preferencesService,
  ) : super(AudioPlayerState()) {
    _initializePlayer();
    _listenToIndex();
  }

  Future<void> _initializePlayer() async {
    final lastIndex = await _preferencesService.getLastIndex() ?? 0;

    setSource(
      _songs.maybeWhen(
        data: (data) => data,
        orElse: () => [],
      ),
      initialIndex: lastIndex,
    );

    state = state.copyWith(
      currentIndex: lastIndex,
    );
  }

  void _saveCurrentIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastIndex', index);
  }

  void play({int? index}) async {
    if (index != null && index != _audioPlayer.currentIndex) {
      await _audioPlayer.seek(Duration.zero, index: index);
      state = state.copyWith(
        currentIndex: index,
      );
    }

    state = state.copyWith(
      isPlaying: true,
    );
    await _audioPlayer.play();
  }

  void togglePlay({int? index}) {
    if (_audioPlayer.playing) {
      pause();
    } else {
      play(index: index);
    }

    state = state.copyWith(
      isPlaying: _audioPlayer.playing,
    );
  }

  void pause() {
    if (_audioPlayer.playing) _audioPlayer.pause();
  }

  void next() async {
    if (_audioPlayer.hasNext) {
      await _audioPlayer.seekToNext();
      play();
    }
  }

  void previous() {
    if (_audioPlayer.hasPrevious) _audioPlayer.seekToPrevious();
  }

  void setSource(List<MusicModel> songs, {int? initialIndex}) async {
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: songs
            .map(
              (song) => AudioSource.uri(song.uri),
            )
            .toList(),
      ),
      initialIndex: initialIndex,
    );
  }

  void _listenToIndex() {
    _audioPlayer.currentIndexStream.listen(
      (index) {
        if (index != null) {
          state = state.copyWith(
            currentIndex: index,
          );
          _saveCurrentIndex(index);
        }
      },
    );
  }
}

import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_state.dart';
import 'package:pro_music_player/presentation/state/providers/songs_provider/songs_provider.dart';
import 'package:pro_music_player/services/audio_player_service.dart';
import 'package:pro_music_player/services/preference_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player_provider.g.dart';

@riverpod
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  late final AudioPlayerService _audioPlayerService;

  @override
  AudioPlayerState build() {
    _audioPlayerService = AudioPlayerService.instance();
    _init();

    return state;
  }

  void _init() async {
    final songs = ref.read(songsNotifierProvider);
    final preferences = await PreferenceService().getPlayerPreferences();

    await _audioPlayerService.setSource(
      songs,
      initialIndex: preferences.lastIndex,
      initialPosition:
          Duration(seconds: (preferences.lastPosition?.toInt() ?? 0)),
    );

    _listenToPosition();
    _listenToDuration();
    _listenToIndex();
    _listenToPlaying();
  }

  // Toggle play/pause based on current playback state
  Future<void> togglePlay({required int index}) async {
    _audioPlayerService.togglePlay(index: index);
  }

  // Play the next song in the playlist
  void next() async {
    await _audioPlayerService.next();
  }

  // Play the previous song in the playlist
  void previous() async {
    await _audioPlayerService.previous();
  }

  void seek(Duration position, {int? index}) async {
    await _audioPlayerService.seek(position, index: index);
  }

  void stop() async {
    await _audioPlayerService.stop();
  }

  // Set the audio source and optionally the initial index
  Future<void> setSource(
    List<MusicModel> songs, {
    int? initialIndex,
    double? initialPosition,
  }) async {
    await _audioPlayerService.setSource(
      songs,
      initialIndex: initialIndex ?? 0,
      initialPosition: Duration(seconds: initialPosition?.toInt() ?? 0),
    );

    state = state.copyWith(
      currentIndex: initialIndex ?? 0,
      position: initialPosition ?? 0.0,
    );
  }

  void dispose() {
    _audioPlayerService.dispose();
  }

  //Listen to changes in the current index and update the state
  void _listenToIndex() {
    _audioPlayerService.currentIndexStream().listen(
      (index) {
        if (index != null) {
          // Update the state with the new index
          state = state.copyWith(
            currentIndex: index,
            duration: state.duration,
            playing: state.playing,
          );
        }
      },
    );
  }

  void _listenToPlaying() {
    _audioPlayerService.playingStream().listen(
      (playing) {
        state = state.copyWith(
          playing: playing,
          duration: state.duration,
        );
      },
    );
  }

  void _listenToPosition() {
    _audioPlayerService.positionStream().listen(
      (position) {
        if (state.duration == Duration.zero) {
          return;
        }

        final value = (position!.inSeconds.toDouble() /
                (state.duration?.inSeconds ?? 0)) *
            100;

        state = state.copyWith(
          position: value * 0.01,
        );
      },
    );
  }

  void _listenToDuration() {
    _audioPlayerService.durationStream().listen(
      (duration) {
        if (duration == null) {
          return;
        }

        state = state.copyWith(
          duration: duration,
        );
      },
    );
  }
}

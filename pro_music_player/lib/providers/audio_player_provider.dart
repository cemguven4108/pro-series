import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/providers/audio_player_state.dart';
import 'package:pro_music_player/providers/songs_notifier.dart';
import 'package:pro_music_player/services/audio_player_service.dart';
import 'package:pro_music_player/services/preferences_service.dart';

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
  (ref) {
    // Create an instance of the audio player, retrieve the songs list from the provider, and initialize the preferences service.
    final audioPlayerService = AudioPlayerService.instance();
    final songs = ref.read(asyncSongsNotifierProvider);
    final preferencesService = PreferencesService();

    return AudioPlayerNotifier(
      audioPlayerService,
      songs,
      preferencesService,
    );
  },
);

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  final AudioPlayerService _audioPlayerService;
  final AsyncValue<List<MusicModel>> _songs;
  final PreferencesService _preferencesService;

  AudioPlayerNotifier(
    this._audioPlayerService,
    this._songs,
    this._preferencesService,
  ) : super(const AudioPlayerState()) {
    _initializePlayer(); // Initialize the audio player
    _listenToIndex();
    _listenToPlaying();
    _listenToPosition();
    _listenToDuration();
  }

  // Initialize the audio player and set the source
  Future<void> _initializePlayer() async {
    // Retrieve the last index from preferences, default to 0 if not found
    final lastIndex = await _preferencesService.getLastIndex() ?? 0;

    // Set the audio source and initial index for the player
    setSource(
      _songs.maybeWhen(
        data: (data) => data, // If songs are available, use them
        orElse: () => [], // Otherwise, use an empty list
      ),
      initialIndex: lastIndex,
    );
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

  // Set the audio source and optionally the initial index
  Future<void> setSource(
    List<MusicModel> songs, {
    int? initialIndex,
  }) async {
    final duration = await _audioPlayerService.setSource(
      songs,
      initialIndex: initialIndex,
    );

    state = state.copyWith(
      sourceDuration: duration ?? Duration.zero,
    );
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
            isPlaying: state.isPlaying,
          );
          // Save the current index to preferences
          _preferencesService.saveLastIndex(index);
        }
      },
    );
  }

  void _listenToPlaying() {
    _audioPlayerService.playingStream().listen(
      (isPlaying) {
        state = state.copyWith(
          isPlaying: isPlaying,
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
        final value =
            (position!.inSeconds.toDouble() / state.duration.inSeconds) * 100;
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

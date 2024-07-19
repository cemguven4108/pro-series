import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/providers/audio_player_state.dart';
import 'package:pro_music_player/providers/songs_provider.dart';
import 'package:pro_music_player/services/preferences_service.dart';

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
  (ref) {
    // Create an instance of the audio player, retrieve the songs list from the provider, and initialize the preferences service.
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
  ) : super(const AudioPlayerState()) {
    _initializePlayer(); // Initialize the audio player
    _listenToIndex(); // Listen to changes in the current index
    _listenToPlaying();
    _listenToPosition();
  }

  // Initialize the audio player and set the source
  Future<void> _initializePlayer() async {
    // Retrieve the last index from preferences, default to 0 if not found
    final lastIndex = await _preferencesService.getLastIndex() ?? 0;

    // Set the audio source and initial index for the player
    await setSource(
      _songs.maybeWhen(
        data: (data) => data, // If songs are available, use them
        orElse: () => [], // Otherwise, use an empty list
      ),
      initialIndex: lastIndex,
    );
  }

  // Toggle play/pause based on current playback state
  Future<void> togglePlay({int? index}) async {
    if (_audioPlayer.playing && index == _audioPlayer.currentIndex) {
      pause(); // Pause if currently playing
    } else {
      _play(index: index); // Play if currently paused
    }

    // Update the state with the current playback status
  }

  // Pause playback
  Future<void> pause() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause(); // Only pause if playing
    }
  }

  // Play the next song in the playlist
  Future<void> next() async {
    if (_audioPlayer.hasNext) {
      await _audioPlayer.seekToNext(); // Move to the next song
      togglePlay(); // Start playing the next song
    }
  }

  // Play the previous song in the playlist
  Future<void> previous() async {
    if (_audioPlayer.hasPrevious) {
      await _audioPlayer.seekToPrevious(); // Move to the previous song
      togglePlay(); // Start playing the previous song
    }
  }

  Future<void> seek(Duration position) async {
    // Seek to the given duration
    await _audioPlayer.seek(
      position,
      index: _audioPlayer.currentIndex,
    );
  }

  // Set the audio source and optionally the initial index
  Future<void> setSource(List<MusicModel> songs, {int? initialIndex}) async {
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: songs
            .map(
              (song) =>
                  AudioSource.uri(song.uri), // Map each song to an AudioSource
            )
            .toList(),
      ),
      initialIndex: initialIndex, // Set the initial index if provided
    );
  }

  // Play a song at a given index
  Future<void> _play({int? index}) async {
    if (index != null && index != _audioPlayer.currentIndex) {
      // Seek to the beginning of the song if a new index is provided
      await _audioPlayer.seek(Duration.zero, index: index);
    }

    await _audioPlayer.play(); // Start playback
  }

  // Listen to changes in the current index and update the state
  void _listenToIndex() {
    _audioPlayer.currentIndexStream.listen(
      (index) {
        if (index != null) {
          // Update the state with the new index
          state = state.copyWith(
            currentIndex: index,
            duration: _audioPlayer.duration ?? Duration.zero,
            isPlaying: _audioPlayer.playing,
          );
          // Save the current index to preferences
          _preferencesService.saveLastIndex(index);
        }
      },
    );
  }

  void _listenToPlaying() {
    _audioPlayer.playingStream.listen(
      (isPlaying) {
        state = state.copyWith(
          isPlaying: isPlaying,
          duration: _audioPlayer.duration ?? Duration.zero,
        );
      },
    );
  }

  void _listenToPosition() {
    _audioPlayer.positionStream.listen(
      (position) {
        if (state.duration == Duration.zero) {
          return;
        }
        final value =
            (position.inSeconds.toDouble() / state.duration.inSeconds) * 100;
        state = state.copyWith(
          position: value * 0.01,
        );
      },
    );
  }
}

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
    _listenToIndex(); // Start listening to index changes
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

    // Update the state with the last index
    state = state.copyWith(
      currentIndex: lastIndex,
    );
  }

  // Play a song at a given index
  void _play({int? index}) async {
    if (index != null && index != _audioPlayer.currentIndex) {
      // Seek to the beginning of the song if a new index is provided
      await _audioPlayer.seek(Duration.zero, index: index);
      state = state.copyWith(
        currentIndex: index,
        isPlaying: true,
      );
    } else {
      state = state.copyWith(
        isPlaying: true,
      );
    }
    await _audioPlayer.play(); // Start playback
  }

  // Toggle play/pause based on current playback state
  void togglePlay({int? index}) {
    if (_audioPlayer.playing && index == _audioPlayer.currentIndex) {
      pause(); // Pause if currently playing
    } else {
      _play(index: index); // Play if currently paused
    }

    // Update the state with the current playback status
    state = state.copyWith(
      isPlaying: _audioPlayer.playing,
    );
  }

  // Pause playback
  void pause() {
    if (_audioPlayer.playing) _audioPlayer.pause(); // Only pause if playing
  }

  // Play the next song in the playlist
  void next() async {
    if (_audioPlayer.hasNext) {
      await _audioPlayer.seekToNext(); // Move to the next song
      togglePlay(); // Start playing the next song
    }
  }

  // Play the previous song in the playlist
  void previous() async {
    if (_audioPlayer.hasPrevious) {
      await _audioPlayer.seekToPrevious(); // Move to the previous song
      togglePlay(); // Start playing the previous song
    }
  }

  // Set the audio source and optionally the initial index
  void setSource(List<MusicModel> songs, {int? initialIndex}) async {
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

  // Listen to changes in the current index and update the state
  void _listenToIndex() {
    _audioPlayer.currentIndexStream.listen(
      (index) {
        if (index != null) {
          // Update the state with the new index
          state = state.copyWith(
            currentIndex: index,
          );
          // Save the current index to preferences
          _preferencesService.saveLastIndex(index);
        }
      },
    );
  }
}

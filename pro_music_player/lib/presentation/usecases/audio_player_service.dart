import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/models/preference_model.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_state.dart';
import 'package:pro_music_player/presentation/usecases/preference_service.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer;

  AudioPlayerService._(
    this._audioPlayer,
  );

  static final _instance = AudioPlayerService._(
    AudioPlayer(),
  );

  factory AudioPlayerService.instance() => _instance;

  Future<AudioPlayerState> setSource(
    List<MusicModel> songs, {
    int? initialIndex,
    Duration? initialPosition,
  }) async {
    await _audioPlayer.setAudioSource(
      initialIndex: initialIndex,
      initialPosition: initialPosition,
      ConcatenatingAudioSource(
        children: songs.map((song) {
          return AudioSource.uri(
            song.uri,
            tag: MediaItem(
              id: song.id.toString(),
              title: song.title,
              album: song.album,
              artist: song.artist,
              genre: song.genre,
              duration: Duration(seconds: song.duration),
              playable: true,
            ),
          );
        }).toList(),
      ),
    );

    return AudioPlayerState(
      currentIndex: _audioPlayer.currentIndex ?? 0,
      position: _audioPlayer.position.inSeconds.toDouble(),
      duration: _audioPlayer.duration ?? Duration.zero,
      isPlaying: _audioPlayer.playing,
    );
  }

  Future<void> togglePlay({int? index}) async {
    final isCurrent = _checkIfCurrentIndex(index);

    if (isCurrent) {
      await _toggleCurrent();
    } else {
      await _audioPlayer.seek(Duration.zero, index: index);
      await _audioPlayer.play();
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> next() async {
    if (_audioPlayer.hasNext) {
      await _audioPlayer.seekToNext(); // Seek to the next song
      await _audioPlayer.play();
    }
  }

  Future<void> previous() async {
    if (_audioPlayer.hasPrevious) {
      await _audioPlayer.seekToPrevious(); // Seek to the previous song
      await _audioPlayer.play();
    }
  }

  Future<void> seek(Duration position, {int? index}) async {
    await _audioPlayer.seek(position, index: index);
  }

  Future<void> dispose() async {
    final preference = PreferenceService();

    await preference.setPlayerPreferences(PreferenceModel(
      lastIndex: _audioPlayer.currentIndex,
      lastPosition: _audioPlayer.position.inSeconds.toDouble(),
    ));

    await _audioPlayer.dispose();
  }

  Stream<int?> currentIndexStream() {
    return _audioPlayer.currentIndexStream;
  }

  Stream<bool> playingStream() {
    return _audioPlayer.playingStream;
  }

  Stream<Duration?> durationStream() {
    return _audioPlayer.durationStream;
  }

  Stream<Duration?> positionStream() {
    return _audioPlayer.positionStream;
  }

  bool _checkIfCurrentIndex(int? index) {
    if (index == null) return true;
    return _audioPlayer.currentIndex == index;
  }

  Future<void> _toggleCurrent() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }
}

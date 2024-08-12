import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/models/preference_model.dart';
import 'package:pro_music_player/services/preference_service.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer;
  final PreferenceService _preferenceService;

  AudioPlayerService._private(
    this._audioPlayer,
    this._preferenceService,
  );

  static final _instance = AudioPlayerService._private(
    AudioPlayer(),
    PreferenceService(),
  );

  factory AudioPlayerService.instance() => _instance;

  Future<void> togglePlay({required int index}) async {
    final isCurrent = _checkIfCurrentIndex(index);

    if (isCurrent) {
      await _toggleCurrent();
    } else {
      await _audioPlayer.seek(Duration.zero, index: index);
      await _audioPlayer.play();
    }
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

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<Duration?> setSource(
    List<MusicModel> songs, {
    int? initialIndex,
    Duration? initialPosition,
  }) async {
    final preference = await _preferenceService.getPlayerPreferences();

    final duration = await _audioPlayer.setAudioSource(
      initialIndex: preference.lastIndex ?? 0,
      initialPosition: Duration(seconds: (preference.lastPosition?.toInt() ?? 0)),
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

    return duration;
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

  bool _checkIfCurrentIndex(int index) {
    return index == _audioPlayer.currentIndex;
  }

  Future<void> _toggleCurrent() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> dispose() async {
    await _preferenceService.setPlayerPreferences(
      PreferenceModel(
        lastIndex: _audioPlayer.currentIndex,
        lastPosition: _audioPlayer.position.inSeconds.toDouble(),
      ),
    );
    await _audioPlayer.dispose();
  }
}

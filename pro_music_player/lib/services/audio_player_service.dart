import 'package:just_audio/just_audio.dart';
import 'package:pro_music_player/models/music_model.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer;

  AudioPlayerService._private(
    this._audioPlayer,
  );

  static final _instance = AudioPlayerService._private(
    AudioPlayer(),
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

  Future<void> setSource(List<MusicModel> songs, {int? initialIndex}) async {
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
}

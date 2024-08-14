import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_state.dart';
import 'package:pro_music_player/presentation/usecases/audio_player_service.dart';

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>(
  (ref) {
    ref.onDispose(
      () => AudioPlayerService.instance().dispose(),
    );
    return AudioPlayerNotifier();
  },
);

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  late final AudioPlayerService _audioPlayerService;

  AudioPlayerNotifier() : super(const AudioPlayerState()) {
    _audioPlayerService = AudioPlayerService.instance();
  }

  Future<void> init(
    List<MusicModel> songs, {
    int? initialIndex,
    double? initialPosition,
  }) async {
    final newState = await _audioPlayerService.setSource(
      songs,
      initialIndex: initialIndex,
      initialPosition: Duration(seconds: initialPosition?.toInt() ?? 0),
    );

    _listen();

    state = state.copyWith(
      currentIndex: newState.currentIndex,
      duration: newState.duration,
      isPlaying: newState.isPlaying,
      position: newState.position,
      isInitialized: true,
    );
  }

  void togglePlay({int? index}) async {
    _audioPlayerService.togglePlay(index: index);
  }

  void pause() async {
    _audioPlayerService.pause();
  }

  void next() async {
    _audioPlayerService.next();
  }

  void previous() async {
    _audioPlayerService.previous();
  }

  void seek(Duration position, {int? index}) async {
    _audioPlayerService.seek(position, index: index);
  }

  void setSource(
    List<MusicModel> songs, {
    int? initialIndex,
    double? initialPosition,
  }) async {
    _audioPlayerService.setSource(
      songs,
      initialIndex: initialIndex,
      initialPosition: Duration(
        seconds: initialPosition?.toInt() ?? 0,
      ),
    );
  }

  void _listen() {
    _listenToPlayingStream();
    _listenToCurrentIndexStream();
    _listenToPositionStream();
    _listenToDurationStream();
  }

  void _listenToPlayingStream() {
    _audioPlayerService.playingStream().listen(
      (isPlaying) {
        state = state.copyWith(
          isPlaying: isPlaying,
        );
      },
    );
  }

  void _listenToCurrentIndexStream() {
    _audioPlayerService.currentIndexStream().listen(
      (index) {
        if (index != null) {
          state = state.copyWith(
            currentIndex: index,
            duration: state.duration,
            isPlaying: state.isPlaying,
          );
        }
      },
    );
  }

  void _listenToDurationStream() {
    _audioPlayerService.durationStream().listen(
      (duration) {
        state = state.copyWith(
          duration: duration,
        );
      },
    );
  }

  void _listenToPositionStream() {
    _audioPlayerService.positionStream().listen(
      (position) {
        state = state.copyWith(
          position: position?.inSeconds.toDouble(),
        );
      },
    );
  }
}

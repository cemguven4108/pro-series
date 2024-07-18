class AudioPlayerState {
  final bool _isPlaying;
  final int _currentIndex;
  final Duration _duration;

  AudioPlayerState({
    bool isPlaying = false,
    int currentIndex = 0,
    Duration duration = Duration.zero,
  })  : _isPlaying = isPlaying,
        _currentIndex = currentIndex,
        _duration = duration;

  AudioPlayerState copyWith({
    bool? isPlaying,
    int? currentIndex,
    Duration? duration,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? _isPlaying,
      currentIndex: currentIndex ?? _currentIndex,
      duration: duration ?? _duration,
    );
  }

  bool get isPlaying => _isPlaying;
  int get currentIndex => _currentIndex;
  Duration get duration => _duration;
}

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AudioPlayerState {
  /// Indicates whether the audio player is currently playing.
  final bool isPlaying;

  // The index of the currently playing track.
  final int currentIndex;

  // The duration of the currently playing track.
  final Duration duration;

  // The current position of the currently playing track.
  final double position;

  const AudioPlayerState({
    this.isPlaying = false,
    this.currentIndex = 0,
    this.duration = Duration.zero,
    this.position = 0.0,
  });

  // Creates a copy of this state with the given fields updated.
  AudioPlayerState copyWith({
    bool? isPlaying,
    int? currentIndex,
    Duration? duration,
    double? position,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      currentIndex: currentIndex ?? this.currentIndex,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioPlayerState &&
        other.isPlaying == isPlaying &&
        other.currentIndex == currentIndex &&
        other.duration == duration &&
        other.position == position;
  }

  @override
  int get hashCode =>
      isPlaying.hashCode ^
      currentIndex.hashCode ^
      duration.hashCode ^
      position.hashCode;
}

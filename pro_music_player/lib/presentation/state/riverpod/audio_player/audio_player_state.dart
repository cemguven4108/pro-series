import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class AudioPlayerState extends Equatable {
  final bool isInitialized;
  final bool isPlaying;
  final int currentIndex;
  final Duration duration;
  final double position;

  const AudioPlayerState({
    this.isInitialized = false,
    this.isPlaying = false,
    this.currentIndex = 0,
    this.duration = Duration.zero,
    this.position = 0.0,
  });

  AudioPlayerState copyWith({
    bool? isInitialized,
    int? currentIndex,
    Duration? duration,
    double? position,
    bool? isPlaying,
  }) {
    return AudioPlayerState(
      isInitialized: isInitialized ?? this.isInitialized,
      isPlaying: isPlaying ?? this.isPlaying,
      currentIndex: currentIndex ?? this.currentIndex,
      duration: duration ?? this.duration,
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props => [
        isInitialized,
        isPlaying,
        currentIndex,
        duration,
        position,
      ];
}

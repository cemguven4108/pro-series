import 'package:flutter/foundation.dart' show listEquals, immutable;
import 'package:just_audio/just_audio.dart';
import 'package:pro_music_player/models/music_model.dart';

@immutable
class AudioPlayerState {
  final List<MusicModel> queue;
  final AudioSource? audioSource;

  final LoopMode loopMode;

  final Duration? duration;
  final double position;

  final int? currentIndex;

  final double speed;
  final double volume;

  final bool hasNext;
  final bool hasPrevious;
  final bool playing;

  const AudioPlayerState({
    this.queue = const [],
    this.audioSource,
    this.loopMode = LoopMode.all,
    this.duration,
    this.position = 0.0,
    this.currentIndex,
    this.speed = 1.0,
    this.volume = 1.0,
    this.hasNext = false,
    this.hasPrevious = false,
    this.playing = false,
  });

  AudioPlayerState copyWith({
    List<MusicModel>? queue,
    AudioSource? audioSource,
    LoopMode? loopMode,
    Duration? duration,
    double? position,
    int? currentIndex,
    double? speed,
    double? volume,
    bool? hasNext,
    bool? hasPrevious,
    bool? playing,
  }) {
    return AudioPlayerState(
      queue: queue ?? this.queue,
      audioSource: audioSource ?? this.audioSource,
      loopMode: loopMode ?? this.loopMode,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      currentIndex: currentIndex ?? this.currentIndex,
      speed: speed ?? this.speed,
      volume: volume ?? this.volume,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      playing: playing ?? this.playing,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioPlayerState &&
        listEquals(other.queue, queue) &&
        other.audioSource == audioSource &&
        other.loopMode == loopMode &&
        other.duration == duration &&
        other.position == position &&
        other.currentIndex == currentIndex &&
        other.speed == speed &&
        other.volume == volume &&
        other.hasNext == hasNext &&
        other.hasPrevious == hasPrevious &&
        other.playing == playing;
  }

  @override
  int get hashCode {
    return queue.hashCode ^
        audioSource.hashCode ^
        loopMode.hashCode ^
        duration.hashCode ^
        position.hashCode ^
        currentIndex.hashCode ^
        speed.hashCode ^
        volume.hashCode ^
        hasNext.hashCode ^
        hasPrevious.hashCode ^
        playing.hashCode;
  }
}
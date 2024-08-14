import 'dart:typed_data';

import 'package:on_audio_query/on_audio_query.dart';

class MusicModel {
  final int id;
  final Uri uri;
  final String title;
  final String artist;
  final String album;
  final String genre;
  final int duration;
  final Uint8List? artwork;

  MusicModel({
    required this.id,
    required this.uri,
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    required this.duration,
    this.artwork,
  });

  factory MusicModel.fromSongModel(SongModel model, {Uint8List? artwork}) {
    return MusicModel(
      id: model.id,
      uri: Uri.parse(model.uri!),
      title: model.title,
      artist: model.artist ?? "Unknown Artist",
      album: model.album ?? "Unknown Album",
      genre: model.genre ?? "Unknown Genre",
      duration: model.duration ?? 0,
      artwork: artwork,
    );
  }

  @override
  String toString() {
    return 'MusicModel(id: $id, uri: $uri, title: $title, artist: $artist, album: $album, genre: $genre, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MusicModel &&
        other.id == id &&
        other.uri == uri &&
        other.title == title &&
        other.artist == artist &&
        other.album == album &&
        other.genre == genre &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uri.hashCode ^
        title.hashCode ^
        artist.hashCode ^
        album.hashCode ^
        genre.hashCode ^
        duration.hashCode;
  }
}

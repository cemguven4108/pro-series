import 'package:on_audio_query/on_audio_query.dart';

class MusicModel {
  final int id;
  final Uri uri;
  final String title;
  final String artist;
  final String album;
  final int duration;

  MusicModel({
    required this.id,
    required this.uri,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
  });

  factory MusicModel.fromSongModel(SongModel model) {
    return MusicModel(
      id: model.id,
      uri: Uri.parse(model.uri!),
      title: model.title,
      artist: model.artist ?? "Unknown Artist",
      album: model.album ?? "Unknown Album",
      duration: model.duration ?? 0,
    );
  }
}

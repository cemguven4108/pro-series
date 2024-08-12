import 'dart:async';

import 'package:flutter/foundation.dart' show Uint8List;
import 'package:on_audio_query/on_audio_query.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_query_provider.g.dart';

@riverpod
Future<List<MusicModel>> audioQuery(AudioQueryRef ref) async {
  final songs = await _querySongs();
  return _mapSongs(songs);
}

Future<List<SongModel>> _querySongs() async {
  final songs = await OnAudioQuery().querySongs(
    ignoreCase: true,
    sortType: SongSortType.TITLE,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
  );

  return songs;
}

Future<List<MusicModel>> _mapSongs(List<SongModel> songs) async {
  final List<MusicModel> mappedSongs = [];

  for (final song in songs) {
    final artwork = await _queryArtwork(song.id);
    final musicModel = MusicModel.fromSongModel(song, artwork: artwork);

    mappedSongs.add(musicModel);
  }

  return mappedSongs;
}

Future<Uint8List?> _queryArtwork(int id) async {
  return await OnAudioQuery().queryArtwork(
    id,
    ArtworkType.AUDIO,
    format: ArtworkFormat.JPEG,
  );
}

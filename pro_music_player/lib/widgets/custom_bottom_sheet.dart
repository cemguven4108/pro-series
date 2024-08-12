import 'package:flutter/material.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/pages/song/song_page.dart';

void showSongPageSheet({
  required BuildContext context,
  required MusicModel song,
}) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    sheetAnimationStyle: AnimationStyle(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      reverseCurve: Curves.linear,
      reverseDuration: const Duration(milliseconds: 500),
    ),
    scrollControlDisabledMaxHeightRatio: 1,
    builder: (_) => SongPage(
      song: song,
    ),
  );
}

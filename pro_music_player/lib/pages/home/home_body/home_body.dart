import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/pages/home/home_body/home_body_body.dart';
import 'package:pro_music_player/pages/home/home_body/home_body_controls.dart';
import 'package:pro_music_player/pages/home/home_body/home_body_frame.dart';
import 'package:pro_music_player/pages/song/song_page.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.songs,
  });

  final List<MusicModel> songs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleOnBodyTap(int index) {
      showBottomSheet(
        context: context,
        builder: (_) => const SongPage(),
      );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => handleOnBodyTap(index),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: <Widget>[
                HomeBodyFrame(id: songs[index].id),
                const SizedBox(width: 16),
                HomeBodyBody(
                  title: songs[index].title,
                  artist: songs[index].artist,
                ),
                HomeBodyControls(index: index),
              ],
            ),
          ),
        );
      },
    );
  }
}

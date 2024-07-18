import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/pages/home/home_footer_body.dart';
import 'package:pro_music_player/pages/home/home_footer_controls.dart';
import 'package:pro_music_player/pages/home/home_footer_frame.dart';

class HomeFooter extends ConsumerWidget {
  const HomeFooter({
    super.key,
    required this.song,
    required this.index,
  });

  final MusicModel song;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      color: Colors.grey.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HomeFooterFrame(
            id: song.id,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: HomeFooterBody(
                title: song.title,
                artist: song.artist,
              ),
            ),
          ),
          HomeFooterControls(
            index: index,
          )
        ],
      ),
    );
  }
}

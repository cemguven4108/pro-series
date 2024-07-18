import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
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
    final size = MediaQuery.of(context).size;

    return Container(
      height: kBottomNavigationBarHeight + 10,
      width: size.width,
      color: Colors.grey.shade900.withOpacity(1),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: HomeFooterFrame(
              id: song.id,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    song.title,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    song.artist,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: HomeFooterControls(
              index: index,
            ),
          )
        ],
      ),
    );
  }
}

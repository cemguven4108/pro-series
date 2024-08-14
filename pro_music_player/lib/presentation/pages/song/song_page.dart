import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/constants/app_size.dart';
import 'package:pro_music_player/presentation/pages/song/song_app_bar.dart';
import 'package:pro_music_player/presentation/pages/song/song_background.dart';
import 'package:pro_music_player/presentation/pages/song/song_carousel.dart';
import 'package:pro_music_player/presentation/pages/song/song_controls.dart';
import 'package:pro_music_player/presentation/pages/song/song_details.dart';

class SongPage extends ConsumerWidget {
  const SongPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const SongBackground(),
          const Positioned(
            top: AppSize.songAppBarHeight,
            left: 0,
            right: 0,
            child: SongAppBar(),
          ),
          Positioned(
            top: AppSize.songAppBarHeight + (size.height * 0.1),
            left: 25,
            right: 25,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SongCarousel(),
                SizedBox(height: 20),
                SongDetails(),
                SizedBox(height: 20),
                SongControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

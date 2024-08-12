import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/pages/song/song_page_app_bar.dart';
import 'package:pro_music_player/presentation/pages/song/song_page_body.dart';
import 'package:pro_music_player/presentation/state/providers/palette_generator_provider.dart';

class SongPage extends ConsumerWidget {
  const SongPage({
    super.key,
    required this.song,
  });

  final MusicModel song;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paletteColor = ref.watch(paletteGeneratorProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: paletteColor.maybeWhen(
        data: (color) => buildSongPage(color),
        orElse: () => buildSongPage(Colors.grey.shade700),
      ),
    );
  }

  Widget buildSongPage(Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SongPageAppBar(),
            SongPageBody(song: song),
            const Spacer(),
            Container(
              height: kBottomNavigationBarHeight,
              width: double.infinity,
              color: Colors.grey,
              child: const Center(child: Text("sliders")),
            ),
          ],
        ),
      ),
    );
  }
}

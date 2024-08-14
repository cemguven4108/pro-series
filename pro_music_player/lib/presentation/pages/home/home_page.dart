import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_mini_player/home_mini_player.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_navigation_bar/home_navigation_bar.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_progress_bar/home_progress_bar.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_tile/home_tile.dart';
import 'package:pro_music_player/presentation/state/riverpod/songs/songs_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Pro Player",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ];
        },
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return HomeTile(
                    song: songs[index],
                    index: index,
                  );
                },
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                HomeMiniPlayer(),
                HomeProgressBar(),
                HomeNavigationBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

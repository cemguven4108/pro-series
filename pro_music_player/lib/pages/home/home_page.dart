import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_body/home_body.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer.dart';
import 'package:pro_music_player/providers/songs_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(asyncSongsNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: songsAsyncValue.when(
        data: (songs) {
          return NestedScrollView(
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
                  child: HomeBody(
                    songs: songs,
                  ),
                ),
                const HomeFooter(),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

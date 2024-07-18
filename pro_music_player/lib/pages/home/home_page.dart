import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_body.dart';
import 'package:pro_music_player/pages/home/home_footer.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';
import 'package:pro_music_player/providers/songs_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(songsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: songsAsyncValue.when(
        data: (songs) {
          final currentIndex = ref.watch(audioPlayerProvider).currentIndex;

          return Stack(
            children: <Widget>[
              HomeBody(songs: songs),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: HomeFooter(
                  song: songs[currentIndex],
                  index: currentIndex,
                ),
              ),
            ],
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

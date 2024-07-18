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
    final songs = ref.watch(songsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: songs.maybeWhen(
        data: (data) {
          return Stack(
            children: <Widget>[
              HomeBody(songs: data),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    const LinearProgressIndicator(value: 1),
                    Consumer(
                      builder: (context, ref, child) {
                        final currentIndex =
                            ref.watch(audioPlayerProvider).currentIndex;

                        return HomeFooter(
                          song: data[currentIndex],
                          index: currentIndex,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

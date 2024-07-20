import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_body.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_controls.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_frame.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_nav_bar/home_footer_navigation_bar.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_progress_bar.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';
import 'package:pro_music_player/providers/songs_notifier.dart';

class HomeFooter extends ConsumerWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(asyncSongsNotifierProvider);

    final currentIndex = ref.watch(audioPlayerProvider.select(
      (value) => value.currentIndex,
    ));

    return songsAsyncValue.maybeWhen(
      data: (songs) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: const Color.fromARGB(255, 50, 50, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      // ToDo: Implement swipe to change song
                      child: Row(
                        children: <Widget>[
                          HomeFooterFrame(
                            id: songs[currentIndex].id,
                          ),
                          Expanded(
                            child: HomeFooterBody(
                              title: songs[currentIndex].title,
                              artist: songs[currentIndex].artist,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const HomeFooterControls()
                ],
              ),
            ),
            const HomeFooterProgressBar(),
            const HomeFooterNavigationBar(),
          ],
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_footer_body.dart';
import 'package:pro_music_player/pages/home/home_footer_controls.dart';
import 'package:pro_music_player/pages/home/home_footer_frame.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';
import 'package:pro_music_player/providers/songs_provider.dart';

class HomeFooter extends ConsumerWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(songsProvider);

    final currentIndex = ref.watch(audioPlayerProvider.select(
      (value) => value.currentIndex,
    ));

    print("HomeFooter Building");

    return songsAsyncValue.maybeWhen(
      data: (songs) {
        return Container(
          height: kBottomNavigationBarHeight,
          width: double.infinity,
          color: Colors.grey.shade900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HomeFooterFrame(
                id: songs[currentIndex].id,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: HomeFooterBody(
                    title: songs[currentIndex].title,
                    artist: songs[currentIndex].artist,
                  ),
                ),
              ),
              const HomeFooterControls()
            ],
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

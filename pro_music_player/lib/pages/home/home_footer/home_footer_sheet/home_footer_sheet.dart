import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_sheet/home_footer_sheet_body.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_sheet/home_footer_sheet_controls.dart';
import 'package:pro_music_player/pages/home/home_footer/home_footer_sheet/home_footer_sheet_frame.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';
import 'package:pro_music_player/providers/songs_notifier.dart';
import 'package:pro_music_player/widgets/swipe_animation.dart';

class HomeFooterSheet extends ConsumerStatefulWidget {
  const HomeFooterSheet({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeFooterSheetState();
}

class _HomeFooterSheetState extends ConsumerState<HomeFooterSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final songsAsyncValue = ref.watch(asyncSongsNotifierProvider);

    final currentIndex = ref.watch(audioPlayerProvider.select(
      (value) => value.currentIndex,
    ));

    return Container(
      height: 50,
      color: const Color.fromARGB(255, 50, 50, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          songsAsyncValue.maybeWhen(
            data: (data) {
              final songs = data;

              return Expanded(
                child: SwipeAnimation(
                  previous: () => ref
                      .read(
                        audioPlayerProvider.notifier,
                      )
                      .previous(),
                  next: () => ref.read(audioPlayerProvider.notifier).next(),
                  child: Row(
                    children: <Widget>[
                      HomeFooterSheetFrame(
                        id: songs[currentIndex].id,
                      ),
                      Expanded(
                        child: HomeFooterSheetBody(
                          title: songs[currentIndex].title,
                          artist: songs[currentIndex].artist,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          ),
          const HomeFooterSheetControls()
        ],
      ),
    );
  }
}

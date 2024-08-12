import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/home_body/home_body_details.dart';
import 'package:pro_music_player/presentation/pages/home/home_body/home_body_controls.dart';
import 'package:pro_music_player/presentation/pages/home/home_body/home_body_frame.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:pro_music_player/presentation/state/providers/songs_provider/songs_provider.dart';
import 'package:pro_music_player/widgets/custom_bottom_sheet.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsNotifierProvider);

    void handleOnBodyTap(int index) {
      ref.read(audioPlayerNotifierProvider.notifier).togglePlay(index: index);

      showSongPageSheet(
        context: context,
        song: songs[index],
      );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => handleOnBodyTap(index),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: <Widget>[
                HomeBodyFrame(artwork: songs[index].artwork),
                const SizedBox(width: 16),
                HomeBodyDetails(
                  title: songs[index].title,
                  artist: songs[index].artist,
                ),
                HomeBodyControls(index: index),
              ],
            ),
          ),
        );
      },
    );
  }
}

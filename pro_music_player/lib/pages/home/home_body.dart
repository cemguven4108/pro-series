import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({
    super.key,
    required this.songs,
  });

  final List<MusicModel> songs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(audioPlayerProvider.select(
      (value) => value.isPlaying,
    ));
    final currentIndex = ref.watch(audioPlayerProvider.select(
      (value) => value.currentIndex,
    ));

    void handleOnTap(int index) {
      ref.read(audioPlayerProvider.notifier).togglePlay(
            index: index,
          );
    }

    return ListView.builder(
      itemCount: songs.length,
      itemExtent: 80,
      itemBuilder: (context, index) {
        final song = songs[index];

        return Card(
          color: Colors.grey,
          child: ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist),
            onTap: () => handleOnTap(index),
            trailing: IconButton(
              icon: isPlaying && currentIndex == index
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              onPressed: () => handleOnTap(index),
            ),
          ),
        );
      },
    );
  }
}

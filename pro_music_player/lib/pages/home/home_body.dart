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
    return ListView.builder(
      itemCount: songs.length,
      itemExtent: 80,
      itemBuilder: (context, index) {
        final song = songs[index];

        return Card(
          child: ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist),
            onTap: () {
              ref.read(audioPlayerProvider.notifier).play(
                    index: index,
                  );
            },
            trailing: Consumer(
              builder: (_, ref, ___) {
                final state = ref.watch(audioPlayerProvider);

                return IconButton(
                  icon: state.isPlaying && state.currentIndex == index
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                  onPressed: () async {
                    ref.read(audioPlayerProvider.notifier).togglePlay(
                          index: index,
                        );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

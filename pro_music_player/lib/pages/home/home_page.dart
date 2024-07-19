import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/pages/home/home_body.dart';
import 'package:pro_music_player/pages/home/home_footer.dart';
import 'package:pro_music_player/pages/home/home_progress_bar.dart';
import 'package:pro_music_player/providers/songs_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsyncValue = ref.watch(songsProvider);

    print("HomePage Building");

    return Scaffold(
      backgroundColor: Colors.black,
      body: songsAsyncValue.when(
        data: (songs) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              HomeBody(
                songs: songs,
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: kBottomNavigationBarHeight,
                child: HomeProgressBar(),
              ),
              const HomeFooter(),
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

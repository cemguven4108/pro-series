import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_mini_player/home_mini_player_carousel/home_mini_player_carousel.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_mini_player/home_mini_player_controls.dart';
import 'package:pro_music_player/presentation/state/riverpod/audio_player/audio_player_provider.dart';

class HomeMiniPlayer extends ConsumerWidget {
  const HomeMiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInitialized = ref.watch(
      audioPlayerProvider.select((state) => state.isInitialized),
    );

    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      child: isInitialized
          ? Container(
              height: 60,
              color: const Color.fromARGB(255, 50, 50, 50),
              child: const Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  HomeMiniPlayerCarousel(),
                  HomeMiniPlayerControls(),
                ],
              ),
            )
          : const SizedBox(
              width: double.infinity,
              height: double.minPositive,
            ),
    );
  }
}

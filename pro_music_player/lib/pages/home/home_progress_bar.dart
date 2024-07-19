import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/providers/audio_player_provider.dart';
import 'package:pro_music_player/widgets/line_painter.dart';

class HomeProgressBar extends ConsumerWidget {
  const HomeProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(audioPlayerProvider.select(
      (value) => value.position,
    ));
    print("HomeProgressBar Building");

    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: 3,
      child: CustomPaint(
        willChange: true,
        painter: CustomLinePainter(
          position,
        ),
      ),
    );
  }
}

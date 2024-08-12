import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/presentation/state/providers/audio_player_provider/audio_player_provider.dart';
import 'package:pro_music_player/widgets/line_painter.dart';

class CustomProgressBar extends ConsumerWidget {
  const CustomProgressBar({
    super.key,
    this.showIndicator = false,
  });

  final bool showIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(audioPlayerNotifierProvider.select(
      (value) => value.position,
    ));

    return Container(
      color: Colors.grey.shade600,
      width: double.infinity,
      height: 2,
      child: CustomPaint(
        willChange: true,
        painter: CustomLinePainter(
          position,
        ),
      ),
    );
  }
}

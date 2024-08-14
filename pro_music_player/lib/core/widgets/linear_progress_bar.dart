import 'package:flutter/material.dart';
import 'package:pro_music_player/core/widgets/custom_line_painter.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    super.key,
    required this.value,
    this.showIndicator = false,
  });

  final double value;
  final bool showIndicator;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      width: double.infinity,
      height: 2,
      child: CustomPaint(
        willChange: true,
        painter: CustomLinePainter(
          value,
        ),
      ),
    );
  }
}

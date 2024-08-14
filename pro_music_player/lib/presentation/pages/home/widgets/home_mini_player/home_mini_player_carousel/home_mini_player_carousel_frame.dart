import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:pro_music_player/core/widgets/frame_widget.dart';

class HomeMiniPlayerCarouselFrame extends StatelessWidget {
  const HomeMiniPlayerCarouselFrame({
    super.key,
    this.artwork,
  });

  final Uint8List? artwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7.5,
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: FrameWidget(
        height: 45,
        width: 45,
        borderRadius: BorderRadius.circular(
          2,
        ),
        artwork: artwork,
      ),
    );
  }
}

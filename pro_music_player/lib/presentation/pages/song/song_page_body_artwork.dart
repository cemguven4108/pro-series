import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:pro_music_player/widgets/frame_widget.dart';

class SongPageBodyArtwork extends StatelessWidget {
  const SongPageBodyArtwork({
    super.key,
    this.artwork,
  });

  final Uint8List? artwork;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: FrameWidget(
        artwork: artwork,
      ),
    );
  }
}

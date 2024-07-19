import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ArtworkWidget extends StatelessWidget {
  const ArtworkWidget({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: id,
      type: ArtworkType.AUDIO,
      artworkBorder: BorderRadius.zero,
      artworkFit: BoxFit.cover,
    );
  }
}

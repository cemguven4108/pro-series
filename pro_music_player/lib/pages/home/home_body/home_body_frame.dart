import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeBodyFrame extends StatelessWidget {
  const HomeBodyFrame({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: id,
      artworkBorder: BorderRadius.circular(4),
      type: ArtworkType.AUDIO,
    );
  }
}

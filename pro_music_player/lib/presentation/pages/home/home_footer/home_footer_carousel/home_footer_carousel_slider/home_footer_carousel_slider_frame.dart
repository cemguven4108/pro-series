import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeFooterCarouselSliderFrame extends StatelessWidget {
  const HomeFooterCarouselSliderFrame({
    super.key,
    required this.id,
  });

  final int id;

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
      child: QueryArtworkWidget(
        id: id,
        type: ArtworkType.AUDIO,
        artworkBorder: BorderRadius.circular(2),
        artworkFit: BoxFit.cover,
        artworkHeight: 40,
        artworkWidth: 40,
        nullArtworkWidget: const Icon(
          Icons.photo_size_select_actual_outlined,
          size: 40,
          color: Colors.white70,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeFooterFrame extends StatelessWidget {
  const HomeFooterFrame({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: kBottomNavigationBarHeight + 10,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: QueryArtworkWidget(
          id: id,
          type: ArtworkType.AUDIO,
          artworkBorder: BorderRadius.zero,
          artworkFit: BoxFit.cover,
        ),
      ),
    );
  }
}

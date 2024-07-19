import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pro_music_player/widgets/artwork_widget.dart';

class HomeFooterFrame extends ConsumerWidget {
  const HomeFooterFrame({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("HomeFooterFrame Building");

    return Container(
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
        child: ArtworkWidget(
          id: id,
        ),
      ),
    );
  }
}

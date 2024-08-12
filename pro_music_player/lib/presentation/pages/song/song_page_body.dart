import 'package:flutter/material.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/pages/song/song_page_body_artwork.dart';
import 'package:pro_music_player/widgets/custom_progress_bar.dart';

class SongPageBody extends StatelessWidget {
  const SongPageBody({
    super.key,
    required this.song,
  });

  final MusicModel song;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SongPageBodyArtwork(artwork: song.artwork),
        const SizedBox(height: 10),
        Text(
          song.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          song.artist,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: size.width * 0.8,
          child: const CustomProgressBar(
            showIndicator: true,
          ),
        ),
      ],
    );
  }
}

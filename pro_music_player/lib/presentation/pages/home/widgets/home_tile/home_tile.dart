import 'package:flutter/material.dart';
import 'package:pro_music_player/constants/app_size.dart';
import 'package:pro_music_player/models/music_model.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_tile/home_tile_body.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_tile/home_tile_button.dart';
import 'package:pro_music_player/presentation/pages/home/widgets/home_tile/home_tile_frame.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.song,
    required this.index,
  });

  final MusicModel song;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(AppSize.appSmallPadding),
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(
          AppSize.appLargeBorderRadius,
        ),
      ),
      child: Row(
        children: <Widget>[
          HomeTileFrame(artwork: song.artwork),
          const SizedBox(width: AppSize.appMediumSpacer),
          HomeTileBody(
            title: song.title,
            artist: song.artist,
          ),
          HomeTileButton(
            index: index,
          ),
        ],
      ),
    );
  }
}

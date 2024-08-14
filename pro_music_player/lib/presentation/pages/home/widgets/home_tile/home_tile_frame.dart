import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_music_player/constants/app_size.dart';
import 'package:pro_music_player/core/widgets/frame_widget.dart';

class HomeTileFrame extends StatelessWidget {
  const HomeTileFrame({
    super.key,
    required this.artwork,
  });

  final Uint8List? artwork;

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      height: AppSize.homeTileFrameHeight,
      width: AppSize.homeTileFrameWidth,
      borderRadius: BorderRadius.circular(
        AppSize.appMediumBorderRadius,
      ),
      artwork: artwork,
    );
  }
}

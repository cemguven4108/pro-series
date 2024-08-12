import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';
import 'package:pro_music_player/constants/app_size.dart';
import 'package:pro_music_player/widgets/frame_widget.dart';

class HomeBodyFrame extends StatelessWidget {
  const HomeBodyFrame({
    super.key,
    required this.artwork,
  });

  final Uint8List? artwork;

  @override
  Widget build(BuildContext context) {
    return const FrameWidget(
      height: AppSize.homeTileFrameHeight,
      width: AppSize.homeTileFrameWidth,
      borderRadius: BorderRadius.all(Radius.circular(
        AppSize.appMediumBorderRadius,
      )),
    );
  }
}

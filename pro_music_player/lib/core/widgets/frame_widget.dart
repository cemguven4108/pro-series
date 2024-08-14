import 'package:flutter/foundation.dart' show Uint8List;
import 'package:flutter/material.dart';

class FrameWidget extends StatelessWidget {
  const FrameWidget({
    super.key,
    this.height,
    this.width,
    required this.borderRadius,
    this.margin,
    this.artwork,
  });

  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? margin;
  final Uint8List? artwork;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: _buildGradient(artwork),
        image: _buildArtwork(artwork),
      ),
    );
  }

  DecorationImage? _buildArtwork(Uint8List? artwork) {
    return artwork != null
        ? DecorationImage(
            image: MemoryImage(artwork),
            fit: BoxFit.cover,
          )
        : null;
  }

  Gradient? _buildGradient(Object? obj) {
    return obj == null
        ? const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue,
              Colors.deepPurple,
            ],
          )
        : null;
  }
}

import 'package:flutter/foundation.dart' show immutable;

@immutable
class PreferenceModel {
  final int? lastIndex;
  final double? lastPosition;

  const PreferenceModel({
    this.lastIndex,
    this.lastPosition,
  });
}

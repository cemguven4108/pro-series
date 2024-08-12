import 'package:flutter/foundation.dart' show immutable;
import 'package:pro_web_toon/models/webtoon_model.dart';

@immutable
abstract class WebtoonEvent {
  const WebtoonEvent();
}

class WebtoonEventCreate extends WebtoonEvent {
  final WebtoonModel model;

  const WebtoonEventCreate({required this.model});
}

class WebtoonEventFetchAll extends WebtoonEvent {
  const WebtoonEventFetchAll();
}

import 'package:flutter/foundation.dart' show immutable;
import 'package:pro_web_toon/models/webtoon_model.dart';

@immutable
abstract class WebtoonState {
  const WebtoonState();
}

// Initial Event
class WebtoonStateInitial extends WebtoonState {
  const WebtoonStateInitial();
}

// Loading Event
class WebtoonStateLoading extends WebtoonState {
  const WebtoonStateLoading();
}

// Create Event
class WebtoonStateCreating extends WebtoonState {
  const WebtoonStateCreating();
}

class WebtoonStateCreated extends WebtoonState {
  const WebtoonStateCreated();
}

// Fetch Event
class WebtoonStateFetching extends WebtoonState {
  const WebtoonStateFetching();
}

class WebtoonStateFetched extends WebtoonState {
  final List<WebtoonModel> webtoons;

  const WebtoonStateFetched({required this.webtoons});
}

// Error Event
class WebtoonStateError extends WebtoonState {
  final String message;

  const WebtoonStateError({required this.message});
}

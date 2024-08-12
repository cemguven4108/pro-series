import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_web_toon/service/webtoon_service.dart';
import 'package:pro_web_toon/state/webtoon_event.dart';
import 'package:pro_web_toon/state/webtoon_state.dart';

class WebtoonBloc extends Bloc<WebtoonEvent, WebtoonState> {
  final WebtoonService _webtoonService;

  WebtoonBloc(this._webtoonService) : super(const WebtoonStateInitial()) {
    on<WebtoonEventFetchAll>(_onFetch);
    on<WebtoonEventCreate>((event, state) => _onCreate(event, state));
  }

  Future<void> _onCreate(
    WebtoonEventCreate event,
    Emitter<WebtoonState> emit,
  ) async {
    await _webtoonService.create(event.model);
  }

  Future<void> _onFetch(
    WebtoonEventFetchAll event,
    Emitter<WebtoonState> emit,
  ) async {
    emit(const WebtoonStateFetching());

    final webtoons = await _webtoonService.getWebtoons();

    emit(WebtoonStateFetched(webtoons: webtoons));
  }
}

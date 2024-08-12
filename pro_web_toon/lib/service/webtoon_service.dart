import 'package:pro_web_toon/models/webtoon_model.dart';
import 'package:pro_web_toon/repository/webtoon_repository.dart';

class WebtoonService {
  final WebtoonRepository _webtoonRepository;

  WebtoonService._private(this._webtoonRepository);

  static final _instance = WebtoonService._private(
    WebtoonRepository.instance(),
  );

  factory WebtoonService.instance() => _instance;

  Future<void> create(WebtoonModel model) async {
    await _webtoonRepository.create(model);
  }

  Future<void> update(String docId, Map<String, dynamic> data) async {
    await _webtoonRepository.update(docId, data);
  }

  Future<List<WebtoonModel>> getWebtoons() async {
    final webtoons = await _webtoonRepository.getWebtoons();
    return webtoons.map((webtoon) => webtoon.data()!).toList();
  }
}

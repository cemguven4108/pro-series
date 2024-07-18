import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_web_toon/models/webtoon_model.dart';

class WebtoonRepository {
  final CollectionReference<WebtoonModel> _collection;

  const WebtoonRepository._private(this._collection);

  static final _instance = WebtoonRepository._private(
    FirebaseFirestore.instance
        .collection('webtoons')
        .withConverter<WebtoonModel>(
          fromFirestore: (snapshot, options) =>
              WebtoonModel.fromMap(snapshot.data()!),
          toFirestore: (model, options) {
            return model.toMap();
          },
        ),
  );

  factory WebtoonRepository.instance() {
    return _instance;
  }

  Future<void> create(WebtoonModel model) async {
    await _collection.add(model);
  }

  Future<void> update(String docId, Map<String, dynamic> data) async {
    await _collection.doc(docId).update(data);
  }

  Future<List<DocumentSnapshot<WebtoonModel>>> getWebtoons() async {
    final snapshot = await _collection.get();
    return snapshot.docs;
  }
}

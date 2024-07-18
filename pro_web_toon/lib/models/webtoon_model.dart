
class WebtoonModel {
  final int id;
  final String title;
  final String genre;
  final String description;
  final String cover;
  final String creator;
  final int viewsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int updateDay;
  final String status;

  WebtoonModel({
    required this.id,
    required this.title,
    required this.genre,
    required this.description,
    required this.cover,
    required this.creator,
    required this.viewsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.updateDay,
    required this.status,
  });

  // factory WebtoonModel.fromMap(Map<String, dynamic> map) {
  //   return WebtoonModel(
  //     id: map['id'] as int,
  //     title: map['title'] as String,
  //     genre: map['genre'] as String,
  //     description: map['description'] as String,
  //     cover: map['cover'] as String,
  //     creator: map['creator'] as String,
  //     viewsCount: map['viewsCount'] as int,
  //     createdAt: (map['createdAt'] as Timestamp).toDate(),
  //     updatedAt: (map['updatedAt'] as Timestamp).toDate(),
  //     updateDay: map['updateDay'] as int,
  //     status: map['status'] as String,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   final classMap = _createClassMap();

  //   final Map<String, dynamic> map = {};

  //   for (MapEntry<String, dynamic> entry in classMap.entries) {
  //     if (entry.value != null) {
  //       map[entry.key] = entry.value;
  //     }
  //   }

  //   return map;
  // }

  // Map<String, dynamic> _createClassMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'genre': genre,
  //     'description': description,
  //     'cover': cover,
  //     'creator': creator,
  //     'viewsCount': viewsCount,
  //     'createdAt': Timestamp.fromDate(createdAt),
  //     'updatedAt': Timestamp.fromDate(updatedAt),
  //     'updateDay': updateDay,
  //     'status': status,
  //   };
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_web_toon/models/enums/webtoon_status.dart';
import 'package:pro_web_toon/utils/extensions.dart';

class WebtoonModel {
  final int id;
  final String title;
  final List<String> genres;
  final String description;
  final String cover;
  final String creator;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final int updateDay; // 0: Sunday, 1: Monday, ..., 6: Saturday
  final WebtoonStatus status;

  WebtoonModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.description,
    required this.cover,
    required this.creator,
    required this.publishedAt,
    required this.updatedAt,
    required this.updateDay,
    required this.status,
  });

  factory WebtoonModel.fromMap(Map<dynamic, dynamic> map) {
    return WebtoonModel(
      id: map['id'] as int,
      title: map['title'] as String,
      genres: (map['genres'] as List<dynamic>)
          .map(
            (e) => e.toString().toCapitalized(),
          )
          .toList(),
      description: map['description'] as String,
      cover: map['cover'] as String,
      creator: map['creator'] as String,
      publishedAt: (map['published_at'] as Timestamp).toDate(),
      updatedAt: (map['updated_at'] as Timestamp).toDate(),
      updateDay: map['update_day'] as int,
      status: WebtoonStatus.values.firstWhere(
        (element) => element.toString() == map['status'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'genres': genres,
      'description': description,
      'cover': cover,
      'creator': creator,
      'published_at': Timestamp.fromDate(publishedAt),
      'updated_at': Timestamp.fromDate(updatedAt),
      'update_day': updateDay,
      'status': status.toString(),
    };
  }
}

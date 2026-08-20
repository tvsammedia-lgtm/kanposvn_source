class KanjiModel {
  final int id;
  final String kanji;
  final String reading;
  final String? hanviet;
  final int level;

  KanjiModel({
    required this.id,
    required this.kanji,
    required this.reading,
    this.hanviet,
    required this.level,
  });

  factory KanjiModel.fromJson(Map<String, dynamic> json) {
    return KanjiModel(
      id: json['id'] as int,
      kanji: json['kanji'] as String,
      reading: json['reading'] as String,
      hanviet: json['hanviet'] as String?,
      level: json['level'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kanji': kanji,
      'reading': reading,
      'hanviet': hanviet,
      'level': level,
    };
  }
}
class KanjiEntry {
  final String character;
  final String hanViet;
  final String meaning;
  final List<String> readings;
  final bool needsReview;

  const KanjiEntry({
    required this.character,
    required this.hanViet,
    required this.meaning,
    required this.readings,
    required this.needsReview,
  });

  factory KanjiEntry.fromJson(Map<String, dynamic> json) => KanjiEntry(
        character: json['character'] as String? ?? '',
        hanViet: json['hanViet'] as String? ?? '',
        meaning: json['meaning'] as String? ?? '',
        readings: (json['readings'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        needsReview: json['needsReview'] as bool? ?? false,
      );

  String get readingsText => readings.join(', ');
}

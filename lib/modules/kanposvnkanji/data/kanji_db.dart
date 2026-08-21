import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'kanji_model.dart';

/// Trạng thái SRS của 1 chữ Kanji (spec §22-§24).
class KanjiSrs {
  final String character;
  final int memoryLevel; // 0..5
  final int correctCount;
  final int wrongCount;
  final DateTime? lastReviewedAt;
  final DateTime? nextReviewAt;

  const KanjiSrs({
    required this.character,
    this.memoryLevel = 0,
    this.correctCount = 0,
    this.wrongCount = 0,
    this.lastReviewedAt,
    this.nextReviewAt,
  });

  double get accuracy =>
      correctCount + wrongCount == 0 ? 0 : correctCount / (correctCount + wrongCount);

  bool get isLearned => memoryLevel > 0 || correctCount + wrongCount > 0;

  bool get mastered => memoryLevel >= 4 && accuracy >= 0.8;

  bool get isDue {
    final n = nextReviewAt;
    return isLearned && (n == null || !n.isAfter(DateTime.now()));
  }

  /// masteryScore theo spec §24 (rút gọn các thành phần khả dụng).
  int get masteryScore {
    final acc = accuracy * 40;
    final lvl = (memoryLevel / 5) * 25;
    final streakPart = (correctCount / (correctCount + 5)) * 15;
    return ((acc + lvl + streakPart).clamp(0, 100)).round();
  }

  KanjiSrs copyWith({
    int? memoryLevel,
    int? correctCount,
    int? wrongCount,
    DateTime? lastReviewedAt,
    DateTime? nextReviewAt,
  }) =>
      KanjiSrs(
        character: character,
        memoryLevel: memoryLevel ?? this.memoryLevel,
        correctCount: correctCount ?? this.correctCount,
        wrongCount: wrongCount ?? this.wrongCount,
        lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
        nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      );

  Map<String, dynamic> toJson() => {
        'level': memoryLevel,
        'c': correctCount,
        'w': wrongCount,
        'last': lastReviewedAt?.millisecondsSinceEpoch,
        'next': nextReviewAt?.millisecondsSinceEpoch,
      };

  factory KanjiSrs.fromJson(String character, Map<String, dynamic> j) => KanjiSrs(
        character: character,
        memoryLevel: j['level'] as int? ?? 0,
        correctCount: j['c'] as int? ?? 0,
        wrongCount: j['w'] as int? ?? 0,
        lastReviewedAt: j['last'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(j['last'] as int),
        nextReviewAt: j['next'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(j['next'] as int),
      );
}

class KanjiDailyStats {
  final DateTime day;
  int newLearned;
  int reviewed;
  int quizCorrect;
  int quizWrong;
  int gamePlays;
  KanjiDailyStats({
    required this.day,
    this.newLearned = 0,
    this.reviewed = 0,
    this.quizCorrect = 0,
    this.quizWrong = 0,
    this.gamePlays = 0,
  });

  Map<String, dynamic> toJson() => {
        'd': day.toIso8601String().substring(0, 10),
        'n': newLearned,
        'r': reviewed,
        'qc': quizCorrect,
        'qw': quizWrong,
        'g': gamePlays,
      };

  factory KanjiDailyStats.fromJson(Map<String, dynamic> j) => KanjiDailyStats(
        day: DateTime.parse('${j['d']}T00:00:00'),
        newLearned: j['n'] as int? ?? 0,
        reviewed: j['r'] as int? ?? 0,
        quizCorrect: j['qc'] as int? ?? 0,
        quizWrong: j['qw'] as int? ?? 0,
        gamePlays: j['g'] as int? ?? 0,
      );
}

class KanjiStore {
  static const _srsKey = 'kanji_srs_v2';
  static const _dailyKey = 'kanji_daily_v2';
  static const _xpKey = 'kanji_xp_v2';

  static Future<List<KanjiEntry>> getKanji() async {
    final jsonString =
        await rootBundle.loadString('assets/kanji_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => KanjiEntry.fromJson(e)).toList();
  }

  static Future<Map<String, KanjiSrs>> loadSrs() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_srsKey);
    if (raw == null) return {};
    final map = json.decode(raw) as Map<String, dynamic>;
    return map.map((k, v) => MapEntry(k, KanjiSrs.fromJson(k, v)));
  }

  static Future<void> saveSrs(Map<String, KanjiSrs> srs) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _srsKey, json.encode(srs.map((k, v) => MapEntry(k, v.toJson()))));
  }

  static Future<Map<String, KanjiDailyStats>> loadDaily() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_dailyKey);
    if (raw == null) return {};
    final list = json.decode(raw) as List<dynamic>;
    return {
      for (final e in list)
        (e as Map<String, dynamic>)['d'] as String: KanjiDailyStats.fromJson(e)
    };
  }

  static Future<void> saveDaily(Map<String, KanjiDailyStats> daily) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _dailyKey, json.encode(daily.values.map((e) => e.toJson()).toList()));
  }

  static Future<int> loadXp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_xpKey) ?? 0;
  }

  static Future<void> saveXp(int xp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_xpKey, xp);
  }

  static Future<void> resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_srsKey);
    await prefs.remove(_dailyKey);
    await prefs.remove(_xpKey);
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EngpicWord {
  final int id;
  final String english;
  final String vietnamese;
  final String? image;
  final String category;
  final String level;

  EngpicWord({
    required this.id,
    required this.english,
    required this.vietnamese,
    this.image,
    required this.category,
    required this.level,
  });

  factory EngpicWord.fromJson(Map<String, dynamic> json) => EngpicWord(
        id: json['id'] as int,
        english: json['english'] as String,
        vietnamese: json['vietnamese'] as String,
        image: json['image'] as String?,
        category: json['category'] as String? ?? 'Other',
        level: json['level'] as String? ?? 'beginner',
      );
}

class EngpicProgress {
  final Set<int> learnedIds;
  final Set<int> favoriteIds;
  final Map<int, int> correctCount;
  final Map<int, int> wrongCount;
  final int quizCount;
  final int quizTotalScore;
  final int quizTotalCorrect;
  final int quizTotalQuestions;

  EngpicProgress({
    required this.learnedIds,
    required this.favoriteIds,
    required this.correctCount,
    required this.wrongCount,
    required this.quizCount,
    required this.quizTotalScore,
    required this.quizTotalCorrect,
    required this.quizTotalQuestions,
  });

  double accuracyFor(int wordId) {
    final c = correctCount[wordId] ?? 0;
    final w = wrongCount[wordId] ?? 0;
    if (c + w == 0) return 0;
    return c / (c + w);
  }

  double masteryFor(int wordId) {
    final c = correctCount[wordId] ?? 0;
    return (c * 25.0).clamp(0, 100);
  }
}

class EngpicDb {
  static const _prefsKey = 'engpic_progress_v1';

  static Future<List<EngpicWord>> getWords() async {
    final jsonString = await rootBundle.loadString('assets/engpic/engpic_words.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((e) => EngpicWord.fromJson(e)).toList();
  }

  static Future<EngpicProgress> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == null) {
      return EngpicProgress(
        learnedIds: {}, favoriteIds: {}, correctCount: {}, wrongCount: {},
        quizCount: 0, quizTotalScore: 0, quizTotalCorrect: 0, quizTotalQuestions: 0,
      );
    }
    final map = json.decode(raw) as Map<String, dynamic>;
    return EngpicProgress(
      learnedIds: Set<int>.from((map['learned'] as List? ?? []).map((e) => e as int)),
      favoriteIds: Set<int>.from((map['favorites'] as List? ?? []).map((e) => e as int)),
      correctCount: Map<int, int>.from((map['correct'] as Map? ?? {}).map((k, v) => MapEntry(int.parse(k), v as int))),
      wrongCount: Map<int, int>.from((map['wrong'] as Map? ?? {}).map((k, v) => MapEntry(int.parse(k), v as int))),
      quizCount: map['quizCount'] as int? ?? 0,
      quizTotalScore: map['quizTotalScore'] as int? ?? 0,
      quizTotalCorrect: map['quizTotalCorrect'] as int? ?? 0,
      quizTotalQuestions: map['quizTotalQuestions'] as int? ?? 0,
    );
  }

  static Future<void> saveProgress(EngpicProgress p) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, json.encode({
      'learned': p.learnedIds.toList(),
      'favorites': p.favoriteIds.toList(),
      'correct': p.correctCount.map((k, v) => MapEntry(k.toString(), v)),
      'wrong': p.wrongCount.map((k, v) => MapEntry(k.toString(), v)),
      'quizCount': p.quizCount,
      'quizTotalScore': p.quizTotalScore,
      'quizTotalCorrect': p.quizTotalCorrect,
      'quizTotalQuestions': p.quizTotalQuestions,
    }));
  }
}

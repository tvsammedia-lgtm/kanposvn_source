import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/kanji_db.dart';
import '../data/kanji_model.dart';

/// Lịch ôn theo spec §22 (phút).
const _intervalMinutes = [0, 10, 60 * 24, 60 * 24 * 3, 60 * 24 * 7, 60 * 24 * 14];

class KanjiProgressState {
  final Map<String, KanjiSrs> srs;
  final Map<String, KanjiDailyStats> daily;
  final int xp;

  const KanjiProgressState({this.srs = const {}, this.daily = const {}, this.xp = 0});

  KanjiSrs srsOf(String character) =>
      srs[character] ?? KanjiSrs(character: character);

  KanjiDailyStats today() {
    final key = DateTime.now().toIso8601String().substring(0, 10);
    return daily[key] ??
        KanjiDailyStats(day: DateTime.now());
  }

  int get learnedCount => srs.values.where((s) => s.isLearned).length;
  int get masteredCount => srs.values.where((s) => s.mastered).length;
  int get dueCount => srs.values.where((s) => s.isDue).length;

  /// Chữ yếu: đã học nhưng accuracy < 70%.
  List<String> weakCharacters() => srs.entries
      .where((e) =>
          e.value.isLearned &&
          !e.value.mastered &&
          e.value.accuracy < 0.7 &&
          e.value.correctCount + e.value.wrongCount >= 2)
      .map((e) => e.key)
      .toList();

  int get streakDays {
    var streak = 0;
    var day = DateTime.now();
    for (var i = 0; i < 365; i++) {
      final key = day.toIso8601String().substring(0, 10);
      final s = daily[key];
      final active = s != null &&
          (s.newLearned > 0 || s.reviewed > 0 || s.quizCorrect + s.quizWrong > 0);
      if (active) {
        streak++;
      } else if (i > 0) {
        break;
      }
      day = day.subtract(const Duration(days: 1));
    }
    return streak;
  }
}

class KanjiProgressNotifier extends StateNotifier<KanjiProgressState> {
  KanjiProgressNotifier() : super(const KanjiProgressState()) {
    _load();
  }

  Future<void> _load() async {
    final srs = await KanjiStore.loadSrs();
    final daily = await KanjiStore.loadDaily();
    final xp = await KanjiStore.loadXp();
    state = KanjiProgressState(srs: srs, daily: daily, xp: xp);
  }

  void _bumpToday(void Function(KanjiDailyStats t) fn) {
    final key = DateTime.now().toIso8601String().substring(0, 10);
    final t = state.today();
    fn(t);
    final daily = {...state.daily};
    daily[key] = t;
    state = KanjiProgressState(srs: state.srs, daily: daily, xp: state.xp);
    KanjiStore.saveDaily(daily);
  }

  /// Ghi nhận kết quả học/ôn/quiz 1 chữ. Trả về level mới.
  int recordAnswer(String character, {required bool correct}) {
    final cur = state.srsOf(character);
    final wasLearned = cur.isLearned;
    var level = cur.memoryLevel;
    if (correct) {
      level = (level + 1).clamp(0, 5);
    } else {
      level = (level - 1).clamp(0, 5);
    }
    final next = DateTime.now().add(Duration(minutes: _intervalMinutes[level]));
    final updated = cur.copyWith(
      memoryLevel: level,
      correctCount: correct ? cur.correctCount + 1 : cur.correctCount,
      wrongCount: correct ? cur.wrongCount : cur.wrongCount + 1,
      lastReviewedAt: DateTime.now(),
      nextReviewAt: next,
    );
    final srs = {...state.srs};
    srs[character] = updated;
    state = KanjiProgressState(srs: srs, daily: state.daily, xp: state.xp + (correct ? 2 : 0));
    KanjiStore.saveSrs(srs);
    KanjiStore.saveXp(state.xp);

    _bumpToday((t) {
      if (!wasLearned && correct) {
        t.newLearned++;
        state = KanjiProgressState(
            srs: state.srs, daily: state.daily, xp: state.xp + 5);
      } else {
        t.reviewed++;
      }
      if (correct) {
        t.quizCorrect++;
      } else {
        t.quizWrong++;
      }
    });
    KanjiStore.saveXp(state.xp);
    return level;
  }

  void recordGamePlay() {
    _bumpToday((t) => t.gamePlays++);
    state = KanjiProgressState(
        srs: state.srs, daily: state.daily, xp: state.xp + 10);
    KanjiStore.saveXp(state.xp);
  }

  Future<void> resetAll() async {
    await KanjiStore.resetAll();
    state = const KanjiProgressState();
  }
}

final kanjiListProvider = FutureProvider<List<KanjiEntry>>((ref) async {
  return KanjiStore.getKanji();
});

final kanjiProgressProvider =
    StateNotifierProvider<KanjiProgressNotifier, KanjiProgressState>((ref) {
  return KanjiProgressNotifier();
});

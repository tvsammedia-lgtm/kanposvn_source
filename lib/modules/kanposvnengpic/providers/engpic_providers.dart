import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/engpic_db.dart';

class EngpicProgressNotifier extends StateNotifier<EngpicProgress?> {
  EngpicProgressNotifier() : super(null) {
    _load();
  }

  Future<void> _load() async {
    state = await EngpicDb.loadProgress();
  }

  Future<void> _update(EngpicProgress Function(EngpicProgress p) fn) async {
    if (state == null) return;
    final next = fn(state!);
    state = next;
    await EngpicDb.saveProgress(next);
  }

  void markLearned(int wordId) =>
      _update((p) => EngpicProgress(
            learnedIds: {...p.learnedIds, wordId},
            favoriteIds: p.favoriteIds,
            correctCount: p.correctCount,
            wrongCount: p.wrongCount,
            quizCount: p.quizCount,
            quizTotalScore: p.quizTotalScore,
            quizTotalCorrect: p.quizTotalCorrect,
            quizTotalQuestions: p.quizTotalQuestions,
          ));

  void toggleFavorite(int wordId) {
    final favs = {...?state?.favoriteIds};
    if (!favs.remove(wordId)) favs.add(wordId);
    _update((p) => EngpicProgress(
          learnedIds: p.learnedIds,
          favoriteIds: favs,
          correctCount: p.correctCount,
          wrongCount: p.wrongCount,
          quizCount: p.quizCount,
          quizTotalScore: p.quizTotalScore,
          quizTotalCorrect: p.quizTotalCorrect,
          quizTotalQuestions: p.quizTotalQuestions,
        ));
  }

  void recordAnswer(int wordId, {required bool correct}) =>
      _update((p) {
        final c = Map<int, int>.from(p.correctCount);
        final w = Map<int, int>.from(p.wrongCount);
        if (correct) {
          c[wordId] = (c[wordId] ?? 0) + 1;
        } else {
          w[wordId] = (w[wordId] ?? 0) + 1;
        }
        return EngpicProgress(
          learnedIds: {...p.learnedIds, wordId},
          favoriteIds: p.favoriteIds,
          correctCount: c,
          wrongCount: w,
          quizCount: p.quizCount,
          quizTotalScore: p.quizTotalScore,
          quizTotalCorrect: p.quizTotalCorrect,
          quizTotalQuestions: p.quizTotalQuestions,
        );
      });

  void recordQuiz({required int score, required int correct, required int total}) =>
      _update((p) => EngpicProgress(
            learnedIds: p.learnedIds,
            favoriteIds: p.favoriteIds,
            correctCount: p.correctCount,
            wrongCount: p.wrongCount,
            quizCount: p.quizCount + 1,
            quizTotalScore: p.quizTotalScore + score,
            quizTotalCorrect: p.quizTotalCorrect + correct,
            quizTotalQuestions: p.quizTotalQuestions + total,
          ));

  void reset() => _update((p) => EngpicProgress(
        learnedIds: {}, favoriteIds: {}, correctCount: {}, wrongCount: {},
        quizCount: 0, quizTotalScore: 0, quizTotalCorrect: 0, quizTotalQuestions: 0,
      ));
}

final engpicWordsProvider = FutureProvider<List<EngpicWord>>((ref) async {
  return EngpicDb.getWords();
});

final engpicProgressProvider =
    StateNotifierProvider<EngpicProgressNotifier, EngpicProgress?>((ref) {
  return EngpicProgressNotifier();
});

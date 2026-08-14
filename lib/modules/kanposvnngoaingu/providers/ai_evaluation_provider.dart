import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/ai_evaluation.dart';
import 'ngoaingu_isar_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/api/ai_service.dart';

final ngoaiNguAIProvider = StateNotifierProvider<NgoaiNguAINotifier, AsyncValue<List<NgoaiNguAIAssessment>>>((ref) {
  final isar = ref.watch(ngoaiNguIsarProvider);
  return NgoaiNguAINotifier(isar);
});

class NgoaiNguAINotifier extends StateNotifier<AsyncValue<List<NgoaiNguAIAssessment>>> {
  final Isar isar;
  final uuid = const Uuid();

  NgoaiNguAINotifier(this.isar) : super(const AsyncValue.loading()) {
    loadEvaluations();
  }

  Future<void> loadEvaluations() async {
    try {
      state = const AsyncValue.loading();
      final evaluations = await isar.ngoaiNguAIAssessments.where().findAll();
      state = AsyncValue.data(evaluations);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addEvaluation(NgoaiNguAIAssessment evaluation) async {
    try {
      if (evaluation.uuid == null || evaluation.uuid!.isEmpty) {
        evaluation.uuid = uuid.v4();
      }
      evaluation.assessedAt = DateTime.now();
      
      await isar.writeTxn(() async {
        await isar.ngoaiNguAIAssessments.put(evaluation);
      });
      await loadEvaluations();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // --- HÀM MỚI TÍCH HỢP AI SERVICE ---
  Future<void> evaluateText(String text) async {
    try {
      // 1. Gọi API
      final result = await AIService.evaluateSpeaking(text);
      
      // 2. Chuyển đổi JSON thành Model
      final evaluation = NgoaiNguAIAssessment()
        ..type = AIEvaluationType.speaking
        ..originalText = text
        ..aiCorrectedText = result['aiCorrectedText']
        ..pronunciationScore = result['pronunciationScore']
        ..grammarScore = result['grammarScore']
        ..vocabularyScore = result['vocabularyScore']
        ..fluencyScore = result['fluencyScore']
        ..overallScore = result['overallScore']
        ..feedback = result['feedback']
        ..weaknesses = result['weaknesses'];
        
      // 3. Lưu vào Database
      await addEvaluation(evaluation);
      
    } catch (e) {
      rethrow;
    }
  }
}

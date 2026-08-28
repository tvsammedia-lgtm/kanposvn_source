import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/device_id.dart';
import '../models/barber_ai_result.dart';
import 'barber_service_provider.dart';

BarberAiResult? _findById(List<BarberAiResult> results, int isarId) {
  for (final r in results) {
    if (r.id == isarId) return r;
  }
  return null;
}

class AiResultNotifier extends StateNotifier<AsyncValue<List<BarberAiResult>>> {
  final Ref ref;

  AiResultNotifier(this.ref) : super(const AsyncValue.loading()) {
    loadAiResults();
  }

  Future<void> loadAiResults() async {
    try {
      state = const AsyncValue.loading();
      final dbService = await ref.read(barberDbServiceProvider.future);
      final results = await dbService.getAiResults();
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Thêm một kết quả AI từ danh sách bytes ảnh.
  /// `resultId` để trống thì tự sinh UUID (trùng sẽ tự replace bản cũ).
  Future<void> addFromBytes({
    required Uint8List bytes,
    required String styleName,
    String? note,
    String? resultId,
  }) async {
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      final result = BarberAiResult()
        ..resultId = resultId ?? const Uuid().v4()
        ..styleName = styleName
        ..note = note
        ..imageBytes = bytes.toList()
        ..isFavorite = false
        ..isActive = true
        ..deviceId = await DeviceId.get()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();
      await dbService.saveAiResult(result);
      await loadAiResults();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Thêm kết quả AI từ một file ảnh trên máy/điện thoại.
  Future<void> addFromFile(String filePath, {String? note}) async {
    final file = await ref.read(barberAiServiceProvider).readImageBytes(filePath);
    if (file == null) return;
    await addFromBytes(bytes: file, styleName: 'Mẫu tóc nhập khẩu', note: note);
  }

  Future<void> toggleFavorite(int isarId) async {
    final current = state.value;
    if (current == null) return;
    final target = _findById(current, isarId);
    if (target == null) return;
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      target
        ..isFavorite = !target.isFavorite
        ..updatedAt = DateTime.now();
      await dbService.saveAiResult(target);
      await loadAiResults();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateNote(int isarId, String? note) async {
    final current = state.value;
    if (current == null) return;
    final target = _findById(current, isarId);
    if (target == null) return;
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      target
        ..note = note
        ..updatedAt = DateTime.now();
      await dbService.saveAiResult(target);
      await loadAiResults();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteAiResult(int isarId) async {
    try {
      final dbService = await ref.read(barberDbServiceProvider.future);
      await dbService.deleteAiResult(isarId);
      await loadAiResults();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final aiResultProvider =
    StateNotifierProvider<AiResultNotifier, AsyncValue<List<BarberAiResult>>>(
        (ref) {
  return AiResultNotifier(ref);
});
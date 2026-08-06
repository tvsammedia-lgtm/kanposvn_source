import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/viec_isar_service.dart';
import '../models/candidate.dart';

final viecIsarServiceProvider = Provider<ViecIsarService>((ref) {
  return ViecIsarService();
});

class ViecCandidatesNotifier extends StateNotifier<List<ViecCandidate>> {
  final ViecIsarService _isar;
  bool _isLoading = false;

  ViecCandidatesNotifier(this._isar) : super([]) {
    loadCandidates();
  }

  Future<void> loadCandidates() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getCandidates();
    _isLoading = false;
  }

  Future<void> saveCandidate(ViecCandidate candidate) async {
    await _isar.saveCandidate(candidate);
    await loadCandidates();
  }
}

final viecCandidatesProvider = StateNotifierProvider<ViecCandidatesNotifier, List<ViecCandidate>>((ref) {
  return ViecCandidatesNotifier(ref.watch(viecIsarServiceProvider));
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project.dart';
import '../services/congtrinh_isar_service.dart';

final congTrinhIsarServiceProvider = Provider<CongTrinhIsarService>((ref) {
  return CongTrinhIsarService();
});

class CongTrinhProjectsNotifier extends StateNotifier<List<CongTrinhProject>> {
  final CongTrinhIsarService _isar;
  bool _isLoading = false;

  CongTrinhProjectsNotifier(this._isar) : super([]) {
    loadProjects();
  }

  Future<void> loadProjects() async {
    if (_isLoading) return;
    _isLoading = true;
    state = await _isar.getProjects();
    _isLoading = false;
  }

  Future<void> saveProject(CongTrinhProject project) async {
    await _isar.saveProject(project);
    await loadProjects();
  }
}

final congTrinhProjectsProvider = StateNotifierProvider<CongTrinhProjectsNotifier, List<CongTrinhProject>>((ref) {
  return CongTrinhProjectsNotifier(ref.watch(congTrinhIsarServiceProvider));
});

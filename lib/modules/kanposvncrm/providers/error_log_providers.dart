import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/error_log.dart';
import '../services/crm_error_log_service.dart';
import 'crm_providers.dart';

final errorLogServiceProvider = Provider<CrmErrorLogService>((ref) {
  return CrmErrorLogService(ref.watch(crmIsarServiceProvider));
});

class ErrorLogsNotifier extends StateNotifier<List<CrmErrorLog>> {
  final CrmErrorLogService _service;
  String? _filterModule;
  String? _filterLevel;

  ErrorLogsNotifier(this._service) : super([]) {
    loadLogs();
  }

  Future<void> loadLogs() async {
    state = await _service.getLogs(
      module: _filterModule,
      level: _filterLevel,
    );
  }

  void setFilter({String? module, String? level}) {
    _filterModule = module;
    _filterLevel = level;
    loadLogs();
  }

  Future<void> deleteLog(int isarId) async {
    await _service.deleteLog(isarId);
    await loadLogs();
  }

  Future<void> clearSynced() async {
    await _service.clearSyncedLogs();
    await loadLogs();
  }

  Future<void> syncAll() async {
    await _service.syncAllUnsynced();
    await loadLogs();
  }
}

final errorLogsProvider = StateNotifierProvider<ErrorLogsNotifier, List<CrmErrorLog>>((ref) {
  return ErrorLogsNotifier(ref.watch(errorLogServiceProvider));
});

final unsyncedErrorCountProvider = FutureProvider<int>((ref) async {
  final service = ref.watch(errorLogServiceProvider);
  return await service.getUnsyncedCount();
});

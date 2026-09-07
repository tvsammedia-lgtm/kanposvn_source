import '../models/sync_task.dart';
import 'order_tq_isar_service.dart';

abstract class SyncService {
  Future<void> pushSyncTasks();
  Future<Map<String, dynamic>> pullUpdates();
  Future<void> syncAll();
}

/// SyncServiceImpl dựa trên OrderTQIsarService thật (không còn dữ liệu mock).
class SyncServiceImpl implements SyncService {
  final OrderTQIsarService _service;

  SyncServiceImpl(this._service);

  Future<List<SyncTask>> getPendingTasks() => _service.getPendingSyncTasks();

  @override
  Future<void> pushSyncTasks() => _service.pushSyncTasks();

  @override
  Future<Map<String, dynamic>> pullUpdates() => _service.pullUpdates();

  @override
  Future<void> syncAll() async {
    await _service.pushSyncTasks();
    await _service.pullUpdates();
  }
}
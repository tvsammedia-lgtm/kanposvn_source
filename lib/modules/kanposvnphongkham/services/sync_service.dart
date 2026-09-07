import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/sync.dart';
import '../providers/phongkham_provider.dart';
import 'phongkham_isar_service.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  final svc = ref.watch(phongKhamServiceProvider);
  return SyncServiceImpl(svc);
});

abstract class SyncService {
  Future<void> pushChanges();
  Future<Map<String, dynamic>> pullChanges(String cursor);
}

class SyncServiceImpl implements SyncService {
  final PhongKhamIsarService _service;

  SyncServiceImpl(this._service);

  Future<List<SyncQueue>> getPendingTasks() => _service.getPendingSync();

  @override
  Future<void> pushChanges() => _service.pushSync();

  @override
  Future<Map<String, dynamic>> pullChanges(String cursor) =>
      _service.pullSync(cursor: cursor);
}
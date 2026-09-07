import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanposvn/modules/kanposvnordertq/models/sync_task.dart';
import '../providers/order_provider.dart';
import '../services/sync_service.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  final svc = ref.watch(orderBucketServiceProvider);
  return SyncServiceImpl(svc);
});

final syncStatusProvider = StateProvider<bool>((ref) => false); // isSyncing true/false

final pendingSyncTasksProvider = FutureProvider<List<SyncTask>>((ref) async {
  final svc = ref.watch(orderBucketServiceProvider);
  return svc.getPendingSyncTasks();
});
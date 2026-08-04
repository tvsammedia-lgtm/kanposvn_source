import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../../core/sync/api_config.dart';
import '../../../../core/sync/snapshot_sync_engine.dart';
import '../../../../core/sync/vercel_api_client.dart';
import '../isar_service.dart';
import '../models/cut_detail.dart';
import '../models/cut_header.dart';
import '../models/thong_so.dart';
import '../models/user.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref.watch(isarProvider));
});

class SyncService {
  final Isar isar;

  SyncService(this.isar);

  Future<SyncResult> syncAll() async {
    final engine = SnapshotSyncEngine(
      apiClient: VercelApiClient(
        pushUrl: ApiConfig.pushUrl,
        pullUrl: ApiConfig.pullUrl,
        apiKey: ApiConfig.syncApiKey,
      ),
      appCode: 'kanposvnqlcd',
      collections: [
        SnapshotSyncCollection(collection: isar.cutHeaders, keyField: 'idGen'),
        SnapshotSyncCollection(collection: isar.cutDetails),
        SnapshotSyncCollection(collection: isar.thongSos),
        SnapshotSyncCollection(collection: isar.users, keyField: 'username'),
      ],
    );

    try {
      final result = await engine.sync();
      return SyncResult(
        success: result.success,
        syncedRecords: result.pushed + result.pulled,
        errors: result.success ? <String>[] : <String>[result.message],
      );
    } catch (e) {
      return SyncResult(
        success: false,
        syncedRecords: 0,
        errors: <String>['Lỗi kết nối: $e'],
      );
    }
  }
}

class SyncResult {
  final bool success;
  final int syncedRecords;
  final List<String> errors;

  SyncResult({
    required this.success,
    required this.syncedRecords,
    required this.errors,
  });
}

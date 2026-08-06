import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../module_enum.dart';
import '../../shared/models/sync_queue_model.dart';
import '../../shared/models/audit_log_model.dart';
import 'isar_models/data_entity.dart';

class DatabaseService extends ChangeNotifier {
  static final DatabaseService instance = DatabaseService._();
  DatabaseService._();

  static const String syncQueueCollection = '__sync_queue__';

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  String _currentAppCode = 'kanposvncafe';
  String get currentAppCode => _currentAppCode;

  String? _currentStoreId;
  String? get currentStoreId => _currentStoreId;

  AppModule? _currentModule;
  AppModule? get currentModule => _currentModule;

  Isar? _isar;

  final Map<String, Map<String, dynamic>> _memory = {};
  final List<SyncQueueItem> _syncQueue = [];
  final List<AuditLogModel> _auditLogs = [];

  List<SyncQueueItem> get syncQueue => List.unmodifiable(_syncQueue);
  List<AuditLogModel> get auditLogs => List.unmodifiable(_auditLogs.reversed);
  int get pendingSyncCount => _syncQueue.where((i) => i.status == 'Pending').length;

  static Isar? _staticIsar;

  static Future<Isar> openIsar() async {
    if (_staticIsar != null && _staticIsar!.isOpen) return _staticIsar!;
    final dir = await getApplicationDocumentsDirectory();
    _staticIsar = await Isar.open(
      [DataEntitySchema],
      directory: dir.path,
      name: 'kanposvn_data',
    );
    return _staticIsar!;
  }

  /// Mở database riêng của cửa hàng: `isar_store_<storeId>`.
  static Future<Isar> openStoreIsar(String storeId) async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [DataEntitySchema],
      directory: dir.path,
      name: 'isar_store_$storeId',
    );
  }

  /// Khởi tạo database theo cửa hàng (đăng ký qua Web/Zalo Mini App).
  /// Không cần tạo app mới — mỗi cửa hàng có 1 Isar local riêng.
  ///
  /// Idempotent: nếu cùng storeId + app code đã được khởi tạo thì không
  /// load lại toàn bộ data (tránh chậm khi login lặp lại). Nếu có luồng
  /// khởi tạo đang chạy cùng storeId thì chờ luồng đó thay vì chạy thêm.
  Future<void>? _pendingStoreInit;

  Future<void> initStore({
    required String storeId,
    AppModule module = AppModule.kanposvncafe,
    Isar? isar,
  }) {
    final pending = _pendingStoreInit;
    if (pending != null &&
        _currentStoreId == storeId &&
        _currentAppCode == module.appCode) {
      return pending;
    }
    if (_isInitialized &&
        _currentStoreId == storeId &&
        _currentAppCode == module.appCode &&
        (_isar?.isOpen ?? false)) {
      return Future.value();
    }
    final task = _doInitStore(storeId: storeId, module: module, isar: isar);
    _pendingStoreInit = task;
    return task;
  }

  Future<void> _doInitStore({
    required String storeId,
    required AppModule module,
    Isar? isar,
  }) async {
    try {
      _currentModule = module;
      _currentAppCode = module.appCode;
      _currentStoreId = storeId;
      if (isar != null && isar.isOpen) {
        _isar = isar;
      } else if (_isar == null || !_isar!.isOpen || _currentStoreId != storeId) {
        _isar = await openStoreIsar(storeId);
      }
      _isInitialized = true;
      await _loadFromIsar();
      notifyListeners();
    } finally {
      _pendingStoreInit = null;
    }
  }

  Future<void> init({required AppModule module, Isar? isar}) async {
    _currentModule = module;
    _currentAppCode = module.appCode;
    _currentStoreId = null;
    if (isar != null && isar.isOpen) {
      _isar = isar;
    } else if (_isar == null || !_isar!.isOpen) {
      _isar = await openIsar();
    }
    _isInitialized = true;
    await _loadFromIsar();
    notifyListeners();
  }

  Future<void> _loadFromIsar() async {
    if (_isar == null) return;
    _memory.clear();
    _syncQueue.clear();
    try {
      final entities = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .findAll();
      for (final e in entities) {
        if (e.collection == syncQueueCollection) continue;
        _memory.putIfAbsent(e.collection, () => {});
        _memory[e.collection]![e.itemId] = jsonDecode(e.jsonData);
      }
      final queueEntities = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .collectionEqualTo(syncQueueCollection)
          .findAll();
      for (final e in queueEntities) {
        try {
          final item = SyncQueueItem.fromJson(
              jsonDecode(e.jsonData) as Map<String, dynamic>);
          if (item.status == 'Pending') _syncQueue.add(item);
        } catch (e) {
          // ignore corrupt queue items
        }
      }
      _syncQueue.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    } catch (e) {
      // ignore isar load errors
    }
  }

  Future<void> _saveItemToIsar(String collection, String id, Map<String, dynamic> item) async {
    if (_isar == null) return;
    try {
      final existing = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .collectionEqualTo(collection)
          .itemIdEqualTo(id)
          .findFirst();
      final jsonStr = jsonEncode(item);
      await _isar!.writeTxn(() async {
        if (existing != null) {
          existing.jsonData = jsonStr;
          await _isar!.dataEntitys.put(existing);
        } else {
          final entity = DataEntity()
            ..collection = collection
            ..appCode = _currentAppCode
            ..itemId = id
            ..jsonData = jsonStr;
          await _isar!.dataEntitys.put(entity);
        }
      });
    } catch (e) {
      // ignore isar save errors
    }
  }

  Future<void> _deleteItemFromIsar(String collection, String id) async {
    if (_isar == null) return;
    try {
      final existing = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .collectionEqualTo(collection)
          .itemIdEqualTo(id)
          .findFirst();
      if (existing != null) {
        await _isar!.writeTxn(() async {
          await _isar!.dataEntitys.delete(existing.id);
        });
      }
    } catch (e) {
      // ignore isar delete errors
    }
  }

  List<Map<String, dynamic>> getCollection(String name) {
    final col = _memory[name];
    if (col == null) return [];
    return col.values.cast<Map<String, dynamic>>().toList();
  }

  List<String> get collectionNames => _memory.keys.toList();

  Future<void> clearCollection(String collection) async {
    _memory.remove(collection);
    if (_isar != null) {
      try {
        final entities = await _isar!.dataEntitys
            .where()
            .filter()
            .appCodeEqualTo(_currentAppCode)
            .collectionEqualTo(collection)
            .findAll();
        await _isar!.writeTxn(() async {
          for (final e in entities) {
            await _isar!.dataEntitys.delete(e.id);
          }
        });
      } catch (e) {
        // ignore isar clear collection errors
      }
    }
    notifyListeners();
  }

  Map<String, dynamic>? getById(String collection, String id) {
    return _memory[collection]?[id];
  }

  Future<void> saveItem(String collection, String id, Map<String, dynamic> item, {bool triggerSync = true}) async {
    _memory.putIfAbsent(collection, () => {});
    item['id'] = id;
    item['appCode'] = _currentAppCode;
    if (_currentStoreId != null) item['storeId'] = _currentStoreId;
    item['isSynced'] = false;
    item['updatedAt'] = DateTime.now().toIso8601String();
    _memory[collection]![id] = item;

    if (triggerSync) {
      _addToSyncQueue(collection, 'UPSERT', item);
      addAuditLog('User', 'Lưu $collection', collection, 'ID: $id | App: $_currentAppCode');
    }
    await _saveItemToIsar(collection, id, item);
    notifyListeners();
  }

  Future<void> deleteItem(String collection, String id, {bool triggerSync = true}) async {
    _memory[collection]?.remove(id);
    if (triggerSync) {
      final deleteData = <String, dynamic>{'id': id, 'appCode': _currentAppCode};
      if (_currentStoreId != null) deleteData['storeId'] = _currentStoreId;
      _addToSyncQueue(collection, 'DELETE', deleteData);
      addAuditLog('User', 'Xóa $collection', collection, 'ID: $id | App: $_currentAppCode');
    }
    await _deleteItemFromIsar(collection, id);
    notifyListeners();
  }

  void _addToSyncQueue(String entity, String operation, Map<String, dynamic> data) {
    data['appCode'] = _currentAppCode;
    if (_currentStoreId != null) data['storeId'] = _currentStoreId;
    final item = SyncQueueItem(
      id: 'SYNC-${DateTime.now().millisecondsSinceEpoch}-${_syncQueue.length}',
      entityName: entity,
      operation: operation,
      data: data,
      timestamp: DateTime.now(),
      status: 'Pending',
    );
    _syncQueue.add(item);
    _persistQueueItem(item);
  }

  Future<void> _persistQueueItem(SyncQueueItem item) async {
    if (_isar == null) return;
    try {
      final existing = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .collectionEqualTo(syncQueueCollection)
          .itemIdEqualTo(item.id)
          .findFirst();
      final jsonStr = jsonEncode(item.toJson());
      await _isar!.writeTxn(() async {
        if (existing != null) {
          existing.jsonData = jsonStr;
          await _isar!.dataEntitys.put(existing);
        } else {
          final entity = DataEntity()
            ..collection = syncQueueCollection
            ..appCode = _currentAppCode
            ..itemId = item.id
            ..jsonData = jsonStr;
          await _isar!.dataEntitys.put(entity);
        }
      });
    } catch (e) {
      // ignore isar save errors
    }
  }

  Future<void> _deleteQueueItemsFromIsar(List<String> ids) async {
    if (_isar == null || ids.isEmpty) return;
    try {
      final existing = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .collectionEqualTo(syncQueueCollection)
          .findAll();
      final toDelete = existing
          .where((e) => ids.contains(e.itemId))
          .map((e) => e.id)
          .toList();
      if (toDelete.isNotEmpty) {
        await _isar!.writeTxn(() async {
          for (final id in toDelete) {
            await _isar!.dataEntitys.delete(id);
          }
        });
      }
    } catch (e) {
      // ignore isar delete errors
    }
  }

  void markSyncQueueProcessed(List<String> processedIds) {
    _syncQueue.removeWhere((i) => processedIds.contains(i.id));
    notifyListeners();
    _deleteQueueItemsFromIsar(processedIds);
  }

  void addAuditLog(String user, String action, String module, String details) {
    _auditLogs.add(AuditLogModel(
      id: 'LOG-${DateTime.now().millisecondsSinceEpoch}',
      timestamp: DateTime.now(),
      user: user,
      action: action,
      module: module,
      details: '$details | App: $_currentAppCode',
    ));
  }

  int getItemCount(String collection) {
    return _memory[collection]?.length ?? 0;
  }

  double getTotalAmount(String collection, String amountField) {
    final items = getCollection(collection);
    return items.fold<double>(0, (sum, item) {
      return sum + ((item[amountField] as num?)?.toDouble() ?? 0);
    });
  }
}

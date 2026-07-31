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

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  String _currentAppCode = 'kannhathuoc';
  String get currentAppCode => _currentAppCode;

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

  Future<void> init({required AppModule module, Isar? isar}) async {
    _currentModule = module;
    _currentAppCode = module.appCode;
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
    try {
      final entities = await _isar!.dataEntitys
          .where()
          .filter()
          .appCodeEqualTo(_currentAppCode)
          .findAll();
      for (final e in entities) {
        _memory.putIfAbsent(e.collection, () => {});
        _memory[e.collection]![e.itemId] = jsonDecode(e.jsonData);
      }
    } catch (e) {
      debugPrint("Isar load error: $e");
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
      debugPrint("Isar save item error: $e");
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
      debugPrint("Isar delete item error: $e");
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
        debugPrint("Isar clear collection error: $e");
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
      _addToSyncQueue(collection, 'DELETE', {'id': id, 'appCode': _currentAppCode});
      addAuditLog('User', 'Xóa $collection', collection, 'ID: $id | App: $_currentAppCode');
    }
    await _deleteItemFromIsar(collection, id);
    notifyListeners();
  }

  void _addToSyncQueue(String entity, String operation, Map<String, dynamic> data) {
    data['appCode'] = _currentAppCode;
    _syncQueue.add(SyncQueueItem(
      id: 'SYNC-${DateTime.now().millisecondsSinceEpoch}-${_syncQueue.length}',
      entityName: entity,
      operation: operation,
      data: data,
      timestamp: DateTime.now(),
      status: 'Pending',
    ));
  }

  void markSyncQueueProcessed(List<String> processedIds) {
    _syncQueue.removeWhere((i) => processedIds.contains(i.id));
    notifyListeners();
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

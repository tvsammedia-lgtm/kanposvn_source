import 'dart:convert';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/nongsan_document.dart';

/// Một thao tác ghi document (dùng trong batch — §53 transaction).
class NongSanDocWrite {
  final String collectionName;
  final String id;
  final Map<String, dynamic> data;

  NongSanDocWrite(this.collectionName, this.id, this.data);
}

class NongSanIsarService {
  static const String _dbName = 'kanposvndailynongsan_db';
  static const String _appCode = 'kanposvndailynongsan';

  late Future<Isar> db;

  NongSanIsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.contains(_dbName)) {
      return Isar.getInstance(_dbName)!;
    }
    final dir = await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$_dbName.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync(
              '${dir.path}/${_dbName}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath) {
    return Isar.open(
      [NongSanDocumentSchema],
      inspector: false,
      directory: dirPath,
      name: _dbName,
    );
  }

  /// Lấy toàn bộ document theo collection (vd: 'NongSanSupplier', 'NongSanProduct')
  Future<List<NongSanDocument>> getDocuments(String collectionName) async {
    final isar = await db;
    return await isar.nongSanDocuments
        .filter()
        .appCodeEqualTo(_appCode)
        .collectionNameEqualTo(collectionName)
        .deletedAtIsNull()
        .findAll();
  }

  /// Lấy một document cụ thể theo ID
  Future<NongSanDocument?> getDocumentById(String id) async {
    final isar = await db;
    return await isar.nongSanDocuments
        .filter()
        .appCodeEqualTo(_appCode)
        .docIdEqualTo(id)
        .deletedAtIsNull()
        .findFirst();
  }

  /// Lưu hoặc cập nhật document
  Future<void> saveDocument(String collectionName, String id, Map<String, dynamic> data) async {
    await batchSave([NongSanDocWrite(collectionName, id, data)]);
  }

  /// Ghi nhiều document trong một transaction duy nhất (§53) — nếu một bước
  /// lỗi, toàn bộ rollback.
  Future<void> batchSave(List<NongSanDocWrite> writes) async {
    final isar = await db;
    if (writes.isEmpty) return;

    final existing = await isar.nongSanDocuments.getAllByDocId(writes.map((w) => w.id).toList());
    await isar.writeTxn(() async {
      for (var i = 0; i < writes.length; i++) {
        final w = writes[i];
        final old = existing[i];
        final now = DateTime.now();
        final doc = NongSanDocument()
          ..docId = w.id
          ..appCode = _appCode
          ..collectionName = w.collectionName
          ..jsonData = jsonEncode(w.data)
          ..createdAt = old?.createdAt ?? now
          ..updatedAt = now
          ..syncStatus = 'PENDING';
        await isar.nongSanDocuments.put(doc);
      }
    });
  }

  /// Xóa mềm document
  Future<void> softDeleteDocument(String id) async {
    final isar = await db;
    final doc = await getDocumentById(id);
    if (doc != null) {
      doc.deletedAt = DateTime.now();
      doc.syncStatus = 'PENDING';
      await isar.writeTxn(() async {
        await isar.nongSanDocuments.put(doc);
      });
    }
  }
}
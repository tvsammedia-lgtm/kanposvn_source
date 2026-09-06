import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../models/labor.dart';
import '../models/material.dart';
import '../models/project.dart';
import '../models/supplier.dart';
import 'congtrinh_seed_data.dart';

class CongTrinhIsarService {
  late Future<Isar> db;

  CongTrinhIsarService({Directory? directory, String? instanceName}) {
    db = openDB(directory: directory, instanceName: instanceName);
  }

  Future<Isar> openDB({Directory? directory, String? instanceName}) async {
    final dbName = instanceName ?? 'congtrinh_db';
    if (Isar.instanceNames.contains(dbName)) {
      return Isar.getInstance(dbName)!;
    }
    final dir = directory ?? await getApplicationDocumentsDirectory();
    try {
      return await _open(dir.path, dbName, inspector: directory == null);
    } on IsarError catch (e) {
      if (e.message.toLowerCase().contains('schema')) {
        final oldDir = Directory('${dir.path}/$dbName.isar');
        if (oldDir.existsSync()) {
          oldDir.renameSync(
              '${dir.path}/${dbName}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
        }
        return await _open(dir.path, dbName, inspector: directory == null);
      }
      rethrow;
    }
  }

  Future<Isar> _open(String dirPath, String dbName, {required bool inspector}) {
    return Isar.open(
      [
        CongTrinhProjectSchema,
        CongTrinhEstimateSchema,
        CongTrinhEstimateItemSchema,
        CongTrinhMaterialSchema,
        CongTrinhMaterialCategorySchema,
        CongTrinhMaterialNormSchema,
        CongTrinhMaterialPriceSchema,
        CongTrinhLaborTypeSchema,
        CongTrinhLaborNormSchema,
        CongTrinhSupplierSchema,
      ],
      inspector: inspector,
      directory: dirPath,
      name: dbName,
    );
  }

  // ================= SEED =================
  Future<void> ensureSeeded() async {
    await CongTrinhSeedData.seedIfEmpty(this);
  }

  Future<void> resetAndSeed() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
    await CongTrinhSeedData.seedSampleData(this, force: true);
  }

  // ================= PROJECT =================
  Future<List<CongTrinhProject>> getProjects() async {
    final isar = await db;
    return await isar.congTrinhProjects
        .filter()
        .deletedAtIsNull()
        .sortByProjectCode()
        .findAll();
  }

  Future<CongTrinhProject?> getProjectById(String projectId) async {
    final isar = await db;
    return await isar.congTrinhProjects
        .filter()
        .projectIdEqualTo(projectId)
        .deletedAtIsNull()
        .findFirst();
  }

  Future<void> saveProject(CongTrinhProject project) async {
    final isar = await db;
    project.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhProjects.put(project);
    });
  }

  Future<void> softDeleteProject(CongTrinhProject project) async {
    final isar = await db;
    project.deletedAt = DateTime.now();
    project.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhProjects.put(project);
    });
  }

  // ================= ESTIMATE =================
  Future<List<CongTrinhEstimate>> getEstimates(String projectId) async {
    final isar = await db;
    return await isar.congTrinhEstimates
        .filter()
        .projectIdEqualTo(projectId)
        .deletedAtIsNull()
        .sortByEstimateVersionDesc()
        .findAll();
  }

  Future<CongTrinhEstimate?> getEstimateById(String estimateId) async {
    final isar = await db;
    return await isar.congTrinhEstimates
        .filter()
        .estimateIdEqualTo(estimateId)
        .deletedAtIsNull()
        .findFirst();
  }

  Future<int> nextEstimateVersion(String projectId) async {
    final estimates = await getEstimates(projectId);
    return estimates.isEmpty ? 1 : estimates.first.estimateVersion + 1;
  }

  Future<List<CongTrinhEstimateItem>> getEstimateItems(String estimateId) async {
    final isar = await db;
    return await isar.congTrinhEstimateItems
        .filter()
        .estimateIdEqualTo(estimateId)
        .deletedAtIsNull()
        .sortByCreatedAt()
        .findAll();
  }

  Future<CongTrinhEstimate> saveEstimate(
      CongTrinhEstimate estimate, List<CongTrinhEstimateItem> items) async {
    final isar = await db;
    estimate.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhEstimates.put(estimate);
      for (final item in items) {
        item.estimateId = estimate.estimateId;
        if (item.estimateItemId.isEmpty) {
          item.estimateItemId = const Uuid().v4();
        }
        item.updatedAt = DateTime.now();
        await isar.congTrinhEstimateItems.put(item);
      }
    });
    return estimate;
  }

  Future<void> saveEstimateItem(CongTrinhEstimateItem item) async {
    final isar = await db;
    item.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhEstimateItems.put(item);
    });
  }

  Future<void> recomputeEstimate(
      CongTrinhEstimate estimate, List<CongTrinhEstimateItem> items) async {
    final isar = await db;
    estimate.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhEstimates.put(estimate);
      for (final item in items) {
        item.updatedAt = DateTime.now();
        await isar.congTrinhEstimateItems.put(item);
      }
    });
  }

  // ================= MATERIAL / CATEGORY =================
  Future<List<CongTrinhMaterialCategory>> getCategories() async {
    final isar = await db;
    return await isar.congTrinhMaterialCategorys
        .filter()
        .deletedAtIsNull()
        .findAll();
  }

  Future<void> saveCategory(CongTrinhMaterialCategory category) async {
    final isar = await db;
    category.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhMaterialCategorys.put(category);
    });
  }

  Future<List<CongTrinhMaterial>> getMaterials() async {
    final isar = await db;
    return await isar.congTrinhMaterials
        .filter()
        .deletedAtIsNull()
        .sortByCode()
        .findAll();
  }

  Future<CongTrinhMaterial?> getMaterialById(String materialId) async {
    final isar = await db;
    return await isar.congTrinhMaterials
        .filter()
        .materialIdEqualTo(materialId)
        .deletedAtIsNull()
        .findFirst();
  }

  Future<void> saveMaterial(CongTrinhMaterial material) async {
    final isar = await db;
    material.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhMaterials.put(material);
    });
  }

  // ================= NORM =================
  Future<List<CongTrinhMaterialNorm>> getMaterialNorms() async {
    final isar = await db;
    return await isar.congTrinhMaterialNorms
        .filter()
        .deletedAtIsNull()
        .findAll();
  }

  Future<List<CongTrinhMaterialNorm>> getNormsByGradeAndFinish(
      String grade, String finishLevel) async {
    final isar = await db;
    return await isar.congTrinhMaterialNorms
        .filter()
        .buildingGradeEqualTo(grade)
        .and()
        .finishLevelEqualTo(finishLevel)
        .and()
        .deletedAtIsNull()
        .findAll();
  }

  Future<void> saveMaterialNorm(CongTrinhMaterialNorm norm) async {
    final isar = await db;
    norm.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhMaterialNorms.put(norm);
    });
  }

  // ================= PRICE =================
  Future<List<CongTrinhMaterialPrice>> getMaterialPrices() async {
    final isar = await db;
    return await isar.congTrinhMaterialPrices
        .filter()
        .deletedAtIsNull()
        .findAll();
  }

  /// Đơn giá hiện hành mới nhất (tính tới [on] nếu có) cho [materialId].
  /// Với bảng giá cũ hơn ngưỡng 30 ngày, caller nên cảnh báo "đơn giá đã cũ".
  Future<CongTrinhMaterialPrice?> getBestMaterialPrice(
    String materialId, {
    DateTime? on,
  }) async {
    final isar = await db;
    final all = await isar.congTrinhMaterialPrices
        .filter()
        .materialIdEqualTo(materialId)
        .deletedAtIsNull()
        .sortByEffectiveDateDesc()
        .findAll();
    for (final p in all) {
      final eff = p.effectiveDate;
      if (on == null || eff == null || !eff.isAfter(on)) return p;
    }
    return null;
  }

  Future<void> saveMaterialPrice(CongTrinhMaterialPrice price) async {
    final isar = await db;
    price.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhMaterialPrices.put(price);
    });
  }

  // ================= LABOR =================
  Future<List<CongTrinhLaborType>> getLaborTypes() async {
    final isar = await db;
    return await isar.congTrinhLaborTypes
        .filter()
        .deletedAtIsNull()
        .findAll();
  }

  Future<void> saveLaborType(CongTrinhLaborType laborType) async {
    final isar = await db;
    laborType.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhLaborTypes.put(laborType);
    });
  }

  Future<List<CongTrinhLaborNorm>> getLaborNorms() async {
    final isar = await db;
    return await isar.congTrinhLaborNorms
        .filter()
        .deletedAtIsNull()
        .findAll();
  }

  Future<CongTrinhLaborNorm?> getLaborNorm(
    String laborTypeId,
    String grade,
    String finishLevel,
  ) async {
    final isar = await db;
    final exact = await isar.congTrinhLaborNorms
        .filter()
        .laborTypeIdEqualTo(laborTypeId)
        .and()
        .buildingGradeEqualTo(grade)
        .and()
        .finishLevelEqualTo(finishLevel)
        .and()
        .deletedAtIsNull()
        .findFirst();
    if (exact != null) return exact;

    final gradeMatch = await isar.congTrinhLaborNorms
        .filter()
        .laborTypeIdEqualTo(laborTypeId)
        .and()
        .buildingGradeEqualTo(grade)
        .and()
        .deletedAtIsNull()
        .findFirst();
    if (gradeMatch != null) return gradeMatch;

    return await isar.congTrinhLaborNorms
        .filter()
        .laborTypeIdEqualTo(laborTypeId)
        .and()
        .deletedAtIsNull()
        .findFirst();
  }

  Future<void> saveLaborNorm(CongTrinhLaborNorm norm) async {
    final isar = await db;
    norm.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhLaborNorms.put(norm);
    });
  }

  // ================= SUPPLIER =================
  Future<List<CongTrinhSupplier>> getSuppliers() async {
    final isar = await db;
    return await isar.congTrinhSuppliers
        .filter()
        .deletedAtIsNull()
        .sortByName()
        .findAll();
  }

  Future<void> saveSupplier(CongTrinhSupplier supplier) async {
    final isar = await db;
    supplier.updatedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.congTrinhSuppliers.put(supplier);
    });
  }
}
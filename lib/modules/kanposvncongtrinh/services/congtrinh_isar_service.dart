import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/project.dart';
import '../models/material.dart';
import '../models/labor.dart';
import '../models/supplier.dart';

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
          oldDir.renameSync('${dir.path}/${dbName}_backup_${DateTime.now().millisecondsSinceEpoch}.isar');
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

  // ================= PROJECT & ESTIMATE =================
  Future<List<CongTrinhProject>> getProjects() async {
    final isar = await db;
    return await isar.congTrinhProjects.where().findAll();
  }

  Future<void> saveProject(CongTrinhProject project) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.congTrinhProjects.put(project);
    });
  }
  
  Future<List<CongTrinhEstimate>> getEstimates(String projectId) async {
    final isar = await db;
    final project = await isar.congTrinhProjects.filter().projectIdEqualTo(projectId).findFirst();
    if (project == null) return [];
    
    return await isar.congTrinhEstimates.filter().project((q) => q.idEqualTo(project.id)).findAll();
  }

  Future<void> saveEstimate(CongTrinhEstimate estimate, List<CongTrinhEstimateItem> items) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.congTrinhEstimates.put(estimate);
      await estimate.project.save();
      
      await isar.congTrinhEstimateItems.putAll(items);
      for(var item in items) {
        item.estimate.value = estimate;
        await item.estimate.save();
      }
    });
  }

  // ================= MATERIALS & NORMS =================
  Future<List<CongTrinhMaterialNorm>> getNormsByGradeAndFinish(String grade, String finishLevel) async {
    final isar = await db;
    return await isar.congTrinhMaterialNorms
      .filter()
      .buildingGradeEqualTo(grade)
      .and()
      .finishLevelEqualTo(finishLevel)
      .findAll();
  }
  
  Future<CongTrinhMaterialPrice?> getMaterialPrice(String materialId) async {
    final isar = await db;
    final material = await isar.congTrinhMaterials.filter().materialIdEqualTo(materialId).findFirst();
    if (material == null) return null;
    
    return await isar.congTrinhMaterialPrices.filter()
        .material((q) => q.idEqualTo(material.id))
        .sortByEffectiveDateDesc()
        .findFirst();
  }
  
  // Seed data function can be added here if needed
}

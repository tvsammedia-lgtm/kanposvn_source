import 'dart:ffi' show Abi;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/models/labor.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/models/material.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/models/project.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/models/supplier.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/services/congtrinh_engine.dart';
import 'package:kanposvn/modules/kanposvncongtrinh/services/congtrinh_isar_service.dart';

/// Kiểm thử toàn bộ chức năng module Công Trình & Dự Toán
/// dựa trên bộ dữ liệu mẫu CongTrinhSeedData và đặc tả
/// DuToan_XayDung_Nha_Dan_Dung_Flutter_Isar_Neon_Vercel.md.
void main() {
  late Directory tempDir;
  late CongTrinhIsarService service;
  late Isar db;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final dll = File(
        'C:/Users/Administrator/AppData/Local/Pub/Cache/hosted/pub.dev/isar_flutter_libs-3.1.0+1/windows/isar.dll');
    if (dll.existsSync()) {
      await Isar.initializeIsarCore(libraries: {Abi.windowsX64: dll.path});
    } else {
      await Isar.initializeIsarCore(download: true);
    }
    tempDir = await Directory.systemTemp.createTemp('congtrinh_test');
    service = CongTrinhIsarService(
        directory: tempDir, instanceName: 'congtrinh_test_db');
    db = await service.db;
  });

  tearDownAll(() async {
    try {
      await db.close(deleteFromDisk: true);
    } catch (_) {}
    try {
      await tempDir.delete(recursive: true);
    } catch (_) {}
  });

  test('1) Seed nạp đủ dữ liệu mẫu (danh mục, định mức, đơn giá, nhân công)', () async {
    await service.ensureSeeded();
    expect(await db.congTrinhMaterialCategorys.count(), 6);
    expect(await db.congTrinhMaterials.count(), 22);
    // định mức: 22 vật tư × 4 cấp × 4 mức hoàn thiện
    expect(await db.congTrinhMaterialNorms.count(), 22 * 16);
    // đơn giá: 22 bảng hiện hành + 1 bảng cũ của xi măng
    expect(await db.congTrinhMaterialPrices.count(), 23);
    expect(await db.congTrinhLaborTypes.count(), 6);
    expect(await db.congTrinhLaborNorms.count(), 6 * 16);
    expect(await db.congTrinhSuppliers.count(), 3);
    expect(await db.congTrinhProjects.count(), 2);

    // ensureSeeded là idempotent (lần 2 không nhân đôi)
    await service.ensureSeeded();
    expect(await db.congTrinhMaterials.count(), 22);

    final demo = await service.getProjectById('prj_demo1');
    expect(demo, isNotNull);
    expect(demo!.buildingGrade, 'GRADE_3');
    expect(demo.finishLevel, 'KHA');
  });

  test('2) Đơn giá hiện hành (best price) - ưu tiên bảng giá mới nhất', () async {
    final current = await service.getBestMaterialPrice('mat_cem_pcb30');
    expect(current, isNotNull);
    expect(current!.price, 72000); // bảng giá hôm nay, không phải bảng 60000 cũ

    final none = await service.getBestMaterialPrice('mat_khong_co');
    expect(none, isNull);
  });

  test('3) CRUD công trình + xóa mềm', () async {
    final p = CongTrinhProject()
      ..projectId = 'prj_test_xoa'
      ..projectCode = 'CT-9999'
      ..projectName = 'Công trình test'
      ..constructionArea = 50
      ..numberOfFloors = 1
      ..buildingGrade = 'GRADE_4'
      ..finishLevel = 'CO_BAN';
    await service.saveProject(p);

    expect(await service.getProjectById('prj_test_xoa'), isNotNull);
    expect(
      (await service.getProjects()).any((x) => x.projectId == 'prj_test_xoa'),
      isTrue,
    );

    await service.softDeleteProject(
        (await service.getProjectById('prj_test_xoa'))!);
    expect(await service.getProjectById('prj_test_xoa'), isNull);
    expect(
      (await service.getProjects()).any((x) => x.projectId == 'prj_test_xoa'),
      isFalse,
    );
  });

  test('4) Engine: các hàm tính thuần túy (diện tích, khối lượng, thành tiền)',
      () async {
    // prj_demo1: 100 m2 x 2 tầng = 200; móng 50% = 50; mái 45 (nhập rõ).
    final area = CongTrinhEstimationEngine.totalArea(
      constructionArea: 100,
      numberOfFloors: 2,
      roofArea: 45,
      options: const CongTrinhEngineOptions(),
    );
    expect(area, 295);

    // prj_demo2: 80 m2 x 1 tầng = 80; móng 50% = 40; mái 30.
    final area2 = CongTrinhEstimationEngine.totalArea(
      constructionArea: 80,
      numberOfFloors: 1,
      roofArea: 30,
      options: const CongTrinhEngineOptions(),
    );
    expect(area2, 150);

    final qty = CongTrinhEstimationEngine.calculateMaterialQuantity(
      area: 100,
      norm: 0.1,
      coefficient: 1,
      wastePercent: 5,
    );
    expect(qty, 10.5); // 100 * 0.1 * 1.05

    expect(CongTrinhEstimationEngine.calculateAmount(quantity: 10.5, unitPrice: 230000),
        2415000);
  });

  test('5) Chọn định mức theo cấp + mức hoàn thiện (+ fallback)', () async {
    final norms = await service.getMaterialNorms();
    final engine = CongTrinhEstimationEngine(service);

    final n = engine.resolveMaterialNorm(norms,
        materialId: 'mat_sand_xay',
        grade: 'GRADE_3',
        finishLevel: 'KHA',
        structureType: 'BTCT',
        foundationType: 'MONG_BANG');
    expect(n, isNotNull);
    // cơ sở 0.1 * (GRADE_3 x1.0 * KHA x1.15) = 0.115
    expect(n!.quantityPerM2, closeTo(0.115, 0.0001));

    // Fallback: cấp GRADE_1 (seed có đủ 4 cấp) vẫn trả về định mức.
    final n1 = engine.resolveMaterialNorm(norms,
        materialId: 'mat_sand_xay',
        grade: 'GRADE_1',
        finishLevel: 'KHA');
    expect(n1, isNotNull);
    expect(n1!.quantityPerM2, closeTo(0.1 * 1.25 * 1.15, 0.0001));

    final exact = await service.getNormsByGradeAndFinish('GRADE_3', 'KHA');
    expect(exact.isNotEmpty, isTrue);
    expect(exact.every((x) => x.buildingGrade == 'GRADE_3'), isTrue);
    expect(exact.every((x) => x.finishLevel == 'KHA'), isTrue);
  });

  test('6) Tạo dự toán đầy đủ cho công trình (vật tư + nhân công + tổng hợp)',
      () async {
    final project = (await service.getProjectById('prj_demo1'))!;
    final engine = CongTrinhEstimationEngine(service);

    final generated =
        await engine.generateEstimate(project, options: const CongTrinhEngineOptions());

    final est = generated.estimate;
    final items = generated.items;

    expect(est.estimateVersion, 1);
    expect(est.estimateCode, 'DT-CT-0001-v1');
    expect(est.area, 295);
    expect(est.projectId, 'prj_demo1');

    // 22 vật tư + 6 nhân công, tất cả AUTO.
    final materialItems = items.where((i) => i.materialId != null).toList();
    final laborItems = items.where((i) => i.laborTypeId != null).toList();
    expect(materialItems.length, 22);
    expect(laborItems.length, 6);
    expect(items.every((i) => i.calculationMode == 'AUTO'), isTrue);
    expect(items.any((i) => i.notes == 'Chưa có đơn giá'), isFalse);

    // Cát xây: qty = 295 * 0.115 * 1.05 = 35.62125; giá 230.000
    final sand = materialItems.singleWhere((i) => i.materialId == 'mat_sand_xay');
    expect(sand.quantity, closeTo(35.62125, 0.001));
    expect(sand.unitPrice, 230000);
    expect(sand.amount, closeTo(35.62125 * 230000, 1));
    expect(sand.category, 'A. CÁT');

    // Thợ xây: qty = 295 * 0.9775 = 288.3625; giá 450.000/công
    final laborXay = laborItems.singleWhere((i) => i.laborTypeId == 'labor_xay');
    expect(laborXay.quantity, closeTo(288.3625, 0.001));
    expect(laborXay.unitPrice, 450000);
    expect(laborXay.category, 'G. NHÂN CÔNG XÂY');

    // Tổng hợp: subtotal = vật tư + nhân công; VAT 8%; dự phòng 5%.
    final materialTotal = materialItems.fold<double>(0, (s, i) => s + i.amount);
    final laborTotal = laborItems.fold<double>(0, (s, i) => s + i.amount);
    final subtotal = materialTotal + laborTotal;
    expect(est.totalMaterial, closeTo(materialTotal, 1));
    expect(est.totalLabor, closeTo(laborTotal, 1));
    expect(est.subtotal, closeTo(subtotal, 1));
    expect(est.vat, closeTo(subtotal * 0.08, 1));
    expect(est.contingency, closeTo(subtotal * 0.05, 1));
    expect(est.grandTotal, closeTo(subtotal + est.vat + est.contingency, 1));

    // Chi phí/m²
    expect(est.grandTotal / est.area, greaterThan(0));

    // Đã lưu xuống Isar đúng.
    final savedItems = await service.getEstimateItems(est.estimateId);
    expect(savedItems.length, items.length);
  });

  test('7) Chỉnh sửa thủ công (MANUAL) không bị ghi đè khi refresh', () async {
    final engine = CongTrinhEstimationEngine(service);
    var estimate = (await service.getEstimates('prj_demo1')).first;

    var items = await service.getEstimateItems(estimate.estimateId);
    final sandIdx = items.indexWhere((i) => i.materialId == 'mat_sand_xay');
    expect(sandIdx, greaterThanOrEqualTo(0));

    // Người dùng đổi khối lượng cát → item chuyển MANUAL.
    items[sandIdx]
      ..calculationMode = 'MANUAL'
      ..quantity = 50;

    estimate = engine.recompute(estimate, items);
    await service.recomputeEstimate(estimate, items);

    // Reload: khối lượng MANUAL phải giữ nguyên = 50, amount = 50 * 230000.
    final reloadedItems = await service.getEstimateItems(estimate.estimateId);
    final reloadedSand =
        reloadedItems.singleWhere((i) => i.materialId == 'mat_sand_xay');
    expect(reloadedSand.calculationMode, 'MANUAL');
    expect(reloadedSand.quantity, 50);
    expect(reloadedSand.amount, closeTo(50 * 230000, 1));

    // Các item AUTO giữ nguyên khối lượng đã tính và amount = qty × price.
    final autoItem = reloadedItems.firstWhere((i) => i.calculationMode == 'AUTO');
    expect(autoItem.amount, closeTo(autoItem.quantity * autoItem.unitPrice, 1));

    // Tổng hợp phải khớp với dữ liệu đã lưu.
    final reloadedEstimate = (await service.getEstimates('prj_demo1')).first;
    final materialTotal = reloadedItems
        .where((i) => i.materialId != null)
        .fold<double>(0, (s, i) => s + i.amount);
    final laborTotal = reloadedItems
        .where((i) => i.laborTypeId != null)
        .fold<double>(0, (s, i) => s + i.amount);
    expect(reloadedEstimate.totalMaterial, closeTo(materialTotal, 1));
    expect(reloadedEstimate.totalLabor, closeTo(laborTotal, 1));
    expect(reloadedEstimate.grandTotal,
        closeTo(reloadedEstimate.subtotal +
            reloadedEstimate.vat +
            reloadedEstimate.contingency, 1));
  });

  test('8) Nhiều phiên bản dự toán (DT v1, v2...)', () async {
    final project = (await service.getProjectById('prj_demo1'))!;
    final engine = CongTrinhEstimationEngine(service);

    final v1 = await service.getEstimates('prj_demo1');
    expect(v1.length, 1);
    expect(v1.first.estimateVersion, 1);

    final generated =
        await engine.generateEstimate(project, options: const CongTrinhEngineOptions());
    expect(generated.estimate.estimateVersion, 2);
    expect(generated.estimate.estimateCode, 'DT-CT-0001-v2');

    final versions = await service.getEstimates('prj_demo1');
    expect(versions.length, 2);
    expect(versions.first.estimateVersion, 2); // sort DESC
    expect(versions.first.estimateId, generated.estimate.estimateId);
  });

  test('9) Bộ dữ liệu mẫu && reset dữ liệu', () async {
    expect((await service.getProjects()).length, 2);

    await service.softDeleteProject((await service.getProjectById('prj_demo2'))!);
    expect((await service.getProjects()).length, 1);

    // resetAndSeed: xóa sạch và tạo lại bộ dữ liệu mẫu ban đầu.
    await service.resetAndSeed();
    expect(await db.congTrinhProjects.count(), 2);
    expect(await db.congTrinhMaterials.count(), 22);
    expect((await service.getProjects()).length, 2);
    expect(await service.getProjectById('prj_demo2'), isNotNull);
  });

  test('10) Dự toán công trình nhà cấp 4 (GRADE_4 + CO_BAN) theo chế độ nhanh',
      () async {
    final project = (await service.getProjectById('prj_demo2'))!;
    final engine = CongTrinhEstimationEngine(service);
    final generated = await engine.generateEstimate(project);
    final est = generated.estimate;

    // 80 m2, 1 tầng, móng 50%, mái 30 → 150 m2 quy đổi.
    expect(est.area, 150);
    expect(est.estimateVersion, 1);

    final items = generated.items;
    expect(items.length, 28);
    final sand =
        items.singleWhere((i) => i.materialId == 'mat_sand_xay');
    // 0.1 * (GRADE_4 0.85 * CO_BAN 1.0) = 0.085; *150 *1.05 = 13.3875
    expect(sand.quantity, closeTo(13.3875, 0.001));

    expect(est.vat, closeTo(est.subtotal * 0.08, 1));
    expect(est.contingency, closeTo(est.subtotal * 0.05, 1));
    expect(est.grandTotal, closeTo(est.subtotal + est.vat + est.contingency, 1));
    expect(est.grandTotal, greaterThan(0));
  });

  test('11) Reset về định mức (AUTO) sau khi sửa tay (mục 29-30)', () async {
    final project = (await service.getProjectById('prj_demo1'))!;
    final engine = CongTrinhEstimationEngine(service);

    final gen = await engine.generateEstimate(project);
    final est = gen.estimate;

    final sand =
        gen.items.singleWhere((i) => i.materialId == 'mat_sand_xay');
    sand
      ..calculationMode = 'MANUAL'
      ..quantity = 999;
    await engine.resetItemToNorm(
        item: sand, project: project, area: est.area);
    expect(sand.calculationMode, 'AUTO');
    // 295 x 0.115 x 1.05 = 35.62125 (12.5625 m3 ... )
    expect(sand.quantity, closeTo(35.62125, 0.001));

    final xay = gen.items.singleWhere((i) => i.laborTypeId == 'labor_xay');
    xay
      ..calculationMode = 'MANUAL'
      ..quantity = 1234;
    await engine.resetItemToNorm(
        item: xay, project: project, area: est.area);
    expect(xay.calculationMode, 'AUTO');
    // 295 x 0.9775 = 288.3625 công
    expect(xay.quantity, closeTo(288.3625, 0.001));

    final dien = gen.items.singleWhere((i) => i.laborTypeId == 'labor_dien');
    dien
      ..calculationMode = 'MANUAL'
      ..quantity = 50;
    await engine.resetItemToNorm(
        item: dien, project: project, area: est.area);
    expect(dien.calculationMode, 'AUTO');
    // 0.2 (không nhân hệ số hoàn thiện với thợ điện) => 295 x 0.2 = 59 công
    expect(dien.quantity, closeTo(59.0, 0.001));
  });
}
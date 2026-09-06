import 'package:isar/isar.dart';

import '../models/labor.dart';
import '../models/material.dart';
import '../models/project.dart';
import '../models/supplier.dart';
import 'congtrinh_isar_service.dart';

/// Bộ dữ liệu mẫu cho module Công Trình & Dự Toán (DuToan_XayDung_Nha_Dan_Dung).
///
/// Bao gồm: danh mục vật tư (cát, đá, xi măng, sắt thép, nước, điện), định mức
/// vật tư theo (cấp công trình × mức hoàn thiện), đơn giá vật tư (có bảng giá
/// cũ để kiểm tra logic "đơn giá đã cũ"), loại nhân công + định mức công,
/// nhà cung cấp và 2 công trình mẫu.
///
/// Lưu ý: các định mức trong bộ mẫu chỉ là dữ liệu minh họa/cấu hình được,
/// KHÔNG phải định mức kỹ thuật chính thức (theo đặc tả mục 8).
class CongTrinhSeedData {
  static const List<String> grades = [
    'GRADE_1',
    'GRADE_2',
    'GRADE_3',
    'GRADE_4',
  ];

  static const List<String> finishLevels = [
    'THO',
    'CO_BAN',
    'KHA',
    'CAO_CAP',
  ];

  static Map<String, double> _gradeMultiplier() => {
        'GRADE_1': 1.25,
        'GRADE_2': 1.1,
        'GRADE_3': 1.0,
        'GRADE_4': 0.85,
      };

  static Map<String, double> _finishMultiplier() => {
        'THO': 0.75,
        'CO_BAN': 1.0,
        'KHA': 1.15,
        'CAO_CAP': 1.3,
      };

  static Future<void> seedIfEmpty(CongTrinhIsarService isarService) async {
    final db = await isarService.db;
    if (await db.congTrinhMaterialCategorys.count() > 0) return;
    await seedSampleData(isarService, force: true);
  }

  static Future<void> seedSampleData(
    CongTrinhIsarService isarService, {
    bool force = false,
  }) async {
    final db = await isarService.db;
    if (!force && await db.congTrinhMaterialCategorys.count() > 0) return;

    // ================= 1. DANH MỤC VẬT TƯ =================
    final catSand = CongTrinhMaterialCategory()
      ..categoryId = 'cat_sand'
      ..code = 'MATERIAL_SAND'
      ..name = 'CÁT'
      ..description = 'Cát xây, cát tô, cát bê tông';
    final catStone = CongTrinhMaterialCategory()
      ..categoryId = 'cat_stone'
      ..code = 'MATERIAL_STONE'
      ..name = 'ĐÁ'
      ..description = 'Đá 1x2, đá 4x6';
    final catCement = CongTrinhMaterialCategory()
      ..categoryId = 'cat_cement'
      ..code = 'MATERIAL_CEMENT'
      ..name = 'XI MĂNG'
      ..description = 'Xi măng PCB30, PCB40, xi măng xây tô';
    final catSteel = CongTrinhMaterialCategory()
      ..categoryId = 'cat_steel'
      ..code = 'MATERIAL_STEEL'
      ..name = 'SẮT THÉP'
      ..description = 'Thép các loại';
    final catWater = CongTrinhMaterialCategory()
      ..categoryId = 'cat_water'
      ..code = 'MATERIAL_WATER'
      ..name = 'NƯỚC'
      ..description = 'Ống nước và phụ kiện';
    final catElectric = CongTrinhMaterialCategory()
      ..categoryId = 'cat_electric'
      ..code = 'MATERIAL_ELECTRIC'
      ..name = 'ĐIỆN'
      ..description = 'Dây điện, ống luồn và thiết bị điện';
    final cats = [catSand, catStone, catCement, catSteel, catWater, catElectric];

    await db.writeTxn(() async {
      await db.congTrinhMaterialCategorys.putAll(cats);
    });

    // ================= 2. VẬT TƯ =================
    CongTrinhMaterial mk({
      required String id,
      required String code,
      required String name,
      required CongTrinhMaterialCategory cat,
      required String unit,
    }) =>
        CongTrinhMaterial()
          ..materialId = id
          ..code = code
          ..name = name
          ..defaultUnit = unit
          ..categoryId = cat.categoryId;

    final mats = [
      mk(id: 'mat_sand_xay', code: 'SAND-XAY', name: 'Cát xây', cat: catSand, unit: 'm3'),
      mk(id: 'mat_sand_to', code: 'SAND-TO', name: 'Cát tô', cat: catSand, unit: 'm3'),
      mk(id: 'mat_sand_bt', code: 'SAND-BT', name: 'Cát bê tông', cat: catSand, unit: 'm3'),
      mk(id: 'mat_stone_1x2', code: 'STONE-1x2', name: 'Đá 1x2', cat: catStone, unit: 'm3'),
      mk(id: 'mat_stone_4x6', code: 'STONE-4x6', name: 'Đá 4x6', cat: catStone, unit: 'm3'),
      mk(id: 'mat_cem_pcb30', code: 'CEM-PCB30', name: 'Xi măng PCB30', cat: catCement, unit: 'bao'),
      mk(id: 'mat_cem_pcb40', code: 'CEM-PCB40', name: 'Xi măng PCB40', cat: catCement, unit: 'bao'),
      mk(id: 'mat_cem_to', code: 'CEM-TO', name: 'Xi măng xây tô', cat: catCement, unit: 'bao'),
      mk(id: 'mat_steel_d6', code: 'STEEL-D6', name: 'Thép D6', cat: catSteel, unit: 'kg'),
      mk(id: 'mat_steel_d10', code: 'STEEL-D10', name: 'Thép D10', cat: catSteel, unit: 'kg'),
      mk(id: 'mat_steel_d12', code: 'STEEL-D12', name: 'Thép D12', cat: catSteel, unit: 'kg'),
      mk(id: 'mat_ppr_d20', code: 'PPR-D20', name: 'Ống PPR D20', cat: catWater, unit: 'm'),
      mk(id: 'mat_ppr_d25', code: 'PPR-D25', name: 'Ống PPR D25', cat: catWater, unit: 'm'),
      mk(id: 'mat_pvc_90', code: 'PVC-90', name: 'Ống PVC phi90', cat: catWater, unit: 'm'),
      mk(id: 'mat_fit_van', code: 'FIT-VAN', name: 'Van nước', cat: catWater, unit: 'cai'),
      mk(id: 'mat_fit_co', code: 'FIT-CO', name: 'Co nối', cat: catWater, unit: 'cai'),
      mk(id: 'mat_fit_te', code: 'FIT-TE', name: 'Tê nước', cat: catWater, unit: 'cai'),
      mk(id: 'mat_elec_wire', code: 'ELEC-WIRE', name: 'Dây điện 2.5mm', cat: catElectric, unit: 'm'),
      mk(id: 'mat_elec_conduit', code: 'ELEC-CONDUIT', name: 'Ống luồn dây', cat: catElectric, unit: 'm'),
      mk(id: 'mat_elec_cb', code: 'ELEC-CB', name: 'CB tổng', cat: catElectric, unit: 'cai'),
      mk(id: 'mat_elec_socket', code: 'ELEC-SOCKET', name: 'Ổ cắm', cat: catElectric, unit: 'cai'),
      mk(id: 'mat_elec_switch', code: 'ELEC-SWITCH', name: 'Công tắc', cat: catElectric, unit: 'cai'),
    ];

    await db.writeTxn(() async {
      for (final m in mats) {
        await db.congTrinhMaterials.put(m);
      }
    });

    // ================= 3. ĐỊNH MỨC VẬT TƯ =================
    // (quantityPerM2, wastePercent, unit) theo cấp CO_BAN; engine sẽ áp hệ số
    // theo cấp công trình và mức hoàn thiện.
    final normBase = <String, ({double qty, double waste, String unit})>{
      'mat_sand_xay': (qty: 0.1, waste: 5, unit: 'm3/m2'),
      'mat_sand_to': (qty: 0.06, waste: 5, unit: 'm3/m2'),
      'mat_sand_bt': (qty: 0.25, waste: 5, unit: 'm3/m2'),
      'mat_stone_1x2': (qty: 0.18, waste: 5, unit: 'm3/m2'),
      'mat_stone_4x6': (qty: 0.15, waste: 5, unit: 'm3/m2'),
      'mat_cem_pcb30': (qty: 12, waste: 2, unit: 'kg/m2'),
      'mat_cem_pcb40': (qty: 8, waste: 2, unit: 'kg/m2'),
      'mat_cem_to': (qty: 6, waste: 2, unit: 'kg/m2'),
      'mat_steel_d6': (qty: 3.5, waste: 3, unit: 'kg/m2'),
      'mat_steel_d10': (qty: 5, waste: 3, unit: 'kg/m2'),
      'mat_steel_d12': (qty: 8, waste: 3, unit: 'kg/m2'),
      'mat_ppr_d20': (qty: 0.35, waste: 3, unit: 'm/m2'),
      'mat_ppr_d25': (qty: 0.15, waste: 3, unit: 'm/m2'),
      'mat_pvc_90': (qty: 0.08, waste: 3, unit: 'm/m2'),
      'mat_fit_van': (qty: 0.008, waste: 2, unit: 'cai/m2'),
      'mat_fit_co': (qty: 0.02, waste: 2, unit: 'cai/m2'),
      'mat_fit_te': (qty: 0.02, waste: 2, unit: 'cai/m2'),
      'mat_elec_wire': (qty: 3.5, waste: 3, unit: 'm/m2'),
      'mat_elec_conduit': (qty: 1.2, waste: 3, unit: 'm/m2'),
      'mat_elec_cb': (qty: 0.006, waste: 1, unit: 'cai/m2'),
      'mat_elec_socket': (qty: 0.02, waste: 1, unit: 'cai/m2'),
      'mat_elec_switch': (qty: 0.02, waste: 1, unit: 'cai/m2'),
    };

    final gradeMul = _gradeMultiplier();
    final finishMul = _finishMultiplier();
    final savedMats = await db.congTrinhMaterials.where().findAll();

    final norms = <CongTrinhMaterialNorm>[];
    for (final mat in savedMats) {
      final base = normBase[mat.materialId]!;
      for (final g in grades) {
        for (final f in finishLevels) {
          final coeff = gradeMul[g]! * finishMul[f]!;
          norms.add(CongTrinhMaterialNorm()
            ..normId = 'norm_${mat.materialId}_${g}_$f'
            ..materialId = mat.materialId
            ..code = 'NM-${mat.code}'
            ..name = 'Định mức ${mat.name}'
            ..buildingGrade = g
            ..finishLevel = f
            ..structureType = ''
            ..foundationType = ''
            ..unit = base.unit
            ..quantityPerM2 = base.qty * (g == 'GRADE_3' && f == 'CO_BAN' ? 1 : coeff)
            ..wastePercent = base.waste
            ..coefficient = 1.0
            ..effectiveFrom = DateTime(2026, 1, 1)
            ..notes = 'Định mức mẫu (cấu hình được)');
        }
      }
    }

    await db.writeTxn(() async {
      await db.congTrinhMaterialNorms.putAll(norms);
    });

    // ================= 4. ĐƠN GIÁ VẬT TƯ =================
    final priceMap = <String, double>{
      'mat_sand_xay': 230000,
      'mat_sand_to': 260000,
      'mat_sand_bt': 300000,
      'mat_stone_1x2': 320000,
      'mat_stone_4x6': 280000,
      'mat_cem_pcb30': 72000,
      'mat_cem_pcb40': 78000,
      'mat_cem_to': 65000,
      'mat_steel_d6': 15200,
      'mat_steel_d10': 15200,
      'mat_steel_d12': 15100,
      'mat_ppr_d20': 28000,
      'mat_ppr_d25': 38000,
      'mat_pvc_90': 45000,
      'mat_fit_van': 48000,
      'mat_fit_co': 6500,
      'mat_fit_te': 8000,
      'mat_elec_wire': 13500,
      'mat_elec_conduit': 7000,
      'mat_elec_cb': 120000,
      'mat_elec_socket': 25000,
      'mat_elec_switch': 20000,
    };

    final suppliers =
        await isarService.getSuppliers(); // đảm bảo tồn tại trước khi dùng
    final today = DateTime.now();

    await db.writeTxn(() async {
      for (final mat in savedMats) {
        final price = priceMap[mat.materialId] ?? 1000;
        await db.congTrinhMaterialPrices.put(CongTrinhMaterialPrice()
          ..priceId = 'price_${mat.materialId}'
          ..materialId = mat.materialId
          ..supplierId = suppliers.isEmpty ? '' : suppliers.first.supplierId
          ..province = 'Đồng Nai'
          ..unit = mat.defaultUnit
          ..price = price
          ..vatPercent = 8
          ..transportCost = 0
          ..effectiveDate = today
          ..source = 'SYSTEM'
          ..notes = 'Bảng giá mẫu hôm nay');
      }

      // Bảng giá cũ của xi măng để kiểm tra cảnh báo "đơn giá đã cũ" và
      // logic lấy đơn giá hiện hành (best price).
      await db.congTrinhMaterialPrices.put(CongTrinhMaterialPrice()
        ..priceId = 'price_mat_cem_pcb30_old'
        ..materialId = 'mat_cem_pcb30'
        ..supplierId = ''
        ..unit = 'bao'
        ..price = 60000
        ..vatPercent = 8
        ..effectiveDate = today.subtract(const Duration(days: 60))
        ..source = 'SYSTEM'
        ..notes = 'Bảng giá cũ');
    });

    // ================= 5. NHÀ CUNG CẤP =================
    if (suppliers.isEmpty) {
      final sups = [
        CongTrinhSupplier()
          ..supplierId = 'sup_vlxd_thongdac'
          ..code = 'NCC-01'
          ..name = 'VLXD Nguyễn Phát'
          ..phone = '0912345987'
          ..address = 'Thống Nhất, Đồng Nai'
          ..taxCode = '0311111111'
          ..contactPerson = 'Anh Nguyễn Phát',
        CongTrinhSupplier()
          ..supplierId = 'sup_ximang_thienduc'
          ..code = 'NCC-02'
          ..name = 'Nhà máy Xi măng Thiên Đức'
          ..phone = '02513987654'
          ..address = 'Trảng Bom, Đồng Nai'
          ..taxCode = '0312222222'
          ..contactPerson = 'Chị Lan',
        CongTrinhSupplier()
          ..supplierId = 'sup_diennuoc_tanphong'
          ..code = 'NCC-03'
          ..name = 'Điện nước Tân Phong'
          ..phone = '0938999123'
          ..address = 'Biên Hòa, Đồng Nai'
          ..taxCode = '0313333333'
          ..contactPerson = 'Anh Phong',
      ];
      await db.writeTxn(() async {
        await db.congTrinhSuppliers.putAll(sups);
      });
    }

    // ================= 6. NHÂN CÔNG =================
    final labors = [
      CongTrinhLaborType()
        ..laborTypeId = 'labor_xay'
        ..code = 'THO_XAY'
        ..name = 'Thợ xây'
        ..description = 'Nhân công thợ xây trần, tường, lát nền'
        ..active = true,
      CongTrinhLaborType()
        ..laborTypeId = 'labor_dien'
        ..code = 'THO_DIEN'
        ..name = 'Thợ điện'
        ..description = 'Nhân công đi dây, lắp thiết bị điện'
        ..active = true,
      CongTrinhLaborType()
        ..laborTypeId = 'labor_nuoc'
        ..code = 'THO_NUOC'
        ..name = 'Thợ nước'
        ..description = 'Nhân công đường ống cấp thoát nước'
        ..active = true,
      CongTrinhLaborType()
        ..laborTypeId = 'labor_thep'
        ..code = 'THO_THEP'
        ..name = 'Thợ sắt'
        ..description = 'Nhân công gia công lắp đặt sắt thép'
        ..active = true,
      CongTrinhLaborType()
        ..laborTypeId = 'labor_coppha'
        ..code = 'THO_COPPHA'
        ..name = 'Thợ cốp pha'
        ..description = 'Nhân công ghép cốp pha, đà giáo'
        ..active = true,
      CongTrinhLaborType()
        ..laborTypeId = 'labor_son'
        ..code = 'THO_SON'
        ..name = 'Thợ sơn'
        ..description = 'Nhân công sơn nước, bả ma tít'
        ..active = true,
    ];
    await db.writeTxn(() async {
      await db.congTrinhLaborTypes.putAll(labors);
    });

    // Định mức công: (công/m2, giá/công) theo mức CO_BAN; hệ số theo cấp + hoàn thiện.
    final laborBase = <String, ({double cong, double price})>{
      'labor_xay': (cong: 0.85, price: 450000),
      'labor_dien': (cong: 0.2, price: 500000),
      'labor_nuoc': (cong: 0.15, price: 500000),
      'labor_thep': (cong: 0.12, price: 550000),
      'labor_coppha': (cong: 0.2, price: 400000),
      'labor_son': (cong: 0.25, price: 350000),
    };

    final savedLabors = await db.congTrinhLaborTypes.where().findAll();
    final laborNorms = <CongTrinhLaborNorm>[];
    for (final lab in savedLabors) {
      final base = laborBase[lab.laborTypeId]!;
      for (final g in grades) {
        for (final f in finishLevels) {
          final coeff =
              gradeMul[g]! * (lab.laborTypeId == 'labor_xay' ? finishMul[f]! : 1.0);
          laborNorms.add(CongTrinhLaborNorm()
            ..laborNormId = 'laborNorm_${lab.laborTypeId}_${g}_$f'
            ..laborTypeId = lab.laborTypeId
            ..unit = 'cong/m2'
            ..quantityPerM2 =
                base.cong * (g == 'GRADE_3' && f == 'CO_BAN' ? 1 : coeff)
            ..unitPrice = base.price
            ..buildingGrade = g
            ..finishLevel = f
            ..effectiveFrom = DateTime(2026, 1, 1));
        }
      }
    }
    await db.writeTxn(() async {
      await db.congTrinhLaborNorms.putAll(laborNorms);
    });

    // ================= 7. CÔNG TRÌNH MẪU =================
    final demoProjects = [
      CongTrinhProject()
        ..projectId = 'prj_demo1'
        ..projectCode = 'CT-0001'
        ..projectName = 'Nhà phố cô Lan'
        ..customerName = 'Cô Lan'
        ..customerPhone = '0901111222'
        ..address = 'Quốc lộ 1A'
        ..province = 'Đồng Nai'
        ..district = 'Thống Nhất'
        ..ward = 'Hưng Lộc'
        ..constructionArea = 100
        ..numberOfFloors = 2
        ..buildingGrade = 'GRADE_3'
        ..roofArea = 45
        ..foundationType = 'MONG_BANG'
        ..structureType = 'BTCT'
        ..finishLevel = 'KHA'
        ..startDate = DateTime(2026, 10, 1)
        ..expectedEndDate = DateTime(2027, 6, 30)
        ..notes = 'Công trình mẫu thứ nhất - nhà phố 2 tầng mái bê tông',
      CongTrinhProject()
        ..projectId = 'prj_demo2'
        ..projectCode = 'CT-0002'
        ..projectName = 'Nhà cấp 4 bác Ba'
        ..customerName = 'Bác Ba'
        ..customerPhone = '0903333444'
        ..address = 'Ấp 4'
        ..province = 'Đồng Nai'
        ..district = 'Thống Nhất'
        ..ward = 'Gia Kiệm'
        ..constructionArea = 80
        ..numberOfFloors = 1
        ..buildingGrade = 'GRADE_4'
        ..roofArea = 30
        ..foundationType = 'MONG_DON'
        ..structureType = 'BTCT'
        ..finishLevel = 'CO_BAN'
        ..startDate = DateTime(2026, 12, 1)
        ..expectedEndDate = DateTime(2027, 4, 30)
        ..notes = 'Công trình mẫu thứ hai - nhà cấp 4 một tầng',
    ];
    await db.writeTxn(() async {
      await db.congTrinhProjects.putAll(demoProjects);
    });
  }
}
import 'package:uuid/uuid.dart';

import '../models/material.dart';
import '../models/project.dart';
import '../services/congtrinh_isar_service.dart';

/// Các tùy chọn tính toán (hệ số móng, mái, VAT, dự phòng...).
/// Không đặt công thức trong Widget; mọi phép tính nằm ở engine và có unit test.
class CongTrinhEngineOptions {
  /// Hệ số diện tích móng so với diện tích xây dựng 1 sàn.
  final double foundationCoefficient;

  /// Hệ số diện tích mái so với diện tích xây dựng 1 sàn.
  final double roofCoefficient;

  final double floorCoefficient;
  final double heightCoefficient;
  final double locationCoefficient;
  final double customCoefficient;

  final double vatPercent;
  final double contingencyPercent;

  const CongTrinhEngineOptions({
    this.foundationCoefficient = 0.5,
    this.roofCoefficient = 0.3,
    this.floorCoefficient = 1.0,
    this.heightCoefficient = 1.0,
    this.locationCoefficient = 1.0,
    this.customCoefficient = 1.0,
    this.vatPercent = 8,
    this.contingencyPercent = 5,
  });
}

/// Kết quả tạo dự toán.
class CongTrinhGeneratedEstimate {
  final CongTrinhEstimate estimate;
  final List<CongTrinhEstimateItem> items;

  const CongTrinhGeneratedEstimate(this.estimate, this.items);
}

class CongTrinhEstimationEngine {
  final CongTrinhIsarService _isar;

  CongTrinhEstimationEngine(this._isar);

  // ================= CÁC HÀM TÍNH THUẦN TÚY (dùng cho unit test) ==========
  static double calculateMaterialQuantity({
    required double area,
    required double norm,
    double coefficient = 1,
    double wastePercent = 0,
  }) {
    return area * norm * coefficient * (1 + wastePercent / 100);
  }

  static double calculateAmount({
    required double quantity,
    required double unitPrice,
  }) {
    return quantity * unitPrice;
  }

  static double totalArea({
    required double constructionArea,
    required int numberOfFloors,
    required double roofArea,
    required CongTrinhEngineOptions options,
  }) {
    final floorsArea = constructionArea *
        (numberOfFloors < 1 ? 1 : numberOfFloors) *
        options.floorCoefficient;
    final foundationArea =
        constructionArea * options.foundationCoefficient;
    final roof =
        roofArea > 0 ? roofArea : constructionArea * options.roofCoefficient;
    return floorsArea + foundationArea + roof;
  }

  // ================= ĐỊNH MỨC =================
  /// Chọn định mức phù hợp nhất cho [materialId] theo cấp + hoàn thiện + kết cấu
  /// + móng. Ưu tiên khớp càng nhiều tiêu chí càng tốt, sau đó bản hiệu lực mới nhất.
  CongTrinhMaterialNorm? resolveMaterialNorm(
    Iterable<CongTrinhMaterialNorm> norms, {
    required String materialId,
    required String grade,
    required String finishLevel,
    String? structureType,
    String? foundationType,
    DateTime? on,
  }) {
    CongTrinhMaterialNorm? best;
    var bestScore = -1;
    for (final n in norms) {
      if (n.materialId != materialId) continue;
      if (n.deletedAt != null) continue;
      if (n.quantityPerM2 <= 0) continue;
      final from = n.effectiveFrom;
      final to = n.effectiveTo;
      final ref = on ?? DateTime.now();
      if (from != null && from.isAfter(ref)) continue;
      if (to != null && to.isBefore(ref)) continue;

      var score = 0;
      if (n.buildingGrade == grade) score += 2;
      if (n.finishLevel == finishLevel) score += 2;
      if (structureType != null &&
          (n.structureType.isEmpty || n.structureType == structureType)) {
        score += 1;
      }
      if (foundationType != null &&
          (n.foundationType.isEmpty || n.foundationType == foundationType)) {
        score += 1;
      }
      if (score > bestScore) {
        bestScore = score;
        best = n;
      }
    }
    return best;
  }

  // ================= DIỆN TÍCH =================
  Future<double> computeTotalArea(
    CongTrinhProject project, {
    CongTrinhEngineOptions options = const CongTrinhEngineOptions(),
  }) async {
    return totalArea(
      constructionArea: project.constructionArea,
      numberOfFloors: project.numberOfFloors,
      roofArea: project.roofArea,
      options: options,
    );
  }

  // ================= BÓC TÁCH VẬT TƯ =================
  Future<List<CongTrinhEstimateItem>> resolveMaterialItems(
    CongTrinhProject project,
    double area, {
    CongTrinhEngineOptions options = const CongTrinhEngineOptions(),
  }) async {
    final norms = await _isar.getMaterialNorms();
    final materials = await _isar.getMaterials();
    final categories = await _isar.getCategories();
    final items = <CongTrinhEstimateItem>[];

    final categoryNameOf = <String, String>{
      for (final c in categories)
        if (c.categoryId.isNotEmpty) c.categoryId: c.name,
    };

    for (final material in materials) {
      final resolved = resolveMaterialNorm(
        norms,
        materialId: material.materialId,
        grade: project.buildingGrade,
        finishLevel: project.finishLevel,
        structureType: project.structureType,
        foundationType: project.foundationType,
      );
      if (resolved == null) continue;

      final categoryName =
          categoryNameOf[material.categoryId] ?? 'VẬT TƯ';

      final price = await _isar.getBestMaterialPrice(material.materialId);
      final unitPrice = price?.price ?? 0;

      final coefficient = resolved.coefficient *
          options.floorCoefficient *
          options.heightCoefficient *
          options.locationCoefficient *
          options.customCoefficient;

      final quantity = CongTrinhEstimationEngine.calculateMaterialQuantity(
        area: area,
        norm: resolved.quantityPerM2,
        coefficient: coefficient,
        wastePercent: resolved.wastePercent,
      );
      final amount = CongTrinhEstimationEngine.calculateAmount(
          quantity: quantity, unitPrice: unitPrice);

      items.add(CongTrinhEstimateItem()
        ..estimateItemId = const Uuid().v4()
        ..category = _materialGroupLabel(categoryName)
        ..materialId = material.materialId
        ..laborTypeId = null
        ..description = material.name
        ..quantity = quantity
        ..unit = resolved.unit
        ..unitPrice = unitPrice
        ..wastePercent = resolved.wastePercent
        ..amount = amount
        ..calculationMode = 'AUTO'
        ..notes = price == null ? 'Chưa có đơn giá' : '');
    }
    return items;
  }

  // ================= BÓC TÁCH NHÂN CÔNG =================
  Future<List<CongTrinhEstimateItem>> resolveLaborItems(
    CongTrinhProject project,
    double area, {
    CongTrinhEngineOptions options = const CongTrinhEngineOptions(),
  }) async {
    final laborTypes = await _isar.getLaborTypes();
    final items = <CongTrinhEstimateItem>[];

    for (final lab in laborTypes) {
      if (!lab.active || lab.deletedAt != null) continue;
      final norm = await _isar.getLaborNorm(
        lab.laborTypeId,
        project.buildingGrade,
        project.finishLevel,
      );
      if (norm == null || norm.quantityPerM2 <= 0 || norm.unitPrice <= 0) {
        continue;
      }

      final coefficient = options.floorCoefficient *
          options.heightCoefficient *
          options.locationCoefficient *
          options.customCoefficient;

      final quantity =
          area * norm.quantityPerM2 * coefficient;
      final amount =
          CongTrinhEstimationEngine.calculateAmount(
              quantity: quantity, unitPrice: norm.unitPrice);

      items.add(CongTrinhEstimateItem()
        ..estimateItemId = const Uuid().v4()
        ..category = _laborGroupLabel(lab.code)
        ..materialId = null
        ..laborTypeId = lab.laborTypeId
        ..description = lab.name
        ..quantity = quantity
        ..unit = norm.unit
        ..unitPrice = norm.unitPrice
        ..wastePercent = 0
        ..amount = amount
        ..calculationMode = 'AUTO'
        ..notes = '');
    }
    return items;
  }

  // ================= TỔNG HỢP =================
  double sumBy(double Function(CongTrinhEstimateItem) sel,
      Iterable<CongTrinhEstimateItem> items) {
    var total = 0.0;
    for (final it in items) {
      total += sel(it);
    }
    return total;
  }

  /// Tính lại số tiền & tổng cộng của dự toán khi người dùng sửa khối lượng/đơn giá.
  /// - Item MANUAL: giữ nguyên quantity do người dùng nhập.
  /// - Item AUTO: quantity giữ nguyên (đã được tính khi tạo); số tiền = qty × price.
  /// Khi refresh không được ghi đè quantity MANUAL (theo đặc tả mục 29-30).
  CongTrinhEstimate recompute(
    CongTrinhEstimate estimate,
    List<CongTrinhEstimateItem> items, {
    CongTrinhEngineOptions options = const CongTrinhEngineOptions(),
  }) {
    for (final item in items) {
      item.amount = CongTrinhEstimationEngine.calculateAmount(
          quantity: item.quantity, unitPrice: item.unitPrice);
    }

    double material = 0;
    double labor = 0;
    for (final item in items) {
      if (item.laborTypeId != null && item.materialId == null) {
        labor += item.amount;
      } else {
        material += item.amount;
      }
    }

    estimate
      ..totalMaterial = material
      ..totalLabor = labor
      ..subtotal = material + labor + estimate.totalOther
      ..vat = estimate.subtotal * options.vatPercent / 100
      ..contingency = estimate.subtotal * options.contingencyPercent / 100
      ..grandTotal = estimate.subtotal + estimate.vat + estimate.contingency
      ..updatedAt = DateTime.now();
    return estimate;
  }

  /// Tạo dự toán đầy đủ cho 1 công trình (theo đặc tả: cát, đá, xi măng, thép,
  /// điện, nước + thợ xây, thợ điện, thợ nước → tổng hợp, VAT, dự phòng, chi phí/m2).
  Future<CongTrinhGeneratedEstimate> generateEstimate(
    CongTrinhProject project, {
    CongTrinhEngineOptions options = const CongTrinhEngineOptions(),
  }) async {
    final area = await computeTotalArea(project, options: options);
    final version = await _isar.nextEstimateVersion(project.projectId);

    final estimate = CongTrinhEstimate()
      ..estimateId = const Uuid().v4()
      ..projectId = project.projectId
      ..estimateCode = 'DT-${project.projectCode}-v$version'
      ..estimateVersion = version
      ..area = area
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final materialItems =
        await resolveMaterialItems(project, area, options: options);
    final laborItems =
        await resolveLaborItems(project, area, options: options);
    final items = [...materialItems, ...laborItems];

    estimate.totalOther = 0;
    recompute(estimate, items, options: options);

    await _isar.saveEstimate(estimate, items);
    return CongTrinhGeneratedEstimate(estimate, items);
  }

  // ================= NHÃN NHÓM CHI PHÍ =================
  String _materialGroupLabel(String categoryName) {
    return switch (categoryName.toUpperCase().trim()) {
      'CÁT' => 'A. CÁT',
      'ĐÁ' => 'B. ĐÁ',
      'XI MĂNG' => 'C. XI MĂNG',
      'SẮT THÉP' => 'D. SẮT THÉP',
      'NƯỚC' => 'F. NƯỚC',
      'ĐIỆN' => 'E. ĐIỆN',
      _ => 'VẬT TƯ',
    };
  }

  String _laborGroupLabel(String laborCode) {
    return switch (laborCode) {
      'THO_XAY' => 'G. NHÂN CÔNG XÂY',
      'THO_DIEN' => 'H. NHÂN CÔNG ĐIỆN',
      'THO_NUOC' => 'I. NHÂN CÔNG NƯỚC',
      'THO_THEP' => 'J. NHÂN CÔNG THÉP',
      'THO_COPPHA' => 'K. NHÂN CÔNG CỐP PHA',
      'THO_SON' => 'L. NHÂN CÔNG SƠN',
      _ => 'NHÂN CÔNG KHÁC',
    };
  }
}
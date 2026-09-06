import '../models/project.dart';
import '../models/material.dart';
import '../services/congtrinh_isar_service.dart';

class CongTrinhEstimationEngine {
  final CongTrinhIsarService _isar;
  
  CongTrinhEstimationEngine(this._isar);

  /// Tính toán và tạo dự toán cho một công trình
  Future<CongTrinhEstimate> generateEstimate(CongTrinhProject project) async {
    // 1. Tính tổng diện tích quy đổi
    // (Đơn giản hóa: Diện tích móng + Các sàn + Mái)
    // Thực tế sẽ phức tạp hơn dựa trên hệ số móng, mái...
    double baseArea = project.constructionArea;
    double foundationArea = baseArea * 0.5; // Hệ số móng ví dụ 50%
    double roofArea = project.roofArea > 0 ? project.roofArea : baseArea * 0.3; 
    double totalEquivalentArea = (baseArea * project.numberOfFloors) + foundationArea + roofArea;

    // 2. Tạo đối tượng Estimate
    final estimate = CongTrinhEstimate()
      ..estimateCode = 'DT-${project.projectCode}-${DateTime.now().millisecondsSinceEpoch}'
      ..area = totalEquivalentArea
      ..project.value = project;

    List<CongTrinhEstimateItem> items = [];

    // 3. Lấy định mức dựa trên Cấp công trình và Mức hoàn thiện
    List<CongTrinhMaterialNorm> norms = await _isar.getNormsByGradeAndFinish(
      project.buildingGrade, 
      project.finishLevel
    );

    double totalMaterialCost = 0;

    // 4. Bóc tách vật tư theo định mức
    for (var norm in norms) {
      if (norm.material.value == null) continue;
      
      final material = norm.material.value!;
      
      // Lấy đơn giá vật tư
      final priceRecord = await _isar.getMaterialPrice(material.materialId);
      final double unitPrice = priceRecord?.price ?? 0;
      
      // Tính khối lượng: Tổng diện tích quy đổi * Định mức (kg/m2, m3/m2...)
      double quantity = totalEquivalentArea * norm.quantityPerM2;
      
      // Tính hao hụt
      quantity = quantity * (1 + (norm.wastePercent / 100));
      
      double amount = quantity * unitPrice;
      totalMaterialCost += amount;
      
      // Tạo EstimateItem
      final item = CongTrinhEstimateItem()
        ..category = material.category.value?.name ?? 'VẬT TƯ'
        ..materialId = material.materialId
        ..description = material.name
        ..quantity = quantity
        ..unit = norm.unit
        ..unitPrice = unitPrice
        ..wastePercent = norm.wastePercent
        ..amount = amount
        ..calculationMode = 'AUTO';
        
      items.add(item);
    }
    
    // 5. Cập nhật tổng chi phí vào Estimate
    estimate.totalMaterial = totalMaterialCost;
    // Tương tự cho Nhân công, Chi phí khác...
    estimate.subtotal = totalMaterialCost + estimate.totalLabor + estimate.totalOther;
    estimate.vat = estimate.subtotal * 0.1; // VAT 10% mock
    estimate.grandTotal = estimate.subtotal + estimate.vat + estimate.contingency;

    // 6. Lưu vào Isar
    await _isar.saveEstimate(estimate, items);
    
    return estimate;
  }
}

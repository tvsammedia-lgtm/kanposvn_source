import '../models/tax_declaration.dart';
import 'tax_calculation_engine.dart';

class TaxDeclarationService {
  
  TaxDeclaration generateDraftDeclaration(
    String tenantId,
    String businessId,
    String taxYear,
    String taxPeriod,
    List<TaxCalculationResult> calculationResults
  ) {
    double totalRevenue = 0;
    double totalVat = 0;
    double totalPit = 0;
    
    for (var result in calculationResults) {
      totalRevenue += result.taxableRevenue;
      totalVat += result.vatAmount;
      totalPit += result.pitAmount;
    }
    
    return TaxDeclaration()
      ..tenantId = tenantId
      ..businessId = businessId
      ..taxYear = taxYear
      ..taxPeriod = taxPeriod
      ..status = 'Draft'
      ..revenueAmount = totalRevenue
      ..vatAmount = totalVat
      ..pitAmount = totalPit
      ..totalPayable = totalVat + totalPit
      ..createdAt = DateTime.now();
  }
}

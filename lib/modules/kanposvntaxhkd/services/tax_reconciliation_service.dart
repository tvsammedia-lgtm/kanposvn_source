import '../models/tax_revenue_entry.dart';
import '../models/tax_reconciliation.dart';

class TaxReconciliationService {
  
  TaxReconciliation runReconciliation(List<TaxRevenueEntry> posEntries, double totalBankRevenue, String taxPeriod) {
    double posTotal = posEntries.fold(0.0, (sum, item) => sum + (item.taxableRevenue ?? 0));
    double difference = posTotal - totalBankRevenue;
    
    String status = 'Matched';
    String issueSummary = 'Khớp dữ liệu';
    
    if (difference.abs() > 0) {
      status = 'Difference';
      issueSummary = 'Chênh lệch giữa POS và Ngân hàng: \$difference';
    }
    
    return TaxReconciliation()
      ..taxPeriod = taxPeriod
      ..reconciliationType = 'POS_VS_BANK'
      ..sourceAmount = posTotal
      ..targetAmount = totalBankRevenue
      ..differenceAmount = difference
      ..status = status
      ..issueSummary = issueSummary
      ..createdAt = DateTime.now();
  }
}

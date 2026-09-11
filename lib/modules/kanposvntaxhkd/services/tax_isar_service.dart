import 'package:isar/isar.dart';
import '../models/business_profile.dart';
import '../models/tax_rule.dart';
import '../models/tax_revenue_entry.dart';
import '../models/tax_expense_entry.dart';
import '../models/tax_reconciliation.dart';

class TaxIsarService {
  final Isar isar;

  TaxIsarService(this.isar);

  Future<BusinessProfile?> getBusinessProfile(String tenantId) async {
    return await isar.businessProfiles
        .filter()
        .tenantIdEqualTo(tenantId)
        .findFirst();
  }

  Future<void> saveBusinessProfile(BusinessProfile profile) async {
    await isar.writeTxn(() async {
      await isar.businessProfiles.put(profile);
    });
  }

  Future<List<TaxRule>> getTaxRules(String tenantId, int year) async {
    return await isar.taxRules
        .filter()
        .tenantIdEqualTo(tenantId)
        .and()
        .taxYearEqualTo(year)
        .findAll();
  }

  Future<void> saveTaxRule(TaxRule rule) async {
    await isar.writeTxn(() async {
      await isar.taxRules.put(rule);
    });
  }
  
  Future<void> saveRevenueEntry(TaxRevenueEntry entry) async {
    await isar.writeTxn(() async {
      await isar.taxRevenueEntrys.put(entry);
    });
  }

  Future<void> saveExpenseEntry(TaxExpenseEntry entry) async {
    await isar.writeTxn(() async {
      await isar.taxExpenseEntrys.put(entry);
    });
  }

  Future<void> saveReconciliation(TaxReconciliation reconciliation) async {
    await isar.writeTxn(() async {
      await isar.taxReconciliations.put(reconciliation);
    });
  }
}

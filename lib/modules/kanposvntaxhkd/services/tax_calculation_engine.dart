import '../models/tax_rule.dart';

class TaxWarning {
  final String code;
  final String message;

  TaxWarning(this.code, this.message);
}

class TaxCalculationInput {
  final String taxYear;
  final String taxPeriod;
  final String businessType;
  final String industryCode;
  final String methodCode; // e.g., 'KHOAN', 'KE_KHAI'
  final double revenue;
  final double deductibleExpenses;
  final double adjustments;

  TaxCalculationInput({
    required this.taxYear,
    required this.taxPeriod,
    required this.businessType,
    required this.industryCode,
    required this.methodCode,
    required this.revenue,
    this.deductibleExpenses = 0,
    this.adjustments = 0,
  });
}

class TaxCalculationResult {
  final double taxableRevenue;
  final double taxableIncome;
  final double vatAmount;
  final double pitAmount;
  final double otherTaxAmount;
  final double totalPayable;
  final List<TaxWarning> warnings;
  final String ruleVersion;

  TaxCalculationResult({
    required this.taxableRevenue,
    required this.taxableIncome,
    required this.vatAmount,
    required this.pitAmount,
    required this.otherTaxAmount,
    required this.totalPayable,
    required this.warnings,
    required this.ruleVersion,
  });
}

abstract class TaxCalculationEngine {
  TaxCalculationResult calculate(TaxCalculationInput input);
}

class TaxCalculationEngineImpl implements TaxCalculationEngine {
  final List<TaxRule> activeRules;

  TaxCalculationEngineImpl(this.activeRules);

  @override
  TaxCalculationResult calculate(TaxCalculationInput input) {
    List<TaxWarning> warnings = [];
    double vatAmount = 0;
    double pitAmount = 0;
    double otherTaxAmount = 0;

    // Filter rules matching the year and industry
    final applicableRules = activeRules.where((r) => 
      r.taxYear.toString() == input.taxYear && 
      (r.businessType == input.industryCode || r.businessType == 'ALL')
    ).toList();

    if (applicableRules.isEmpty) {
      warnings.add(TaxWarning('NO_RULE', 'Không tìm thấy cấu hình thuế cho ngành nghề và năm tương ứng.'));
    }

    double taxableRevenue = input.revenue + input.adjustments;
    double taxableIncome = taxableRevenue - input.deductibleExpenses;
    String ruleVersion = 'unknown';

    for (var rule in applicableRules) {
      ruleVersion = rule.ruleCode ?? 'unknown';

      // Check revenue thresholds
      if (rule.revenueMin != null && taxableRevenue < rule.revenueMin!) {
        warnings.add(TaxWarning('BELOW_THRESHOLD', 'Doanh thu dưới mức chịu thuế ${rule.taxType}.'));
        continue;
      }
      
      double calculatedTax = 0;

      if (input.methodCode == 'KHOAN' || rule.calculationMethod == 'REVENUE_BASED') {
         calculatedTax = taxableRevenue * (rule.rate ?? 0);
      } else if (input.methodCode == 'KE_KHAI' || rule.calculationMethod == 'INCOME_BASED') {
         calculatedTax = taxableIncome * (rule.rate ?? 0);
      } else if (rule.calculationMethod == 'FIXED_AMOUNT') {
         calculatedTax = rule.fixedAmount ?? 0;
      }

      if (rule.taxType == 'VAT') {
        vatAmount += calculatedTax;
      } else if (rule.taxType == 'PIT') {
        pitAmount += calculatedTax;
      } else {
        otherTaxAmount += calculatedTax;
      }
    }

    return TaxCalculationResult(
      taxableRevenue: taxableRevenue,
      taxableIncome: taxableIncome < 0 ? 0 : taxableIncome,
      vatAmount: vatAmount,
      pitAmount: pitAmount,
      otherTaxAmount: otherTaxAmount,
      totalPayable: vatAmount + pitAmount + otherTaxAmount,
      warnings: warnings,
      ruleVersion: ruleVersion,
    );
  }
}

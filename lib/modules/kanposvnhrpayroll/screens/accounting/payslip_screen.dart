import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/app_theme.dart';
import '../../core/providers.dart';
import '../../models/payslip.dart';

class PayslipScreen extends ConsumerWidget {
  const PayslipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthProvider);
    final slipsAsync = ref.watch(payslipsByMonthProvider(selected));

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: slipsAsync.when(
              data: (slips) {
                if (slips.isEmpty) {
                  return const Center(
                    child: Text('Chưa có phiếu lương tháng này',
                        style: TextStyle(color: AppTheme.textSecondary)),
                  );
                }
                return ListView.separated(
                  itemCount: slips.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) => _payslipCard(context, slips[i]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _payslipCard(BuildContext context, Payslip slip) {
    return Card(
      color: AppTheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: AppTheme.primaryBlue),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(slip.employeeName,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                      Text('${slip.employeeCode} - ${slip.department}',
                          style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                    ],
                  ),
                ),
                Text(_formatMoney(slip.netSalary),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.success)),
              ],
            ),
            const Divider(color: AppTheme.borderColor, height: 16),

            // Thu nhập
            _sectionTitle('THU NHẬP'),
            _row('Lương cơ bản', _formatMoney(slip.baseSalary)),
            if (slip.earnedBaseSalary > 0 && slip.earnedBaseSalary != slip.baseSalary)
              _row('Lương thực tế (${slip.actualWorkingDays.toInt()}/${slip.workingDays.toInt()} ngày)',
                  _formatMoney(slip.earnedBaseSalary)),
            if (slip.overtimeSalary > 0) _row('Lương OT', _formatMoney(slip.overtimeSalary)),
            if (slip.tripSalary > 0) _row('Lương chuyến', _formatMoney(slip.tripSalary)),
            if (slip.kmSalary > 0) _row('Lương km', _formatMoney(slip.kmSalary)),
            if (slip.containerSalary > 0) _row('Lương container', _formatMoney(slip.containerSalary)),
            if (slip.revenueSalary > 0) _row('Lương doanh thu', _formatMoney(slip.revenueSalary)),
            if (slip.allowancePhone > 0) _row('PC điện thoại', _formatMoney(slip.allowancePhone)),
            if (slip.allowanceMeal > 0) _row('PC ăn trưa', _formatMoney(slip.allowanceMeal)),
            if (slip.allowanceNightStay > 0) _row('PC ăn ở', _formatMoney(slip.allowanceNightStay)),
            if (slip.allowanceFuel > 0) _row('PC xăng xe', _formatMoney(slip.allowanceFuel)),
            if (slip.diligenceBonus > 0) _row('Thưởng chuyên cần', _formatMoney(slip.diligenceBonus)),
            if (slip.kpiBonus > 0) _row('Thưởng KPI', _formatMoney(slip.kpiBonus)),
            if (slip.monthlyBonus > 0) _row('Thưởng tháng', _formatMoney(slip.monthlyBonus)),
            if (slip.safetyBonus > 0) _row('Thưởng an toàn', _formatMoney(slip.safetyBonus)),
            _row('Tổng thu nhập', _formatMoney(slip.grossSalary), bold: true),

            const SizedBox(height: 8),
            _sectionTitle('KHẤU TRỪ NLĐ'),
            _row('BHXH NLĐ (8%)', _formatMoney(slip.bhxhEmployee), color: AppTheme.danger),
            _row('BHYT NLĐ (1.5%)', _formatMoney(slip.bhytEmployee), color: AppTheme.danger),
            _row('BHTN NLĐ (1%)', _formatMoney(slip.bhtnEmployee), color: AppTheme.danger),
            if (slip.personalIncomeTax > 0)
              _row('Thuế TNCN', _formatMoney(slip.personalIncomeTax), color: AppTheme.danger),
            if (slip.advanceDeduction > 0)
              _row('Tạm ứng', _formatMoney(slip.advanceDeduction), color: AppTheme.danger),
            _row('Tổng khấu trừ', _formatMoney(slip.totalEmployeeDeductions),
                bold: true, color: AppTheme.danger),

            const Divider(color: AppTheme.borderColor, height: 16),

            // NSDL section
            _sectionTitle('CHI PHÍ NSDL'),
            _row('BHXH NSDL (17.5%)', _formatMoney(slip.bhxhEmployer), color: AppTheme.accent),
            _row('BHYT NSDL (3%)', _formatMoney(slip.bhytEmployer), color: AppTheme.accent),
            _row('BHTN NSDL (1%)', _formatMoney(slip.bhtnEmployer), color: AppTheme.accent),
            _row('Kinh phí CĐ (2%)', _formatMoney(slip.unionFee), color: AppTheme.accent),
            _row('Tổng chi phí NSDL', _formatMoney(slip.totalEmployerCost),
                bold: true, color: AppTheme.accent),

            const Divider(color: AppTheme.borderColor, height: 16),

            // Net
            Row(
              children: [
                const Text('THỰC LÃNH',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                const Spacer(),
                Text(_formatMoney(slip.netSalary),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.success)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(title,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: AppTheme.primaryBlue)),
    );
  }

  static Widget _row(String label, String value,
      {bool bold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: color ?? AppTheme.textSecondary,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          const Spacer(),
          Text(value,
              style: TextStyle(
                  fontSize: 12,
                  color: color ?? AppTheme.textPrimary,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  static String _formatMoney(double amount) {
    final rounded = amount.roundToDouble();
    if (rounded >= 1000000000) return '${(rounded / 1000000000).toStringAsFixed(1)} tỷ';
    if (rounded >= 1000000) return '${(rounded / 1000000).toStringAsFixed(1)} tr';
    return rounded.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/payroll.dart';
import 'payslip_pdf.dart';

class PayrollScreen extends ConsumerStatefulWidget {
  const PayrollScreen({super.key});

  @override
  ConsumerState<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends ConsumerState<PayrollScreen> {
  bool _isCalculating = false;

  @override
  Widget build(BuildContext context) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final payrollAsync = ref.watch(payrollNotifierProvider(selectedMonth));

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bảng lương',
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text('Tháng ${selectedMonth.month}/${selectedMonth.year}',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const Spacer(),
                    MonthPicker(
                      year: selectedMonth.year,
                      month: selectedMonth.month,
                      onPrev: () =>
                          ref.read(selectedMonthProvider.notifier).previousMonth(),
                      onNext: () =>
                          ref.read(selectedMonthProvider.notifier).nextMonth(),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _isCalculating ? null : () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Tính lương tự động'),
                            content: Text(
                                'Tính lương tháng ${selectedMonth.month}/${selectedMonth.year} cho tất cả nhân viên?\n\nDữ liệu sẽ được tính từ bảng chấm công.'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('Hủy')),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Tính lương'),
                              ),
        ],
      ),
    );
                        if (confirmed == true && mounted) {
                          setState(() => _isCalculating = true);
                          try {
                            debugPrint('Starting payroll calculation for ${selectedMonth.month}/${selectedMonth.year}');
                            await ref
                                .read(payrollNotifierProvider(selectedMonth).notifier)
                                .calculateAndSave(
                                    selectedMonth.year, selectedMonth.month);
                            debugPrint('Payroll calculation completed');
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Đã tính lương thành công')),
                              );
                            }
                          } catch (e, stack) {
                            debugPrint('Payroll calculation error: $e\n$stack');
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Lỗi tính lương: $e'), backgroundColor: AppTheme.danger),
                              );
                            }
                          } finally {
                            if (mounted) {
                              setState(() => _isCalculating = false);
                            }
                          }
                        }
                      },
                      icon: _isCalculating 
                          ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Icon(Icons.calculate, size: 18),
                      label: Text(_isCalculating ? 'Đang tính...' : 'Tính lương'),
                    ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => context.go('/payroll/entry'),
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Nhập lương'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: payrollAsync.value?.isEmpty ?? true
                      ? null
                      : () => printAllPayslips(payrollAsync.value!),
                  icon: const Icon(Icons.print, size: 18),
                  label: const Text('In phiếu lương'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: payrollAsync.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(24), child: LoadingList()),
              error: (e, _) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: AppTheme.danger),
                      SizedBox(height: 16),
                      Text('Lỗi: $e',
                          style: const TextStyle(color: AppTheme.danger)),
                    ],
                  )),
              data: (payrolls) {
                if (payrolls.isEmpty) {
                  return EmptyState(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Chưa có bảng lương',
                    subtitle: 'Nhấn "Tính lương" để tạo bảng lương tự động',
                    action: ElevatedButton.icon(
                      onPressed: () async {
                        await ref
                            .read(payrollNotifierProvider(selectedMonth).notifier)
                            .calculateAndSave(
                                selectedMonth.year, selectedMonth.month);
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text('Tính lương ngay'),
                    ),
                  );
                }

                // Summary
                final totalGross = payrolls.fold<double>(
                    0, (s, p) => s + p.grossSalary);
                final totalNet = payrolls.fold<double>(
                    0, (s, p) => s + p.netSalary);
                final totalDeductions = payrolls.fold<double>(
                    0, (s, p) => s + p.totalDeductions);

                return Column(
                  children: [
                    // Summary row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          _PaySummaryChip(
                            label: 'Tổng thu nhập',
                            value: totalGross.toVnd(),
                            color: AppTheme.primaryLight,
                          ),
                          const SizedBox(width: 12),
                          _PaySummaryChip(
                            label: 'Khấu trừ',
                            value: totalDeductions.toVnd(),
                            color: AppTheme.danger,
                          ),
                          const SizedBox(width: 12),
                          _PaySummaryChip(
                            label: 'Thực lĩnh',
                            value: totalNet.toVnd(),
                            color: AppTheme.success,
                          ),
                          const Spacer(),
                          Text('${payrolls.length} nhân viên',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Table
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderColor),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Mã NV')),
                                  DataColumn(label: Text('Họ tên')),
                                  DataColumn(label: Text('Phòng ban')),
                                  DataColumn(label: Text('Loại')),
                                  DataColumn(label: Text('Lương cơ bản'), numeric: true),
                                  DataColumn(label: Text('Lương chuyến/OT'), numeric: true),
                                  DataColumn(label: Text('Phụ cấp'), numeric: true),
                                  DataColumn(label: Text('Thưởng'), numeric: true),
                                  DataColumn(label: Text('Tổng thu'), numeric: true),
                                  DataColumn(label: Text('BHXH+Thuế'), numeric: true),
                                  DataColumn(label: Text('Thực lĩnh'), numeric: true),
                                  DataColumn(label: Text('Trạng thái')),
                                  DataColumn(label: Text('')),
                                ],
                                rows: payrolls.map((p) {
                                  final statusColor = switch (p.status) {
                                    PayrollStatus.draft => AppTheme.textMuted,
                                    PayrollStatus.confirmed => AppTheme.warning,
                                    PayrollStatus.paid => AppTheme.success,
                                  };
                                  final statusLabel = switch (p.status) {
                                    PayrollStatus.draft => 'Nháp',
                                    PayrollStatus.confirmed => 'Đã duyệt',
                                    PayrollStatus.paid => 'Đã trả',
                                  };
                                  return DataRow(
                                    onSelectChanged: (_) =>
                                        _showPayslip(context, p),
                                    cells: [
                                      DataCell(Text(p.employeeCode,
                                          style: const TextStyle(
                                              color: AppTheme.primaryLight,
                                              fontSize: 12))),
                                      DataCell(Text(p.employeeName,
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(p.department,
                                          style: const TextStyle(fontSize: 11))),
                                      DataCell(Text(
                                          p.isDriver ? 'Tài xế' : 'VP',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: p.isDriver
                                                  ? AppTheme.accent
                                                  : AppTheme.primaryLight))),
                                      DataCell(Text(
                                          p.baseSalary.toVndShort(),
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(
                                          (p.tripSalary + p.overtimeSalary)
                                              .toVndShort(),
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(
                                          (p.allowancePhone +
                                                  p.allowanceMeal +
                                                  p.allowanceFuel)
                                              .toVndShort(),
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(
                                          (p.kpiBonus + p.monthlyBonus +
                                                  p.safetyBonus)
                                              .toVndShort(),
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(
                                          p.grossSalary.toVndShort(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12))),
                                      DataCell(Text(
                                          (p.socialInsurance +
                                                  p.healthInsurance +
                                                  p.unemploymentInsurance +
                                                  p.personalIncomeTax)
                                              .toVndShort(),
                                          style: const TextStyle(
                                              color: AppTheme.danger,
                                              fontSize: 12))),
                                      DataCell(Text(
                                          p.netSalary.toVndShort(),
                                          style: const TextStyle(
                                              color: AppTheme.success,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 13))),
                                      DataCell(
                                        StatusBadge(
                                            label: statusLabel,
                                            color: statusColor),
                                      ),
                                      DataCell(
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.print, size: 18),
                                              color: AppTheme.textSecondary,
                                              onPressed: () => printPayslip(p),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit, size: 18),
                                              color: AppTheme.textSecondary,
                                              onPressed: () => context.go('/payroll/edit/${p.id}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (_isCalculating)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: Colors.white),
                    SizedBox(height: 16),
                    Text('Đang tính lương...', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPayslip(BuildContext context, Payroll p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.bg800,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        expand: false,
        builder: (_, ctrl) => SingleChildScrollView(
          controller: ctrl,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: AppTheme.borderColor,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 20),
              Text('Phiếu lương - ${p.employeeName}',
                  style: Theme.of(context).textTheme.headlineSmall),
              Text('Tháng ${p.month}/${p.year} | ${p.department}',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              const Divider(),
              InfoRow(label: 'Lương cơ bản', value: p.baseSalary.toVnd()),
              if (p.isDriver) ...[
                InfoRow(label: 'Lương chuyến', value: p.tripSalary.toVnd()),
                InfoRow(label: 'Lương km', value: p.kmSalary.toVnd()),
                InfoRow(label: 'Lương container', value: p.containerSalary.toVnd()),
                InfoRow(label: 'Phụ cấp lưu đêm', value: p.allowanceNightStay.toVnd()),
              ] else ...[
                InfoRow(label: 'Lương làm thực tế', value: p.earnedBaseSalary.toVnd()),
                InfoRow(label: 'Tăng ca (OT)', value: p.overtimeSalary.toVnd()),
                InfoRow(label: 'Chuyên cần', value: p.diligenceBonus.toVnd()),
              ],
              InfoRow(label: 'Phụ cấp điện thoại', value: p.allowancePhone.toVnd()),
              InfoRow(label: 'Phụ cấp ăn', value: p.allowanceMeal.toVnd()),
              InfoRow(label: 'Thưởng KPI', value: p.kpiBonus.toVnd()),
              InfoRow(label: 'Thưởng an toàn', value: p.safetyBonus.toVnd()),
              InfoRow(
                label: 'Tổng thu nhập',
                value: p.grossSalary.toVnd(),
                bold: true,
                valueColor: AppTheme.primaryLight,
              ),
              const Divider(),
              InfoRow(
                  label: 'BHXH (${p.isDriver ? "8" : "8"}%)',
                  value: '-${p.socialInsurance.toVnd()}',
                  valueColor: AppTheme.danger),
              InfoRow(
                  label: 'BHYT (1.5%)',
                  value: '-${p.healthInsurance.toVnd()}',
                  valueColor: AppTheme.danger),
              InfoRow(
                  label: 'BHTN (1%)',
                  value: '-${p.unemploymentInsurance.toVnd()}',
                  valueColor: AppTheme.danger),
              InfoRow(
                  label: 'Thuế TNCN',
                  value: '-${p.personalIncomeTax.toVnd()}',
                  valueColor: AppTheme.danger),
              if (p.violationPenalty > 0)
                InfoRow(
                    label: 'Phạt vi phạm',
                    value: '-${p.violationPenalty.toVnd()}',
                    valueColor: AppTheme.danger),
              if (p.advanceDeduction > 0)
                InfoRow(
                    label: 'Tạm ứng',
                    value: '-${p.advanceDeduction.toVnd()}',
                    valueColor: AppTheme.danger),
              const Divider(),
              InfoRow(
                label: 'THỰC LĨNH',
                value: p.netSalary.toVnd(),
                bold: true,
                valueColor: AppTheme.success,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaySummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _PaySummaryChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 2),
          Text(value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w700,
                  )),
        ],
      ),
    );
  }
}

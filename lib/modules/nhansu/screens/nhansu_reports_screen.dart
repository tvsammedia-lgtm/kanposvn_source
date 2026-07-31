import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);

class NhanSuReportsScreen extends ConsumerWidget {
  const NhanSuReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final year = ref.watch(_selectedYearProvider);
    final employees = db.getCollection('employees');
    final payrolls = db.getCollection('payrolls');
    final attendance = db.getCollection('attendance');

    final yearPayrolls = payrolls.where((p) => p['year'] == year).toList();
    final totalYearSalary = yearPayrolls.fold<double>(
        0, (sum, p) => sum + ((p['netSalary'] as num?) ?? 0).toDouble());
    final totalYearDeductions = yearPayrolls.fold<double>(0, (sum, p) {
      final d = p['deductions'] as Map<String, dynamic>?;
      return sum + (d?.values.fold<double>(0, (s, v) => s + ((v as num?) ?? 0).toDouble()) ?? 0);
    });
    final totalBhxh = yearPayrolls.fold<double>(0, (sum, p) {
      final d = p['deductions'] as Map<String, dynamic>?;
      return sum + ((d?['BHXH'] as num?) ?? 0).toDouble();
    });
    final totalTax = yearPayrolls.fold<double>(0, (sum, p) {
      final d = p['deductions'] as Map<String, dynamic>?;
      return sum + ((d?['Thuế TNCN'] as num?) ?? 0).toDouble();
    });

    final yearAttendance = attendance.where((a) => a['year'] == year).toList();
    final totalOvertime = yearAttendance.fold<double>(
        0, (sum, a) => sum + ((a['overtimeHours'] as num?) ?? 0).toDouble());
    final totalLeave = yearAttendance.fold<double>(
        0, (sum, a) => sum + ((a['leaveDays'] as num?) ?? 0).toDouble());

    final Map<int, double> monthlyTotals = {};
    for (var p in yearPayrolls) {
      final m = p['month'] as int;
      final net = ((p['netSalary'] as num?) ?? 0).toDouble();
      monthlyTotals[m] = (monthlyTotals[m] ?? 0) + net;
    }

    final departments = <String, int>{};
    for (var emp in employees) {
      final dept = (emp['department'] as String?) ?? 'Chưa phân ban';
      departments[dept] = (departments[dept] ?? 0) + 1;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'hr_reports'.tr,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                ),
                const Spacer(),
                _YearSelector(
                  year: year,
                  onChanged: (v) => ref.read(_selectedYearProvider.notifier).state = v,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'year_overview'.trParams({'year': '$year'})),
                  const SizedBox(height: 16),
                  _ReportRow(label: 'total_staff_count'.trParams({'count': '${employees.length}'}), value: '${employees.length} người'),
                  _ReportRow(label: 'total_salary_paid'.tr, value: AppFormatters.formatCurrency(totalYearSalary)),
                  _ReportRow(label: 'total_social_insurance'.tr, value: AppFormatters.formatCurrency(totalBhxh)),
                  _ReportRow(label: 'total_income_tax'.tr, value: AppFormatters.formatCurrency(totalTax)),
                  _ReportRow(label: 'total_deductions'.tr, value: AppFormatters.formatCurrency(totalYearDeductions)),
                  const Divider(),
                  _ReportRow(label: 'total_overtime'.tr, value: '${totalOvertime.toStringAsFixed(1)}h'),
                  _ReportRow(label: 'total_leave_days'.tr, value: '${totalLeave.toStringAsFixed(0)} ngày'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(title: 'salary_by_month'),
                  const SizedBox(height: 16),
                  ...List.generate(12, (i) {
                    final m = i + 1;
                    final total = monthlyTotals[m] ?? 0;
                    final maxVal = monthlyTotals.values.isNotEmpty
                        ? monthlyTotals.values.reduce((a, b) => a > b ? a : b)
                        : 1.0;
                    final ratio = maxVal > 0 ? total / maxVal : 0.0;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Text('T$m', style: const TextStyle(fontSize: 12)),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: ratio,
                                minHeight: 16,
                                backgroundColor: AppColors.surfaceAlt,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  total > 0 ? AppColors.primary : AppColors.border,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 120,
                            child: Text(
                              total > 0 ? AppFormatters.formatCurrencyShort(total) : '-',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: 'department_distribution'.tr),
                  const SizedBox(height: 16),
                  ...departments.entries.map((entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 8, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Expanded(child: Text(entry.key, style: const TextStyle(fontSize: 13))),
                            Text('${entry.value} người',
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          ],
                        ),
                      )),
                  if (departments.isEmpty)
                    Text('no_data_yet'.tr,
                        style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _YearSelector extends StatelessWidget {
  final int year;
  final ValueChanged<int> onChanged;

  const _YearSelector({required this.year, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 20),
          onPressed: () => onChanged(year - 1),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('$year', style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary)),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded, size: 20),
          onPressed: () => onChanged(year + 1),
        ),
      ],
    );
  }
}

class _ReportRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReportRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
}

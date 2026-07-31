import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/payroll_model.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);
final _selectedMonthProvider = StateProvider<int>((ref) => DateTime.now().month);

class NhanSuPayrollScreen extends ConsumerWidget {
  const NhanSuPayrollScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);
    final employees = db.getCollection('employees');
    final allPayrolls = db.getCollection('payrolls');
    final monthPayrolls = allPayrolls
        .where((p) => p['year'] == year && p['month'] == month)
        .toList();

    final totalNet = monthPayrolls.fold<double>(
        0, (sum, p) => sum + ((p['netSalary'] as num?) ?? 0).toDouble());
    final totalDeductions = monthPayrolls.fold<double>(
        0, (sum, p) {
      final deductions = p['deductions'] as Map<String, dynamic>?;
      return sum + (deductions?.values.fold<double>(0, (s, v) => s + ((v as num?) ?? 0).toDouble()) ?? 0);
    });
    final paidCount = monthPayrolls.where((p) => p['status'] == 'paid').length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            color: AppColors.surface,
            child: Row(
              children: [
                _MonthPicker(
                  year: year,
                  month: month,
                  onYearChanged: (v) => ref.read(_selectedYearProvider.notifier).state = v,
                  onMonthChanged: (v) => ref.read(_selectedMonthProvider.notifier).state = v,
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _generatePayrolls(context, ref, employees, year, month),
                  icon: const Icon(Icons.calculate_rounded, size: 18),
                  label: Text('calculate_salary'.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: AppColors.surface,
            child: Row(
              children: [
                _SummaryChip(
                    label: 'total_salary'.tr,
                    value: AppFormatters.formatCurrencyShort(totalNet),
                    color: AppColors.primary),
                const SizedBox(width: 12),
                _SummaryChip(
                    label: 'deductions'.tr,
                    value: AppFormatters.formatCurrencyShort(totalDeductions),
                    color: AppColors.danger),
                const SizedBox(width: 12),
                _SummaryChip(label: 'paid'.tr, value: '$paidCount', color: AppColors.success),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: monthPayrolls.isEmpty
                ? EmptyState(
                    icon: Icons.payments_outlined,
                    title: 'no_payroll'.tr,
                    subtitle: 'click_calculate'.tr,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: monthPayrolls.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final payroll = monthPayrolls[index];
                      return _PayrollCard(
                        data: payroll,
                        onStatusChanged: (newStatus) {
                          final updated = Map<String, dynamic>.from(payroll);
                          updated['status'] = newStatus;
                          DatabaseService.instance.saveItem('payrolls', payroll['id'] as String, updated);
                        },
                        onDelete: () => _confirmDelete(context, ref, payroll['id'] as String),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _generatePayrolls(
    BuildContext context,
    WidgetRef ref,
    List<Map<String, dynamic>> employees,
    int year,
    int month,
  ) {
    if (employees.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no_employees_to_calculate'.tr)),
      );
      return;
    }

    final db = DatabaseService.instance;
    final attendance = db.getCollection('attendance');
    int created = 0;

    for (final emp in employees) {
      final empId = emp['id'] as String;
      final existingPayroll = db.getCollection('payrolls').where((p) =>
          p['employeeId'] == empId && p['year'] == year && p['month'] == month).toList();
      if (existingPayroll.isNotEmpty) continue;

      final baseSalary = ((emp['baseSalary'] as num?) ?? 0).toDouble();
      final empAttendance = attendance.firstWhere(
        (a) => a['employeeId'] == empId && a['year'] == year && a['month'] == month,
        orElse: () => {},
      );
      final workingDays = ((empAttendance['workingDays'] as num?) ?? 0).toDouble();
      final overtimeHours = ((empAttendance['overtimeHours'] as num?) ?? 0).toDouble();
      final standardDays = 26.0;
      final earnedBase = workingDays > 0 ? (baseSalary / standardDays * workingDays) : 0.0;
      final overtimePay = baseSalary / standardDays / 8 * overtimeHours * 1.5;

      final allowancesMap = (emp['allowances'] as Map<String, dynamic>?)
              ?.map((k, v) => MapEntry(k, (v as num?)?.toDouble() ?? 0)) ??
          <String, double>{};
      final totalAllowances = allowancesMap.values.fold<double>(0, (s, v) => s + v);

      final bhxh = earnedBase * 0.105;
      final taxableIncome = earnedBase + totalAllowances + overtimePay - bhxh;
      final tax = taxableIncome > 11000000 ? (taxableIncome - 11000000) * 0.1 : 0.0;

      final netSalary = earnedBase + overtimePay + totalAllowances - bhxh - tax;

      final payroll = PayrollModel(
        id: IdGenerator.generateId('PAY'),
        employeeId: empId,
        employeeCode: emp['employeeCode'] as String? ?? '',
        employeeName: emp['fullName'] as String? ?? '',
        department: emp['department'] as String? ?? '',
        position: emp['position'] as String? ?? '',
        year: year,
        month: month,
        baseSalary: baseSalary,
        earnedBaseSalary: earnedBase,
        overtimePay: overtimePay,
        allowances: allowancesMap,
        bonus: 0,
        deductions: {'BHXH': bhxh, 'Thuế TNCN': tax},
        netSalary: netSalary,
        status: 'draft',
      );
      db.saveItem('payrolls', payroll.id, payroll.toJson(), triggerSync: false);
      created++;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('created_payslips'.trParams({'count': '$created'}))),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('delete_payroll'.tr),
        content: Text('confirm_delete_payroll'.tr),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              DatabaseService.instance.deleteItem('payrolls', id);
              Navigator.pop(ctx);
            },
            child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _MonthPicker extends StatelessWidget {
  final int year;
  final int month;
  final ValueChanged<int> onYearChanged;
  final ValueChanged<int> onMonthChanged;

  const _MonthPicker({
    required this.year,
    required this.month,
    required this.onYearChanged,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            if (month == 1) {
              onYearChanged(year - 1);
              onMonthChanged(12);
            } else {
              onMonthChanged(month - 1);
            }
          },
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'month_label'.trParams({'month': month.toString().padLeft(2, '0'), 'year': '$year'}),
              style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded),
          onPressed: () {
            if (month == 12) {
              onYearChanged(year + 1);
              onMonthChanged(1);
            } else {
              onMonthChanged(month + 1);
            }
          },
        ),
      ],
    );
  }
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryChip({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
          const SizedBox(width: 6),
          Text(value, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _PayrollCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onDelete;

  const _PayrollCard({required this.data, required this.onStatusChanged, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final name = (data['employeeName'] as String?) ?? '';
    final code = (data['employeeCode'] as String?) ?? '';
    final netSalary = ((data['netSalary'] as num?) ?? 0).toDouble();
    final status = (data['status'] as String?) ?? 'draft';

    Color statusColor;
    String statusLabel;
    switch (status) {
      case 'paid':
        statusColor = AppColors.success;
        statusLabel = 'paid'.tr;
        break;
      case 'confirmed':
        statusColor = AppColors.info;
        statusLabel = 'confirmed'.tr;
        break;
      default:
        statusColor = AppColors.warning;
        statusLabel = 'draft'.tr;
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(width: 8),
                    StatusBadge(label: statusLabel, color: statusColor),
                  ],
                ),
                const SizedBox(height: 4),
                Text(code, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                const SizedBox(height: 4),
                Text(
                  'received_salary'.trParams({'amount': AppFormatters.formatCurrency(netSalary)}),
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.primary),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            itemBuilder: (_) => [
              if (status == 'draft')
                PopupMenuItem(value: 'confirmed', child: Text('confirm'.tr)),
              if (status == 'confirmed')
                PopupMenuItem(value: 'paid', child: Text('mark_paid'.tr)),
              PopupMenuItem(value: 'delete', child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger))),
            ],
            onSelected: (v) {
              if (v == 'delete') { onDelete(); }
              else { onStatusChanged(v); }
            },
          ),
        ],
      ),
    );
  }
}

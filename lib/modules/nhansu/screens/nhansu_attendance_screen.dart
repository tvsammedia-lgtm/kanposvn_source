import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/attendance_model.dart';

final _selectedYearProvider = StateProvider<int>((ref) => DateTime.now().year);
final _selectedMonthProvider = StateProvider<int>((ref) => DateTime.now().month);

class NhanSuAttendanceScreen extends ConsumerWidget {
  const NhanSuAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final year = ref.watch(_selectedYearProvider);
    final month = ref.watch(_selectedMonthProvider);
    final employees = db.getCollection('employees');
    final allAttendance = db.getCollection('attendance');
    final monthAttendance = allAttendance
        .where((a) => a['year'] == year && a['month'] == month)
        .toList();

    final presentCount = monthAttendance.where((a) =>
        ((a['workingDays'] as num?) ?? 0) > 0).length;
    final totalOvertime = monthAttendance.fold<double>(
        0, (sum, a) => sum + ((a['overtimeHours'] as num?) ?? 0).toDouble());
    final totalLeave = monthAttendance.fold<double>(
        0, (sum, a) => sum + ((a['leaveDays'] as num?) ?? 0).toDouble());

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
                  onPressed: () => _showAttendanceDialog(context, ref, employees, year, month),
                  icon: const Icon(Icons.add, size: 18),
                  label: Text('add_attendance'.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
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
                _SummaryChip(label: 'present'.tr, value: '$presentCount', color: AppColors.success),
                const SizedBox(width: 12),
                _SummaryChip(label: 'overtime'.tr, value: '${totalOvertime.toStringAsFixed(1)}h', color: AppColors.warning),
                const SizedBox(width: 12),
                _SummaryChip(label: 'leave'.tr, value: '${totalLeave.toStringAsFixed(1)}d', color: AppColors.danger),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: monthAttendance.isEmpty
                ? EmptyState(
                    icon: Icons.calendar_month_outlined,
                    title: 'no_attendance_data'.tr,
                    subtitle: 'click_add_attendance'.tr,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: monthAttendance.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final att = monthAttendance[index];
                      return _AttendanceCard(
                        data: att,
                        onEdit: () => _showEditAttendanceDialog(context, ref, att),
                        onDelete: () => _confirmDelete(context, ref, att['id'] as String),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showAttendanceDialog(
    BuildContext context,
    WidgetRef ref,
    List<Map<String, dynamic>> employees,
    int year,
    int month,
  ) {
    if (employees.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng thêm nhân viên trước')),
      );
      return;
    }

    String selectedEmpId = employees.first['id'] as String;
    final workingDaysCtrl = TextEditingController(text: '22');
    final overtimeCtrl = TextEditingController(text: '0');
    final leaveCtrl = TextEditingController(text: '0');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'add_attendance_title'.trParams({'month': '$month', 'year': '$year'}),
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedEmpId,
                  items: employees
                      .map((e) => DropdownMenuItem(
                            value: e['id'] as String,
                            child: Text('${e['fullName']} (${e['employeeCode']})'),
                          ))
                      .toList(),
                  onChanged: (v) => setModalState(() => selectedEmpId = v!),
                  decoration: InputDecoration(labelText: 'employee_label'.tr),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: workingDaysCtrl,
                  decoration: InputDecoration(labelText: 'working_days'.tr),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: overtimeCtrl,
                  decoration: InputDecoration(labelText: 'overtime_hours'.tr),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: leaveCtrl,
                  decoration: InputDecoration(labelText: 'leave_days'.tr),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final emp = employees.firstWhere((e) => e['id'] == selectedEmpId);
                      final model = AttendanceModel(
                        id: IdGenerator.generateId('ATT'),
                        employeeId: selectedEmpId,
                        employeeCode: emp['employeeCode'] as String? ?? '',
                        employeeName: emp['fullName'] as String? ?? '',
                        year: year,
                        month: month,
                        workingDays: double.tryParse(workingDaysCtrl.text) ?? 0,
                        overtimeHours: double.tryParse(overtimeCtrl.text) ?? 0,
                        leaveDays: double.tryParse(leaveCtrl.text) ?? 0,
                      );
                      DatabaseService.instance.saveItem('attendance', model.id, model.toJson());
                      Navigator.of(ctx).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('save'.tr),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showEditAttendanceDialog(BuildContext context, WidgetRef ref, Map<String, dynamic> att) {
    final workingDaysCtrl = TextEditingController(
        text: '${((att['workingDays'] as num?) ?? 0).toDouble()}');
    final overtimeCtrl = TextEditingController(
        text: '${((att['overtimeHours'] as num?) ?? 0).toDouble()}');
    final leaveCtrl = TextEditingController(
        text: '${((att['leaveDays'] as num?) ?? 0).toDouble()}');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, MediaQuery.of(ctx).viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'edit_attendance'.trParams({'name': '${att['employeeName']}'}),
                style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: workingDaysCtrl,
                decoration: InputDecoration(labelText: 'working_days'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: overtimeCtrl,
                decoration: InputDecoration(labelText: 'overtime_hours'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: leaveCtrl,
                decoration: InputDecoration(labelText: 'leave_days'.tr),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final updated = AttendanceModel(
                      id: att['id'] as String,
                      employeeId: att['employeeId'] as String,
                      employeeCode: att['employeeCode'] as String? ?? '',
                      employeeName: att['employeeName'] as String? ?? '',
                      year: att['year'] as int,
                      month: att['month'] as int,
                      workingDays: double.tryParse(workingDaysCtrl.text) ?? 0,
                      overtimeHours: double.tryParse(overtimeCtrl.text) ?? 0,
                      leaveDays: double.tryParse(leaveCtrl.text) ?? 0,
                    );
                    DatabaseService.instance.saveItem('attendance', updated.id, updated.toJson());
                    Navigator.of(ctx).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                    child: Text('update'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('delete_attendance'.tr),
        content: Text('confirm_delete'.tr),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              DatabaseService.instance.deleteItem('attendance', id);
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
          onTap: () => _showMonthYearPicker(context),
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

  void _showMonthYearPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        int tempYear = year;
        int tempMonth = month;
        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            title: Text('select_month_year'.tr),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () => setDialogState(() => tempYear--),
                    ),
                    Text('$tempYear', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () => setDialogState(() => tempYear++),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(12, (i) {
                    final m = i + 1;
                    final isSelected = m == tempMonth;
                    return GestureDetector(
                      onTap: () => setDialogState(() => tempMonth = m),
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primary : AppColors.surfaceAlt,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? AppColors.primary : AppColors.border,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$m',
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
              TextButton(
                onPressed: () {
                  onYearChanged(tempYear);
                  onMonthChanged(tempMonth);
                  Navigator.pop(ctx);
                },
                child: Text('select_button'.tr),
              ),
            ],
          ),
        );
      },
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

class _AttendanceCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _AttendanceCard({required this.data, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final name = (data['employeeName'] as String?) ?? '';
    final code = (data['employeeCode'] as String?) ?? '';
    final wd = ((data['workingDays'] as num?) ?? 0).toDouble();
    final ot = ((data['overtimeHours'] as num?) ?? 0).toDouble();
    final ld = ((data['leaveDays'] as num?) ?? 0).toDouble();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.success.withValues(alpha: 0.15),
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 2),
                Text(code, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('days_label'.trParams({'count': wd.toStringAsFixed(0)}), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              if (ot > 0)
                Text('overtime_label'.trParams({'hours': ot.toStringAsFixed(1)}),
                    style: const TextStyle(color: AppColors.warning, fontSize: 11)),
              if (ld > 0)
                Text('leave_label'.trParams({'days': ld.toStringAsFixed(0)}),
                    style: const TextStyle(color: AppColors.danger, fontSize: 11)),
            ],
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            itemBuilder: (_) => [
              PopupMenuItem(value: 'edit', child: Text('edit'.tr)),
              PopupMenuItem(value: 'delete', child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger))),
            ],
            onSelected: (v) {
              if (v == 'edit') onEdit();
              if (v == 'delete') onDelete();
            },
          ),
        ],
      ),
    );
  }
}

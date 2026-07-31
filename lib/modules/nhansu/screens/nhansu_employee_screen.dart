import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/widgets/common_widgets.dart';
import '../../../core/db/database_service.dart';
import '../../../core/l10n/translations.dart';
import '../models/employee_model.dart';

final _searchProvider = StateProvider<String>((ref) => '');

class NhanSuEmployeeScreen extends ConsumerWidget {
  const NhanSuEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseService.instance;
    final search = ref.watch(_searchProvider);
    final allEmployees = db.getCollection('employees');
    final filtered = search.isEmpty
        ? allEmployees
        : allEmployees.where((e) {
            final name = (e['fullName'] as String? ?? '').toLowerCase();
            final code = (e['employeeCode'] as String? ?? '').toLowerCase();
            final q = search.toLowerCase();
            return name.contains(q) || code.contains(q);
          }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            color: AppColors.surface,
            child: Row(
              children: [
                Expanded(
                  child: AppSearchBar(
                    hint: 'search_employee'.tr,
                    onChanged: (v) => ref.read(_searchProvider.notifier).state = v,
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => _showEmployeeDialog(context, ref, null),
                  icon: const Icon(Icons.add, size: 18),
                  label: Text('add_employee'.tr),
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
          Expanded(
            child: filtered.isEmpty
                ? EmptyState(
                    icon: Icons.people_outline,
                    title: 'no_employee_found'.tr,
                    subtitle: 'try_different_keyword'.tr,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final emp = filtered[index];
                      return _EmployeeCard(
                        data: emp,
                        onEdit: () => _showEmployeeDialog(context, ref, emp),
                        onDelete: () => _confirmDelete(context, ref, emp['id'] as String),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showEmployeeDialog(BuildContext context, WidgetRef ref, Map<String, dynamic>? existing) {
    final isEdit = existing != null;
    final nameCtrl = TextEditingController(text: existing?['fullName'] as String? ?? '');
    final phoneCtrl = TextEditingController(text: existing?['phone'] as String? ?? '');
    final emailCtrl = TextEditingController(text: existing?['email'] as String? ?? '');
    final deptCtrl = TextEditingController(text: existing?['department'] as String? ?? '');
    final posCtrl = TextEditingController(text: existing?['position'] as String? ?? '');
    final salaryCtrl = TextEditingController(
      text: existing != null ? '${((existing['baseSalary'] as num?) ?? 0).toDouble()}' : '',
    );
    String gender = existing?['gender'] as String? ?? 'Nam';

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
                  isEdit ? 'edit_employee'.tr : 'add_employee_new'.tr,
                  style: Theme.of(ctx).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(labelText: 'full_name_required'.tr),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('male'.tr),
                        value: 'Nam',
                        groupValue: gender,
                        onChanged: (v) => setModalState(() => gender = v!),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('female'.tr),
                        value: 'Nữ',
                        groupValue: gender,
                        onChanged: (v) => setModalState(() => gender = v!),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: phoneCtrl,
                  decoration: InputDecoration(labelText: 'phone_label'.tr),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(labelText: 'email'.tr),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: deptCtrl,
                  decoration: InputDecoration(labelText: 'department'.tr),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: posCtrl,
                  decoration: InputDecoration(labelText: 'position'.tr),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: salaryCtrl,
                  decoration: InputDecoration(labelText: 'base_salary'.tr),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameCtrl.text.trim().isEmpty) return;
                      final model = EmployeeModel(
                        id: existing?['id'] as String? ?? IdGenerator.generateId('NV'),
                        employeeCode: existing?['employeeCode'] as String? ?? IdGenerator.generateEmployeeCode(),
                        fullName: nameCtrl.text.trim(),
                        gender: gender,
                        phone: phoneCtrl.text.trim(),
                        email: emailCtrl.text.trim(),
                        department: deptCtrl.text.trim(),
                        position: posCtrl.text.trim(),
                        baseSalary: double.tryParse(salaryCtrl.text) ?? 0,
                      );
                      DatabaseService.instance.saveItem(
                        'employees',
                        model.id,
                        model.toJson(),
                      );
                      Navigator.of(ctx).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(isEdit ? 'update'.tr : 'add_new'.tr),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('delete_employee'.tr),
        content: Text('confirm_delete_employee'.tr),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              DatabaseService.instance.deleteItem('employees', id);
              Navigator.pop(ctx);
            },
            child: Text('delete'.tr, style: const TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _EmployeeCard({required this.data, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final fullName = (data['fullName'] as String?) ?? '';
    final code = (data['employeeCode'] as String?) ?? '';
    final dept = (data['department'] as String?) ?? '';
    final pos = (data['position'] as String?) ?? '';
    final salary = ((data['baseSalary'] as num?) ?? 0).toDouble();

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
            radius: 22,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            child: Text(
              fullName.isNotEmpty ? fullName[0].toUpperCase() : '?',
              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 15),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  '$code | $dept - $pos',
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                  if (salary > 0) ...[
                  const SizedBox(height: 2),
                  Text(
                    'salary_label'.trParams({'amount': AppFormatters.formatCurrency(salary)}),
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),
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

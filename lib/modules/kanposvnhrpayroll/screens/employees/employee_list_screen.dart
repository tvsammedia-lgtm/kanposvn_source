import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/employee.dart';

class EmployeeListScreen extends ConsumerStatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  ConsumerState<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends ConsumerState<EmployeeListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _search = '';
  String _deptFilter = 'Tất cả';

  static const departments = [
    'Tất cả',
    'Ban Giám đốc',
    'Điều hành vận tải',
    'Phòng nhân sự',
    'Phòng kế toán',
    'Phòng kỹ thuật',
    'Phòng kho',
    'Đội xe',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employeeNotifierProvider);

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
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
                    Text('Nhân sự',
                        style: Theme.of(context).textTheme.headlineLarge),
                    state.when(
                      data: (list) => Text('${list.length} nhân viên',
                          style: Theme.of(context).textTheme.bodyMedium),
                      loading: () => const Text('Đang tải...'),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => context.go('/employees/new'),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Thêm mới'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Search + Filter row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: AppSearchBar(
                    hint: 'Tìm theo tên, mã nhân viên, SĐT...',
                    onChanged: (v) => setState(() => _search = v),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppTheme.bg800,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.borderColor),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _deptFilter,
                      dropdownColor: AppTheme.bg800,
                      style: Theme.of(context).textTheme.bodyLarge,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: AppTheme.textMuted, size: 18),
                      items: departments
                          .map((d) => DropdownMenuItem(
                                value: d,
                                child: Text(d,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ))
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _deptFilter = v ?? 'Tất cả'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Tab bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Đang làm'),
                Tab(text: 'Nghỉ việc'),
                Tab(text: 'Tất cả'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // List
          Expanded(
            child: state.when(
              loading: () =>
                  const Padding(padding: EdgeInsets.all(24), child: LoadingList()),
              error: (e, _) => Center(
                  child: Text('Lỗi: $e',
                      style: const TextStyle(color: AppTheme.danger))),
              data: (employees) {
                final filtered = employees.where((e) {
                  final matchSearch = _search.isEmpty ||
                      e.fullName.toLowerCase().contains(_search.toLowerCase()) ||
                      e.employeeCode
                          .toLowerCase()
                          .contains(_search.toLowerCase()) ||
                      (e.phone ?? '').contains(_search);
                  final matchDept = _deptFilter == 'Tất cả' ||
                      e.department == _deptFilter;
                  return matchSearch && matchDept;
                }).toList();

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _buildList(
                        filtered
                            .where((e) => e.status == EmployeeStatus.active)
                            .toList(),
                        context),
                    _buildList(
                        filtered
                            .where((e) => e.status == EmployeeStatus.resigned)
                            .toList(),
                        context),
                    _buildList(filtered, context),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<Employee> items, BuildContext context) {
    if (items.isEmpty) {
      return const EmptyState(
        icon: Icons.people_outline,
        title: 'Không có nhân viên',
        subtitle: 'Thêm nhân viên mới để bắt đầu',
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) => _EmployeeCard(
        employee: items[i],
        onTap: () => context.go('/employees/${items[i].id}'),
        onDelete: () => _confirmDelete(items[i]),
      ),
    );
  }

  Future<void> _confirmDelete(Employee emp) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text('Bạn có chắc muốn xóa nhân viên ${emp.fullName}?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.danger),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      await ref.read(employeeNotifierProvider.notifier).delete(emp.id);
    }
  }
}

class _EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _EmployeeCard({
    required this.employee,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final e = employee;
    final statusLabel = switch (e.status) {
      EmployeeStatus.active => 'Đang làm',
      EmployeeStatus.resigned => 'Nghỉ việc',
      EmployeeStatus.suspended => 'Tạm nghỉ',
      EmployeeStatus.maternity => 'Thai sản',
    };
    final statusColor = switch (e.status) {
      EmployeeStatus.active => AppTheme.success,
      EmployeeStatus.resigned => AppTheme.danger,
      EmployeeStatus.suspended => AppTheme.warning,
      EmployeeStatus.maternity => AppTheme.accent,
    };

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryBlue,
                    AppTheme.accent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  e.fullName.isNotEmpty ? e.fullName[0].toUpperCase() : '?',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(e.fullName,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(width: 8),
                      StatusBadge(label: statusLabel, color: statusColor),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(e.employeeCode,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.primaryLight,
                                fontFamily: 'monospace',
                              )),
                      const SizedBox(width: 10),
                      const Icon(Icons.business,
                          size: 12, color: AppTheme.textMuted),
                      const SizedBox(width: 4),
                      Text(e.department,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.work_outline,
                          size: 12, color: AppTheme.textMuted),
                      const SizedBox(width: 4),
                      Text(e.position,
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 10),
                      if (e.phone != null) ...[
                        const Icon(Icons.phone,
                            size: 12, color: AppTheme.textMuted),
                        const SizedBox(width: 4),
                        Text(e.phone!,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            // Salary
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(e.baseSalary.toVndShort(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.success,
                        )),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined,
                          size: 16, color: AppTheme.textMuted),
                      onPressed: onTap,
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline,
                          size: 16, color: AppTheme.danger),
                      onPressed: onDelete,
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

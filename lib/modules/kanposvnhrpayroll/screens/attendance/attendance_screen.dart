import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/providers.dart';
import '../../core/app_theme.dart';
import '../../core/widgets.dart';
import '../../models/attendance.dart';
import '../../models/employee.dart';
import '../../models/leave_request.dart';
import '../../services/database_service.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final attendanceAsync =
        ref.watch(attendanceByMonthProvider(selectedMonth));

    return Scaffold(
      backgroundColor: AppTheme.bg900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chấm công',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text(
                        'Tháng ${selectedMonth.month}/${selectedMonth.year}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const Spacer(),
                MonthPicker(
                  year: selectedMonth.year,
                  month: selectedMonth.month,
                  onPrev: () => ref
                      .read(selectedMonthProvider.notifier)
                      .previousMonth(),
                  onNext: () =>
                      ref.read(selectedMonthProvider.notifier).nextMonth(),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () => _showLeaveRequestsSheet(context, ref),
                  icon: const Icon(Icons.event_busy, size: 18),
                  label: const Text('Đơn nghỉ phép'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () =>
                      _showAddAttendanceDialog(context, ref, selectedMonth),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Nhập chấm công'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: attendanceAsync.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(24), child: LoadingList()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (records) {
                if (records.isEmpty) {
                  return EmptyState(
                    icon: Icons.calendar_today_outlined,
                    title: 'Chưa có dữ liệu chấm công',
                    subtitle:
                        'Nhấn "Nhập chấm công" để thêm dữ liệu tháng này',
                    action: ElevatedButton.icon(
                      onPressed: () => _showAddAttendanceDialog(
                          context, ref, selectedMonth),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Nhập chấm công'),
                    ),
                  );
                }

                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    children: [
                      // Summary cards
                      Row(
                        children: [
                          _SummaryCard(
                            label: 'Văn phòng',
                            value: records
                                .where((r) =>
                                    r.attendanceType == AttendanceType.office)
                                .length
                                .toString(),
                            icon: Icons.business,
                            color: AppTheme.primaryLight,
                          ),
                          const SizedBox(width: 12),
                          _SummaryCard(
                            label: 'Tài xế',
                            value: records
                                .where((r) =>
                                    r.attendanceType == AttendanceType.driver)
                                .length
                                .toString(),
                            icon: Icons.local_shipping,
                            color: AppTheme.accent,
                          ),
                          const SizedBox(width: 12),
                          _SummaryCard(
                            label: 'Tổng OT (giờ)',
                            value: records
                                .fold<double>(
                                    0, (s, r) => s + r.overtimeHours)
                                .toStringAsFixed(1),
                            icon: Icons.timer,
                            color: AppTheme.warning,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Data table
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Mã NV')),
                              DataColumn(label: Text('Họ tên')),
                              DataColumn(label: Text('Loại')),
                              DataColumn(label: Text('Ngày công')),
                              DataColumn(label: Text('OT (h)')),
                              DataColumn(label: Text('Vắng')),
                              DataColumn(label: Text('Phép')),
                              DataColumn(label: Text('Chuyến')),
                              DataColumn(label: Text('Km')),
                            ],
                            rows: records
                                .map((r) => DataRow(cells: [
                                      DataCell(Text(r.employeeCode,
                                          style: const TextStyle(
                                              color: AppTheme.primaryLight,
                                              fontSize: 12))),
                                      DataCell(Text(r.employeeName,
                                          style: const TextStyle(fontSize: 12))),
                                      DataCell(Text(
                                          r.attendanceType == AttendanceType.office
                                              ? 'VP'
                                              : 'TX',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: r.attendanceType ==
                                                      AttendanceType.office
                                                  ? AppTheme.primaryLight
                                                  : AppTheme.accent))),
                                      DataCell(Text(
                                          r.workingDays == 0
                                              ? r.driverLeaveDays == 0
                                                  ? '—'
                                                  : '—'
                                              : r.workingDays.toStringAsFixed(1))),
                                      DataCell(
                                          Text(r.overtimeHours.toStringAsFixed(1))),
                                      DataCell(Text(r.leaveDays.toStringAsFixed(1))),
                                      DataCell(Text(r.annualLeaveDays
                                          .toStringAsFixed(1))),
                                      DataCell(Text('${r.totalTrips}')),
                                      DataCell(
                                          Text(r.totalKm.toStringAsFixed(0))),
                                    ]))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ═════════════ ĐƠN NGHỈ PHÉP (§8: Tạo đơn -> Duyệt/Từ chối) ═════════════

  void _showLeaveRequestsSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surface,
      isScrollControlled: true,
      builder: (ctx) => Consumer(builder: (context, sheetRef, _) {
        final leavesAsync = sheetRef.watch(leaveRequestsProvider);
        return SizedBox(
          height: MediaQuery.of(ctx).size.height * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Đơn nghỉ phép',
                    style: Theme.of(ctx)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: leavesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Lỗi: $e')),
                  data: (leaves) {
                    if (leaves.isEmpty) {
                      return const Center(child: Text('Chưa có đơn nào'));
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: leaves.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, i) {
                        final r = leaves[i];
                        final statusColor = switch (r.status) {
                          LeaveStatus.pending => Colors.orange,
                          LeaveStatus.approved => Colors.green,
                          LeaveStatus.rejected => Colors.red,
                          LeaveStatus.cancelled => Colors.grey,
                        };
                        final statusLabel = switch (r.status) {
                          LeaveStatus.pending => 'Chờ duyệt',
                          LeaveStatus.approved => 'Đã duyệt',
                          LeaveStatus.rejected => 'Từ chối',
                          LeaveStatus.cancelled => 'Đã hủy',
                        };
                        final df = DateFormat('dd/MM');
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Row(children: [
                            Expanded(
                                child: Text('${r.employeeName} · '
                                    '${df.format(r.fromDate)} - ${df.format(r.toDate)}'
                                    ' (${r.days} ngày)')),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(statusLabel,
                                  style: TextStyle(
                                      fontSize: 11, color: statusColor)),
                            ),
                          ]),
                          subtitle: Text(
                            '${_leaveTypeLabel(r.leaveType)}'
                            '${r.reason != null ? " · ${r.reason}" : ""}'
                            '${r.approvalNote != null ? "\nGhi chú: ${r.approvalNote}" : ""}',
                          ),
                          isThreeLine: r.approvalNote != null,
                          trailing: r.status == LeaveStatus.pending
                              ? Row(mainAxisSize: MainAxisSize.min, children: [
                                  IconButton(
                                    tooltip: 'Duyệt',
                                    icon: const Icon(Icons.check_circle,
                                        color: Colors.green),
                                    onPressed: () async {
                                      r.status = LeaveStatus.approved;
                                      r.approvedAt = DateTime.now();
                                      r.approverName = 'Quản lý';
                                      await DatabaseService.instance
                                          .saveLeaveRequest(r);
                                      // Trừ phép năm khi duyệt phép năm.
                                      if (r.leaveType == LeaveType.annual) {
                                        final emp = await DatabaseService
                                            .instance
                                            .getEmployeeById(r.employeeId);
                                        if (emp != null) {
                                          emp.annualLeaveUsed += r.days;
                                          await DatabaseService.instance
                                              .saveEmployee(emp);
                                        }
                                      }
                                      sheetRef.invalidate(leaveRequestsProvider);
                                    },
                                  ),
                                  IconButton(
                                    tooltip: 'Từ chối',
                                    icon: const Icon(Icons.cancel,
                                        color: Colors.redAccent),
                                    onPressed: () async {
                                      r.status = LeaveStatus.rejected;
                                      r.approvedAt = DateTime.now();
                                      r.approverName = 'Quản lý';
                                      await DatabaseService.instance
                                          .saveLeaveRequest(r);
                                      sheetRef.invalidate(leaveRequestsProvider);
                                    },
                                  ),
                                ])
                              : null,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  static String _leaveTypeLabel(LeaveType t) => switch (t) {
        LeaveType.annual => 'Phép năm',
        LeaveType.sick => 'Nghỉ ốm',
        LeaveType.maternity => 'Thai sản',
        LeaveType.unpaid => 'Không lương',
        LeaveType.holiday => 'Nghỉ lễ',
      };

  void _showAddAttendanceDialog(
      BuildContext context, WidgetRef ref, SelectedMonth month) {
    final empCodeCtrl = TextEditingController();
    final empNameCtrl = TextEditingController();
    final workingDaysCtrl = TextEditingController(text: '26');
    final otCtrl = TextEditingController(text: '0');
    final leaveCtrl = TextEditingController(text: '0');
    final tripsCtrl = TextEditingController(text: '0');
    final kmCtrl = TextEditingController(text: '0');
    final searchCtrl = TextEditingController();
    AttendanceType type = AttendanceType.office;
    int? selectedEmployeeId;
    int? selectedDriverId;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setS) => AlertDialog(
          title: const Text('Nhập chấm công'),
          content: SizedBox(
            width: 450,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SegmentedButton<AttendanceType>(
                    segments: const [
                      ButtonSegment(
                          value: AttendanceType.office,
                          label: Text('Văn phòng')),
                      ButtonSegment(
                          value: AttendanceType.driver, label: Text('Tài xế')),
                    ],
                    selected: {type},
                    onSelectionChanged: (s) {
                      setS(() {
                        type = s.first;
                        selectedEmployeeId = null;
                        selectedDriverId = null;
                        empCodeCtrl.clear();
                        empNameCtrl.clear();
                        searchCtrl.clear();
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: searchCtrl,
                    decoration: InputDecoration(
                      labelText: type == AttendanceType.office 
                          ? 'Tìm kiếm nhân viên' 
                          : 'Tìm kiếm tài xế',
                      hintText: 'Nhập mã hoặc tên để tìm kiếm',
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (value) => setS(() {}),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: type == AttendanceType.office
                        ? FutureBuilder<List<Employee>>(
                            future: ref.read(employeeListProvider.future),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text('Lỗi: ${snapshot.error}'));
                              }
                              
                              final searchTerm = searchCtrl.text.toLowerCase();
                              final employees = (snapshot.data ?? [])
                                  .where((e) =>
                                      e.employeeCode.toLowerCase().contains(searchTerm) ||
                                      e.fullName.toLowerCase().contains(searchTerm))
                                  .toList();
                              
                              if (employees.isEmpty) {
                                return const Center(child: Text('Không tìm thấy nhân viên'));
                              }
                              
                              return ListView.builder(
                                itemCount: employees.length,
                                itemBuilder: (context, index) {
                                  final emp = employees[index];
                                  final isSelected = selectedEmployeeId == emp.id;
                                  return ListTile(
                                    title: Text(emp.fullName),
                                    subtitle: Text('${emp.employeeCode} - ${emp.department}'),
                                    selected: isSelected,
                                    selectedTileColor: AppTheme.primaryBlue.withOpacity(0.2),
                                    onTap: () {
                                      setS(() {
                                        selectedEmployeeId = emp.id;
                                        empCodeCtrl.text = emp.employeeCode;
                                        empNameCtrl.text = emp.fullName;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          )
                        : Consumer(
                            builder: (context, ref, _) {
                              final driversAsync = ref.watch(driverNotifierProvider);
                              return driversAsync.when(
                                loading: () => const Center(child: CircularProgressIndicator()),
                                error: (e, _) => Center(child: Text('Lỗi: $e')),
                                data: (drivers) {
                                  final searchTerm = searchCtrl.text.toLowerCase();
                                  final driverList = drivers
                                      .where((d) =>
                                          d.employeeCode.toLowerCase().contains(searchTerm) ||
                                          d.fullName.toLowerCase().contains(searchTerm))
                                      .toList();
                                  
                                  if (driverList.isEmpty) {
                                    return const Center(child: Text('Không tìm thấy tài xế'));
                                  }
                                  
                                  return ListView.builder(
                                    itemCount: driverList.length,
                                    itemBuilder: (context, index) {
                                      final driver = driverList[index];
                                      final isSelected = selectedDriverId == driver.id;
                                      return ListTile(
                                        title: Text(driver.fullName),
                                        subtitle: Text('${driver.employeeCode} - Kinh nghiệm: ${driver.experienceYears} năm'),
                                        selected: isSelected,
                                        selectedTileColor: AppTheme.accent.withOpacity(0.2),
                                        onTap: () {
                                          setS(() {
                                            selectedDriverId = driver.id;
                                            empCodeCtrl.text = driver.employeeCode;
                                            empNameCtrl.text = driver.fullName;
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 8),
                  TextField(
                    controller: empCodeCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Mã nhân viên',
                      prefixIcon: Icon(Icons.badge),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: empNameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Họ tên',
                      prefixIcon: Icon(Icons.person),
                    ),
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  if (type == AttendanceType.office) ...[
                    TextField(
                      controller: workingDaysCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Ngày công'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: otCtrl,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Giờ tăng ca (OT)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: leaveCtrl,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'Ngày vắng'),
                    ),
                  ] else ...[
                    TextField(
                      controller: tripsCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Số chuyến'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: kmCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Số km'),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () async {
                final employeeId = type == AttendanceType.office 
                    ? selectedEmployeeId 
                    : selectedDriverId;
                if (employeeId == null) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Vui lòng chọn nhân viên/tài xế')),
                  );
                  return;
                }
                if (empCodeCtrl.text.trim().isEmpty) return;
                final a = Attendance()
                  ..employeeId = employeeId
                  ..employeeCode = empCodeCtrl.text.trim()
                  ..employeeName = empNameCtrl.text.trim()
                  ..year = month.year
                  ..month = month.month
                  ..attendanceType = type
                  ..workingDays =
                      double.tryParse(workingDaysCtrl.text) ?? 26
                  ..overtimeHours = double.tryParse(otCtrl.text) ?? 0
                  ..leaveDays = double.tryParse(leaveCtrl.text) ?? 0
                  ..totalTrips = int.tryParse(tripsCtrl.text) ?? 0
                  ..totalKm = double.tryParse(kmCtrl.text) ?? 0;

                await DatabaseService.instance.saveAttendance(a);
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                  ref.invalidate(attendanceByMonthProvider);
                }
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w800,
                        )),
                Text(label,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/vantai_driver.dart';
import '../providers/vantai_providers.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 4-5: Quản lý tài xế & phụ xe.
class VantaiDriversScreen extends ConsumerWidget {
  const VantaiDriversScreen({super.key});

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);
  static final _dateFmt = DateFormat('dd/MM/yyyy');

  Future<void> _edit(BuildContext context, WidgetRef ref,
      [VantaiDriver? existing]) async {
    final nameCtrl = TextEditingController(text: existing?.name);
    final phoneCtrl = TextEditingController(text: existing?.phone);
    final cccdCtrl = TextEditingController(text: existing?.cccd);
    final gplxCtrl = TextEditingController(text: existing?.licenseNumber);
    DriverRole role = existing?.role ?? DriverRole.DRIVER;
    String hangBang = existing?.licenseClass ?? 'E';
    DateTime? expiry = existing?.licenseExpiry;
    double salary = existing?.baseSalary ?? 12000000;
    double allowance = existing?.allowance ?? 1500000;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: Text(existing == null
              ? 'THÊM NHÂN SỰ'
              : 'SỬA: ${existing.name}'),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SegmentedButton<DriverRole>(
                  segments: const [
                    ButtonSegment(
                        value: DriverRole.DRIVER,
                        icon: Icon(Icons.badge),
                        label: Text('Tài xế')),
                    ButtonSegment(
                        value: DriverRole.ASSISTANT,
                        icon: Icon(Icons.airline_seat_recline_extra),
                        label: Text('Phụ xe')),
                  ],
                  selected: {role},
                  onSelectionChanged: (s) => setD(() => role = s.first),
                ),
                const SizedBox(height: 8),
                TextField(
                    controller: nameCtrl,
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'Họ tên *', border: OutlineInputBorder())),
                const SizedBox(height: 8),
                Row(children: [
                  Expanded(
                      child: TextField(
                          controller: phoneCtrl,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              labelText: 'Điện thoại',
                              border: OutlineInputBorder()))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextField(
                          controller: cccdCtrl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'CCCD',
                              border: OutlineInputBorder()))),
                ]),
                const SizedBox(height: 8),
                if (role == DriverRole.DRIVER)
                  Row(children: [
                    Expanded(
                        child: TextField(
                            controller: gplxCtrl,
                            decoration: const InputDecoration(
                                labelText: 'Số GPLX',
                                border: OutlineInputBorder()))),
                    const SizedBox(width: 8),
                    Expanded(
                        child: DropdownButtonFormField<String>(
                      value: hangBang,
                      decoration: const InputDecoration(
                          labelText: 'Hạng bằng',
                          border: OutlineInputBorder()),
                      items: ['B2', 'C1', 'C', 'D1', 'D2', 'E']
                          .map((h) =>
                              DropdownMenuItem(value: h, child: Text(h)))
                          .toList(),
                      onChanged: (v) => hangBang = v ?? 'E',
                    )),
                  ]),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.event_busy),
                  title: Text(expiry == null
                      ? 'Chọn hạn GPLX'
                      : 'Hạn GPLX: ${_dateFmt.format(expiry!)}'),
                  trailing: const Icon(Icons.edit_calendar),
                  onTap: () async {
                    final d = await showDatePicker(
                        context: ctx,
                        initialDate: expiry ??
                            DateTime.now().add(const Duration(days: 365)),
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 3650)));
                    if (d != null) setD(() => expiry = d);
                  },
                ),
                Row(children: [
                  Expanded(
                      child: TextFormField(
                    initialValue: '${salary.toInt()}',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Lương cơ bản (đ)',
                        border: OutlineInputBorder()),
                    onChanged: (v) => salary = double.tryParse(v) ?? salary,
                  )),
                  const SizedBox(width: 8),
                  Expanded(
                      child: TextFormField(
                    initialValue: '${allowance.toInt()}',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Phụ cấp (đ)', border: OutlineInputBorder()),
                    onChanged: (v) =>
                        allowance = double.tryParse(v) ?? allowance,
                  )),
                ]),
              ]),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: nameCtrl.text.trim().isEmpty
                    ? null
                    : () => Navigator.pop(ctx, true),
                child: const Text('Lưu')),
          ],
        ),
      ),
    );
    if (ok != true) return;
    final d = existing ?? (VantaiDriver()..driverId = const Uuid().v4());
    d.name = nameCtrl.text.trim();
    d.phone = phoneCtrl.text.trim();
    d.cccd = cccdCtrl.text.trim();
    d.role = role;
    d.licenseNumber = gplxCtrl.text.trim();
    d.licenseClass = role == DriverRole.ASSISTANT ? 'B2' : hangBang;
    d.licenseExpiry = expiry;
    d.baseSalary = salary;
    d.allowance = allowance;
    await ref.read(vantaiDriversProvider.notifier).upsert(d);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driversAsync = ref.watch(vantaiDriversProvider);
    final tripsAsync = ref.watch(vantaiTripsProvider);
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text('Tài Xế & Phụ Xe')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.person_add),
        label: const Text('Thêm'),
        onPressed: () => _edit(context, ref),
      ),
      body: driversAsync.when(
        data: (drivers) {
          if (drivers.isEmpty) {
            return const Center(child: Text('Chưa có nhân sự nào.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: drivers.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) {
              final d = drivers[i];
              final isDriver = d.role == DriverRole.DRIVER;
              final warn =
                  VantaiBusinessLogic.licenseExpiringSoon(d, now, withinDays: 60);
              // Thống kê chuyến đã chạy theo tên (seed dùng driverName)
              final tripCount = (tripsAsync.value ?? [])
                  .where((t) =>
                      t.driver.value?.driverId == d.driverId ||
                      (!isDriver && t.assistant.value?.driverId == d.driverId))
                  .length;
              final totalPay = d.baseSalary + d.allowance;
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        isDriver ? Colors.teal : Colors.deepOrange,
                    child: Icon(isDriver ? Icons.badge : Icons.support_agent,
                        color: Colors.white),
                  ),
                  title: Text(d.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      '${d.role.label} • ${d.phone.isEmpty ? "-" : d.phone}'
                      '${isDriver ? "\nGPLX: ${d.licenseNumber.isEmpty ? "-" : d.licenseNumber} (${d.licenseClass}) - Hạn: ${d.licenseExpiry != null ? _dateFmt.format(d.licenseExpiry!) : "-"}" : ""}'
                      '$tripCount chuyến • Lương + PC: ${_money.format(totalPay)}/tháng'
                      '${warn ? "\n⚠ GPLX sắp hết hạn!" : ""}'),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _edit(context, ref, d),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}

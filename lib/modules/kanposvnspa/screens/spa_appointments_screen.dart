import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/spa_appointment.dart';
import '../models/spa_bed.dart';
import '../models/spa_customer.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../providers/spa_operations_providers.dart';

/// Lịch hẹn (spec §4): theo ngày, tạo mới, đổi trạng thái.
class SpaAppointmentsScreen extends ConsumerStatefulWidget {
  const SpaAppointmentsScreen({super.key});

  @override ConsumerState<SpaAppointmentsScreen> createState() =>
      _SpaAppointmentsScreenState();
}

class _SpaAppointmentsScreenState extends ConsumerState<SpaAppointmentsScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final aptAsync = ref.watch(spaAppointmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lịch Hẹn')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => setState(() => _selectedDay =
                      _selectedDay.subtract(const Duration(days: 1))),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      DateFormat('EEEE, dd/MM/yyyy', 'vi').format(_selectedDay),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => setState(() =>
                      _selectedDay = _selectedDay.add(const Duration(days: 1))),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.today, size: 18),
                  label: const Text('Hôm nay'),
                  onPressed: () =>
                      setState(() => _selectedDay = DateTime.now()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,
                    foregroundColor: Colors.white),
                icon: const Icon(Icons.add),
                label: const Text('Đặt lịch'),
                onPressed: () => _showCreateDialog(context),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: aptAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (apts) {
                final dayApts = apts.where((a) {
                  final d = a.startTime;
                  return d.year == _selectedDay.year &&
                      d.month == _selectedDay.month &&
                      d.day == _selectedDay.day;
                }).toList();
                if (dayApts.isEmpty) {
                  return const Center(child: Text('Không có lịch hẹn nào trong ngày'));
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: dayApts.length,
                  itemBuilder: (_, i) => _AppointmentCard(apt: dayApts[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final services = ref.read(spaServicesProvider).value ?? [];
    final techs = ref.read(spaTechsProvider).value ?? [];
    final customers = ref.read(spaCustomersProvider).value ?? [];
    final beds = ref.read(spaBedsProvider).value ?? [];

    SpaCustomer? cus;
    SpaServiceModel? svc;
    SpaTechnician? tech;
    SpaBed? bed;
    TimeOfDay time = TimeOfDay.now();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDState) => AlertDialog(
          title: const Text('Đặt lịch hẹn'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<SpaCustomer>(
                    decoration: const InputDecoration(labelText: 'Khách hàng'),
                    value: cus,
                    items: customers
                        .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                        .toList(),
                    onChanged: (v) => setDState(() => cus = v),
                  ),
                  DropdownButtonFormField<SpaServiceModel>(
                    decoration: const InputDecoration(labelText: 'Dịch vụ'),
                    value: svc,
                    items: services
                        .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                        .toList(),
                    onChanged: (v) => setDState(() => svc = v),
                  ),
                  DropdownButtonFormField<SpaTechnician>(
                    decoration: const InputDecoration(labelText: 'Kỹ thuật viên'),
                    value: tech,
                    items: techs
                        .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
                        .toList(),
                    onChanged: (v) => setDState(() => tech = v),
                  ),
                  DropdownButtonFormField<SpaBed>(
                    decoration: const InputDecoration(labelText: 'Giường'),
                    value: bed,
                    items: beds
                        .map((b) => DropdownMenuItem(
                            value: b, child: Text('${b.name} - ${b.room}')))
                        .toList(),
                    onChanged: (v) => setDState(() => bed = v),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            'Giờ: ${time.format(context)}',
                            style: const TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () async {
                          final t = await showTimePicker(
                              context: ctx, initialTime: time);
                          if (t != null) setDState(() => time = t);
                        },
                        child: const Text('Chọn giờ'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Huỷ')),
            ElevatedButton(
              onPressed: (cus != null && svc != null && tech != null && bed != null)
                  ? () {
                      final start = DateTime(_selectedDay.year, _selectedDay.month,
                          _selectedDay.day, time.hour, time.minute);
                      final end =
                          start.add(Duration(minutes: svc!.durationMinutes));
                      ref.read(spaAppointmentsProvider.notifier).add(SpaAppointment()
                        ..appointmentId = const Uuid().v4()
                        ..customerId = cus!.customerId
                        ..customerName = cus!.name
                        ..serviceId = svc!.serviceId
                        ..serviceName = svc!.name
                        ..technicianId = tech!.techId
                        ..technicianName = tech!.name
                        ..bedId = bed!.bedId
                        ..bedName = bed!.name
                        ..startTime = start
                        ..endTime = end);
                      Navigator.pop(ctx);
                    }
                  : null,
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppointmentCard extends ConsumerWidget {
  final SpaAppointment apt;
  const _AppointmentCard({required this.apt});

  Color get _statusColor => switch (apt.status) {
        SpaAppointmentStatus.BOOKED => Colors.blue,
        SpaAppointmentStatus.IN_SERVICE => Colors.purple,
        SpaAppointmentStatus.COMPLETED => Colors.green,
        SpaAppointmentStatus.CANCELLED => Colors.red,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _statusColor.withOpacity(.15),
          child: Text(DateFormat('HH').format(apt.startTime),
              style: TextStyle(color: _statusColor, fontWeight: FontWeight.bold)),
        ),
        title: Text('${apt.customerName} — ${apt.serviceName}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            '${DateFormat('HH:mm').format(apt.startTime)} - ${DateFormat('HH:mm').format(apt.endTime)}'
            ' • KTV: ${apt.technicianName} • ${apt.bedName}'),
        trailing: PopupMenuButton<String>(
          onSelected: (v) {
            final notifier = ref.read(spaAppointmentsProvider.notifier);
            switch (v) {
              case 'service':
                notifier.updateStatus(apt, SpaAppointmentStatus.IN_SERVICE);
              case 'done':
                notifier.updateStatus(apt, SpaAppointmentStatus.COMPLETED);
              case 'cancel':
                notifier.updateStatus(apt, SpaAppointmentStatus.CANCELLED);
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'service', child: Text('Bắt đầu phục vụ')),
            PopupMenuItem(value: 'done', child: Text('Hoàn thành')),
            PopupMenuItem(value: 'cancel', child: Text('Huỷ lịch')),
          ],
        ),
      ),
    );
  }
}

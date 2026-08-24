import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/vantai_trip.dart';
import '../models/vantai_route.dart';
import '../models/vantai_vehicle.dart';
import '../models/vantai_driver.dart';
import '../models/vantai_ticket.dart';
import '../providers/vantai_providers.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 6 + 12: Lịch chạy & Điều xe — phân xe theo tuyến/xe/tài xế,
/// tạo chuyến mới, xuất bến / hoàn thành / hủy.
class VantaiDispatchScreen extends ConsumerWidget {
  const VantaiDispatchScreen({super.key});

  static final _dateFmt = DateFormat('dd/MM HH:mm');

  Future<void> _createTrip(BuildContext context, WidgetRef ref) async {
    final routes = ref.read(vantaiRoutesProvider).value ?? [];
    final vehicles = ref.read(vantaiVehiclesProvider).value ?? [];
    final drivers = ref.read(vantaiDriversProvider).value ?? [];
    if (routes.isEmpty || vehicles.isEmpty || drivers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Cần có sẵn tuyến, xe và tài xế.'),
          backgroundColor: Colors.red));
      return;
    }

    VantaiRoute? route;
    VantaiVehicle? vehicle;
    VantaiDriver? driver;
    VantaiDriver? assistant;
    DateTime departure = DateTime.now().add(const Duration(hours: 2));

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setD) => AlertDialog(
          title: const Text('TẠO CHUYẾN MỚI'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                DropdownButtonFormField<VantaiRoute>(
                  value: route,
                  isExpanded: true,
                  decoration: const InputDecoration(
                      labelText: 'Tuyến *', border: OutlineInputBorder()),
                  items: routes
                      .map((r) => DropdownMenuItem(value: r, child: Text(r.routeName)))
                      .toList(),
                  onChanged: (v) => setD(() => route = v),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<VantaiVehicle>(
                  value: vehicle,
                  isExpanded: true,
                  decoration: const InputDecoration(
                      labelText:
                          'Xe * (chỉ xe đang hoạt động)', border: OutlineInputBorder()),
                  items: vehicles
                      .where((v) => v.status == VehicleStatus.ACTIVE)
                      .map((v) => DropdownMenuItem(
                          value: v,
                          child: Text(
                              '${v.plateNumber} - ${v.type.label} (${v.totalSeats} chỗ)')))
                      .toList(),
                  onChanged: (v) => setD(() => vehicle = v),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<VantaiDriver>(
                  value: driver,
                  isExpanded: true,
                  decoration: const InputDecoration(
                      labelText: 'Tài xế *', border: OutlineInputBorder()),
                  items: drivers
                      .where((d) => d.role == DriverRole.DRIVER)
                      .map((d) =>
                          DropdownMenuItem(value: d, child: Text(d.name)))
                      .toList(),
                  onChanged: (v) => setD(() => driver = v),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<VantaiDriver?>(
                  value: assistant,
                  isExpanded: true,
                  decoration: const InputDecoration(
                      labelText: 'Phụ xe (tùy chọn)',
                      border: OutlineInputBorder()),
                  items: [
                    const DropdownMenuItem(
                        value: null, child: Text('— Không —')),
                    ...drivers
                        .where((d) => d.role == DriverRole.ASSISTANT)
                        .map((d) =>
                            DropdownMenuItem(value: d, child: Text(d.name))),
                  ],
                  onChanged: (v) => setD(() => assistant = v),
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.departure_board),
                  title:
                      Text('Xuất bến: ${_dateFmt.format(departure)}'),
                  trailing: const Icon(Icons.edit_calendar),
                  onTap: () async {
                    final date = await showDatePicker(
                        context: ctx,
                        initialDate: departure,
                        firstDate: DateTime.now()
                            .subtract(const Duration(days: 1)),
                        lastDate:
                            DateTime.now().add(const Duration(days: 60)));
                    if (date != null && ctx.mounted) {
                      final t = await showTimePicker(
                          context: ctx,
                          initialTime: TimeOfDay.fromDateTime(departure));
                      if (t != null) {
                        setD(() => departure =
                            DateTime(date.year, date.month, date.day, t.hour, t.minute));
                      }
                    }
                  },
                ),
              ]),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Hủy')),
            FilledButton(
                onPressed: route == null || vehicle == null || driver == null
                    ? null
                    : () => Navigator.pop(ctx, true),
                child: const Text('Lập lịch')),
          ],
        ),
      ),
    );
    if (ok != true || route == null || vehicle == null || driver == null) return;

    // Kiểm tra trùng giờ điều hành (±2 tiếng)
    final bookedTrips = (ref.read(vantaiTripsProvider).value ?? []);
    final vehicleBusy = bookedTrips.any((t) =>
        t.vehicle.value?.vehicleId == vehicle!.vehicleId &&
        t.status != TripStatus.CANCELLED &&
        t.departureTime != null &&
        t.departureTime!
            .difference(departure)
            .abs() <
            const Duration(hours: 4));
    if (vehicleBusy && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Xe ${vehicle!.plateNumber} đã có chuyến trong khung giờ này!'),
          backgroundColor: Colors.red));
      return;
    }
    final pickedRoute = route;
    final pickedVehicle = vehicle;
    final pickedDriver = driver;
    if (pickedRoute == null || pickedVehicle == null || pickedDriver == null) {
      return;
    }

    final trip = VantaiTrip()
      ..tripId = const Uuid().v4()
      ..departureTime = departure
      ..arrivalTime =
          departure.add(Duration(hours: (pickedRoute.distanceKm / 40).ceil()))
      ..status = TripStatus.SCHEDULED
      ..driverName = pickedDriver.name
      ..assistantName = assistant?.name ?? '';
    trip.route.value = pickedRoute;
    trip.vehicle.value = pickedVehicle;
    trip.driver.value = pickedDriver;
    if (assistant != null) trip.assistant.value = assistant;

    await ref.read(vantaiTripsProvider.notifier).createTrip(trip: trip);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Đã lập chuyến ${pickedRoute.routeName} - ${_dateFmt.format(departure)}'),
          backgroundColor: Colors.green));
    }
  }

  /// Mục 12: Phân xe tự động — đề xuất chuyến cho tuyến còn thiếu xe/tài xế
  /// trong hôm nay dựa trên xe rảnh + tài xế rảnh.
  Future<void> _autoDispatch(BuildContext context, WidgetRef ref) async {
    final routes = ref.read(vantaiRoutesProvider).value ?? [];
    final vehicles = (ref.read(vantaiVehiclesProvider).value ?? [])
        .where((v) => v.status == VehicleStatus.ACTIVE)
        .toList();
    final drivers = ref.read(vantaiDriversProvider).value ?? [];
    final trips = ref.read(vantaiTripsProvider).value ?? [];

    int created = 0;
    for (final r in routes) {
      final proposal = VantaiBusinessLogic.proposeAssignment(
        vehicles: vehicles,
        drivers: drivers,
        busyVehicles: [
          for (final t in trips)
            if (t.vehicle.value != null &&
                t.status != TripStatus.CANCELLED &&
                t.departureTime != null &&
                t.departureTime!.isBefore(DateTime.now().add(const Duration(days: 2))) &&
                t.departureTime!.isAfter(DateTime.now().subtract(const Duration(hours: 4))))
              t.vehicle.value!,
        ],
        busyDrivers: [
          for (final t in trips)
            if (t.driver.value != null &&
                t.status != TripStatus.CANCELLED &&
                t.departureTime != null &&
                t.departureTime!.isBefore(DateTime.now().add(const Duration(days: 2))) &&
                t.departureTime!.isAfter(DateTime.now().subtract(const Duration(hours: 4))))
              t.driver.value!,
        ],
        departure: DateTime.now().add(Duration(days: 1, hours: created)),
        minSeats: 20,
      );
      if (proposal == null) continue;

      // Không tạo trùng: mỗi tuyến tối đa 1 chuyến tự động/ngày mai
      final exists = trips.any((t) =>
          t.route.value?.routeId == r.routeId &&
          t.status != TripStatus.CANCELLED &&
          t.departureTime != null &&
          t.departureTime!.day ==
              DateTime.now().add(const Duration(days: 1)).day);
      if (exists) continue;

      final dep =
          DateTime.now().add(Duration(days: 1, hours: 6 + created * 3));
      final trip = VantaiTrip()
        ..tripId = const Uuid().v4()
        ..departureTime = dep
        ..arrivalTime =
            dep.add(Duration(hours: (r.distanceKm / 40).ceil()))
        ..status = TripStatus.SCHEDULED
        ..driverName = proposal.driver.name
        ..assistantName = proposal.assistant?.name ?? '';
      trip.route.value = r;
      trip.vehicle.value = proposal.vehicle;
      trip.driver.value = proposal.driver;
      if (proposal.assistant != null) {
        trip.assistant.value = proposal.assistant;
      }
      await ref.read(vantaiTripsProvider.notifier).createTrip(trip: trip);
      created++;
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(created > 0
              ? 'Đã tự động phân $created chuyến cho ngày mai.'
              : 'Không còn tổ hợp xe/tài xế rảnh để phân thêm.'),
          backgroundColor: created > 0 ? Colors.green : Colors.orange));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(vantaiTripsProvider);
    final ticketsAsync = ref.watch(vantaiTicketsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Điều Xe & Lịch Chạy')),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton.small(
          heroTag: 'auto',
          tooltip: 'Phân xe tự động cho ngày mai',
          onPressed: () => _autoDispatch(context, ref),
          child: const Icon(Icons.auto_fix_high),
        ),
        const SizedBox(height: 8),
        FloatingActionButton.extended(
          heroTag: 'new',
          icon: const Icon(Icons.post_add),
          label: const Text('Tạo chuyến'),
          onPressed: () => _createTrip(context, ref),
        ),
      ]),
      body: tripsAsync.when(
        data: (trips) {
          if (trips.isEmpty) return const Center(child: Text('Chưa có chuyến nào.'));
          final sorted = List<VantaiTrip>.from(trips)
            ..sort((a, b) => (b.departureTime ?? DateTime(2000))
                .compareTo(a.departureTime ?? DateTime(2000)));
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: sorted.length,
            itemBuilder: (_, i) {
              final trip = sorted[i];
              final soldCount = (ticketsAsync.value ?? [])
                  .where((t) =>
                      t.trip.value?.id == trip.id &&
                      t.status != TicketStatus.CANCELLED)
                  .length;
              final capacity = trip.vehicle.value?.totalSeats ?? 0;
              Color statusColor = switch (trip.status) {
                TripStatus.SCHEDULED => Colors.blue,
                TripStatus.RUNNING => Colors.orange,
                TripStatus.COMPLETED => Colors.green,
                TripStatus.CANCELLED => Colors.red,
              };
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: statusColor,
                    child: const Icon(Icons.directions_bus, color: Colors.white),
                  ),
                  title: Text(
                      '${trip.route.value?.routeName ?? "?"} • ${trip.departureTime != null ? _dateFmt.format(trip.departureTime!) : "chưa có giờ"}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Xe: ${trip.vehicle.value?.plateNumber ?? "-"} • Tài xế: ${trip.driverName}'
                      '${trip.assistantName.isNotEmpty ? " • Phụ xe: ${trip.assistantName}" : ""}\n'
                      'Đã bán $soldCount/$capacity vé'
                      '${trip.arrivalTime != null ? " • Đến: ${_dateFmt.format(trip.arrivalTime!)}" : ""}'),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (v) async {
                      switch (v) {
                        case 'depart':
                          await ref
                              .read(vantaiTripsProvider.notifier)
                              .updateStatus(TripStatus.RUNNING, trip);
                          break;
                        case 'complete':
                          await ref
                              .read(vantaiTripsProvider.notifier)
                              .updateStatus(TripStatus.COMPLETED, trip,
                                  arrival: DateTime.now());
                          break;
                        case 'cancel':
                          await ref
                              .read(vantaiTripsProvider.notifier)
                              .updateStatus(TripStatus.CANCELLED, trip);
                          break;
                      }
                    },
                    itemBuilder: (_) => [
                      if (trip.status == TripStatus.SCHEDULED)
                        const PopupMenuItem(
                            value: 'depart', child: Text('Xuất bến (Đang chạy)')),
                      if (trip.status == TripStatus.RUNNING)
                        const PopupMenuItem(
                            value: 'complete', child: Text('Hoàn thành')),
                      if (trip.status != TripStatus.COMPLETED &&
                          trip.status != TripStatus.CANCELLED)
                        const PopupMenuItem(value: 'cancel', child: Text('Hủy chuyến')),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

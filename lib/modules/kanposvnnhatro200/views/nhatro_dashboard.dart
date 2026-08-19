import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../providers/nhatro_providers.dart';
import '../models/room.dart';
import '../models/tenant.dart';
import '../models/contract.dart';
import '../models/payment.dart';
import '../models/expense.dart';

class NhaTroDashboard extends ConsumerStatefulWidget {
  const NhaTroDashboard({super.key});

  @override
  ConsumerState<NhaTroDashboard> createState() => _NhaTroDashboardState();
}

class _NhaTroDashboardState extends ConsumerState<NhaTroDashboard> {
  Map<String, dynamic> _m = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final isar = await ref.read(nhatroIsarProvider.future);
      final now = DateTime.now();
      final monthStart = DateTime(now.year, now.month, 1);

      final rooms = await isar.rooms.where().anyId().findAll();
      final tenants = await isar.tenants.where().anyId().findAll();
      final contracts = await isar.contracts.where().anyId().findAll();
      final payments = await isar.payments.where().anyId().findAll();
      final expenses = await isar.hostelExpenses.where().anyId().findAll();

      final rentedRooms = rooms.where((r) => r.status == RoomStatus.rented).length;
      final emptyRooms = rooms.where((r) => r.status == RoomStatus.empty).length;
      final repairingRooms = rooms.where((r) => r.status == RoomStatus.repairing).length;
      final reservedRooms = rooms.where((r) => r.status == RoomStatus.reserved).length;

      final monthPayments = payments.where((p) =>
          p.paymentDate != null && p.paymentDate!.isAfter(monthStart)).toList();
      final monthRevenue = monthPayments.fold<double>(0, (s, p) => s + (p.paidAmount ?? 0));
      final monthExpenses = expenses.where((e) =>
          e.expenseDate != null && e.expenseDate!.isAfter(monthStart)).fold<double>(0, (s, e) => s + (e.amount ?? 0));
      final totalDebt = payments.fold<double>(0, (s, p) => s + (p.debtAmount ?? 0));
      final electricDebt = payments.where((p) => (p.debtAmount ?? 0) > 0).fold<double>(0, (s, p) => s + (p.electricAmount ?? 0));

      final occupancyRate = rooms.isNotEmpty ? (rentedRooms / rooms.length * 100).toStringAsFixed(0) : '0';

      setState(() {
        _m = {
          'totalRooms': rooms.length,
          'rentedRooms': rentedRooms,
          'emptyRooms': emptyRooms,
          'repairingRooms': repairingRooms,
          'reservedRooms': reservedRooms,
          'tenantCount': tenants.length,
          'contractCount': contracts.length,
          'monthRevenue': monthRevenue,
          'monthExpenses': monthExpenses,
          'profit': monthRevenue - monthExpenses,
          'totalDebt': totalDebt,
          'electricDebt': electricDebt,
          'occupancyRate': occupancyRate,
        };
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  String _fmt(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
      buf.write(s[i]);
    }
    return '$buf';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _sectionTitle('TÌNH HÌNH PHÒNG', Colors.blue),
          Row(children: [
            _card('Tổng phòng', '${_m['totalRooms'] ?? 0}', Colors.blue, Icons.door_front_door),
            _card('Đã thuê', '${_m['rentedRooms'] ?? 0}', Colors.green, Icons.check_circle),
            _card('Trống', '${_m['emptyRooms'] ?? 0}', Colors.orange, Icons.circle_outlined),
          ]),
          Row(children: [
            _card('Sửa chữa', '${_m['repairingRooms'] ?? 0}', Colors.red, Icons.build),
            _card('Giữ chỗ', '${_m['reservedRooms'] ?? 0}', Colors.purple, Icons.bookmark),
            _card('Lấp đầy', '${_m['occupancyRate'] ?? 0}%', Colors.teal, Icons.pie_chart),
          ]),

          const SizedBox(height: 12),
          _sectionTitle('DOANH THU THÁNG', Colors.green),
          Row(children: [
            _card('Thu tháng', _fmt(_m['monthRevenue'] ?? 0), Colors.green, Icons.trending_up),
            _card('Chi tháng', _fmt(_m['monthExpenses'] ?? 0), Colors.red, Icons.trending_down),
            _card('Lợi nhuận', _fmt(_m['profit'] ?? 0), (_m['profit'] ?? 0) >= 0 ? Colors.teal : Colors.red, Icons.pie_chart),
          ]),

          const SizedBox(height: 12),
          _sectionTitle('CÔNG NỢ', Colors.red),
          Row(children: [
            _card('Nợ tổng', _fmt(_m['totalDebt'] ?? 0), Colors.red, Icons.money_off),
            _card('Nợ điện', _fmt(_m['electricDebt'] ?? 0), Colors.orange, Icons.electric_bolt),
            _card('KH', '${_m['tenantCount'] ?? 0}', Colors.purple, Icons.people),
          ]),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _card(String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}

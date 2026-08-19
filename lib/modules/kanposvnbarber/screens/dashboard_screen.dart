import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../providers/barber_service_provider.dart';
import '../models/barber_invoice.dart';
import '../models/barber_appointment.dart';
import '../models/barber_customer.dart';
import '../models/barber_expense.dart';
import '../../../core/widgets/owner_info_bar.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
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
      final isar = await ref.read(barberIsarProvider.future);
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final monthStart = DateTime(now.year, now.month, 1);

      // Invoices
      final allInvoices = await isar.barberInvoices.where().anyId().findAll();
      final todayInvoices = allInvoices.where((i) => i.createdAt.isAfter(todayStart)).toList();
      final monthInvoices = allInvoices.where((i) => i.createdAt.isAfter(monthStart)).toList();

      final todayRevenue = todayInvoices.fold<double>(0, (s, i) => s + i.total);
      final monthRevenue = monthInvoices.fold<double>(0, (s, i) => s + i.total);

      // Expenses
      final allExpenses = await isar.barberExpenses.where().anyId().findAll();
      final monthExpenses = allExpenses.where((e) => e.createdAt.isAfter(monthStart)).fold<double>(0, (s, e) => s + e.amount);
      final todayExpenses = allExpenses.where((e) => e.createdAt.isAfter(todayStart)).fold<double>(0, (s, e) => s + e.amount);

      // Appointments
      final allApts = await isar.barberAppointments.where().anyId().findAll();
      final todayApts = allApts.where((a) => a.appointmentDate.isAfter(todayStart) && a.appointmentDate.isBefore(todayStart.add(const Duration(days: 1)))).toList();
      final waitingCount = todayApts.where((a) => a.status == 'Chờ xác nhận').length;
      final confirmedCount = todayApts.where((a) => a.status == 'Đã xác nhận').length;
      final servingCount = todayApts.where((a) => a.status == 'Đang phục vụ').length;

      // Customers
      final customerCount = await isar.barberCustomers.count();
      final customers = await isar.barberCustomers.where().anyId().findAll();
      final vipCount = customers.where((c) => c.totalSpent >= 1000000).length;

      setState(() {
        _m = {
          'todayRevenue': todayRevenue,
          'monthRevenue': monthRevenue,
          'monthExpenses': monthExpenses,
          'profit': monthRevenue - monthExpenses,
          'todayExpenses': todayExpenses,
          'invoiceCount': allInvoices.length,
          'todayInvoiceCount': todayInvoices.length,
          'aptCount': todayApts.length,
          'waitingCount': waitingCount,
          'confirmedCount': confirmedCount,
          'servingCount': servingCount,
          'customerCount': customerCount,
          'vipCount': vipCount,
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
    return '$buf' 'đ';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const OwnerInfoBar(),
          const SizedBox(height: 8),

          _sectionTitle('DOANH THU HÔM NAY', Colors.blue),
          Row(children: [
            _card('Thu hôm nay', _fmt(_m['todayRevenue'] ?? 0), Colors.green, Icons.trending_up),
            _card('Chi hôm nay', _fmt(_m['todayExpenses'] ?? 0), Colors.red, Icons.trending_down),
            _card('Lịch hẹn', '${_m['aptCount'] ?? 0}', Colors.orange, Icons.calendar_today),
          ]),

          const SizedBox(height: 12),
          _sectionTitle('LỊCH HẸN HÔM NAY', Colors.deepOrange),
          Row(children: [
            _card('Chờ xác nhận', '${_m['waitingCount'] ?? 0}', Colors.grey, Icons.schedule),
            _card('Đã xác nhận', '${_m['confirmedCount'] ?? 0}', Colors.blue, Icons.check_circle_outline),
            _card('Đang phục vụ', '${_m['servingCount'] ?? 0}', Colors.deepOrange, Icons.content_cut),
          ]),

          const SizedBox(height: 12),
          _sectionTitle('THU CHI THÁNG', Colors.teal),
          Row(children: [
            _card('Thu tháng', _fmt(_m['monthRevenue'] ?? 0), Colors.teal, Icons.show_chart),
            _card('Chi tháng', _fmt(_m['monthExpenses'] ?? 0), Colors.orange, Icons.bar_chart),
            _card('Lợi nhuận', _fmt(_m['profit'] ?? 0),
                (_m['profit'] ?? 0) >= 0 ? Colors.green : Colors.red, Icons.pie_chart),
          ]),

          const SizedBox(height: 12),
          _sectionTitle('KHÁCH HÀNG', Colors.purple),
          Row(children: [
            _card('Tổng KH', '${_m['customerCount'] ?? 0}', Colors.purple, Icons.people),
            _card('KH VIP', '${_m['vipCount'] ?? 0}', Colors.amber, Icons.star),
            _card('Hóa đơn', '${_m['invoiceCount'] ?? 0}', Colors.indigo, Icons.receipt_long),
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

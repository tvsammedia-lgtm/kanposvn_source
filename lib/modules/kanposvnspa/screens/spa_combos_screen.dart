import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/spa_combo.dart';
import '../models/spa_customer.dart';
import '../models/spa_service_model.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../providers/spa_operations_providers.dart';

/// Combo liệu trình (spec §9): bán combo, theo dõi đã dùng / còn lại / hết hạn.
class SpaCombosScreen extends ConsumerWidget {
  const SpaCombosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final combosAsync = ref.watch(spaCombosProvider);
    final currency =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combo Liệu Trình'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            tooltip: 'Bán combo mới',
            onPressed: () => _showSellDialog(context, ref),
          ),
        ],
      ),
      body: combosAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
        data: (combos) {
          if (combos.isEmpty) {
            return const Center(child: Text('Chưa có combo nào'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: combos.length,
            itemBuilder: (_, i) {
              final c = combos[i];
              final progress = c.totalSessions > 0
                  ? c.usedCount / c.totalSessions
                  : 0.0;
              final expired = c.isExpired;
              final done = c.remaining <= 0;

              Color statusColor = Colors.green;
              String statusText = 'Còn ${c.remaining} buổi';
              if (expired) {
                statusColor = Colors.red;
                statusText = 'Đã hết hạn';
              } else if (done) {
                statusColor = Colors.blueGrey;
                statusText = 'Đã dùng hết';
              }

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(c.name,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                                color: statusColor.withOpacity(.12),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(statusText,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: statusColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Khách: ${c.customerName} • ${c.serviceName}',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[600])),
                      Text(
                          'Giá: ${currency.format(c.price)}'
                          '${c.expiryDate != null ? ' • Hạn: ${DateFormat('dd/MM/yyyy').format(c.expiryDate!)}' : ''}',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[600])),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: progress.clamp(0.0, 1.0),
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(4),
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  expired ? Colors.red : Colors.pink),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text('${c.usedCount}/${c.totalSessions}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showSellDialog(BuildContext context, WidgetRef ref) {
    final services = ref.read(spaServicesProvider).value ?? [];
    final customers = ref.read(spaCustomersProvider).value ?? [];

    SpaCustomer? cus;
    SpaServiceModel? svc;
    int bonus = 2;
    double price = 0;
    DateTime expiry = DateTime.now().add(const Duration(days: 90));

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDState) => AlertDialog(
          title: const Text('Bán combo liệu trình'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<SpaCustomer>(
                    decoration:
                        const InputDecoration(labelText: 'Khách hàng'),
                    value: cus,
                    items: customers
                        .map((c) =>
                            DropdownMenuItem(value: c, child: Text(c.name)))
                        .toList(),
                    onChanged: (v) => setDState(() => cus = v),
                  ),
                  DropdownButtonFormField<SpaServiceModel>(
                    decoration: const InputDecoration(labelText: 'Dịch vụ'),
                    value: svc,
                    items: services
                        .map((s) =>
                            DropdownMenuItem(value: s, child: Text(s.name)))
                        .toList(),
                    onChanged: (v) => setDState(() {
                      svc = v;
                      if (v != null && price == 0) {
                        price = v.price * 10; // mặc định giá 10 buổi
                      }
                    }),
                  ),
                  Row(
                    children: [
                      const Text('Số buổi tặng:'),
                      Expanded(
                        child: Slider(
                          value: bonus.toDouble(),
                          min: 0,
                          max: 10,
                          divisions: 10,
                          label: '$bonus',
                          onChanged: (v) => setDState(() => bonus = v.round()),
                        ),
                      ),
                      Text('$bonus buổi'),
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Giá combo (₫)'),
                    keyboardType: TextInputType.number,
                    initialValue:
                        price == 0 ? '' : price.toStringAsFixed(0),
                    onChanged: (v) =>
                        price = double.tryParse(v.replaceAll(',', '')) ?? 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Hạn sử dụng'),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(expiry)),
                    trailing: const Icon(Icons.calendar_today, size: 18),
                    onTap: () async {
                      final d = await showDatePicker(
                        context: ctx,
                        initialDate: expiry,
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 3650)),
                      );
                      if (d != null) setDState(() => expiry = d);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx), child: const Text('Huỷ')),
            ElevatedButton(
              onPressed: (cus != null && svc != null)
                  ? () {
                      ref.read(spaCombosProvider.notifier).add(SpaCombo()
                        ..comboId = const Uuid().v4()
                        ..name =
                            'Combo ${svc!.name} ${10 + bonus} tặng $bonus'
                        ..serviceId = svc!.serviceId
                        ..serviceName = svc!.name
                        ..totalSessions = 10 + bonus
                        ..bonusSessions = bonus
                        ..price = price
                        ..customerId = cus!.customerId
                        ..customerName = cus!.name
                        ..purchaseDate = DateTime.now()
                        ..expiryDate = expiry);
                      Navigator.pop(ctx);
                    }
                  : null,
              child: const Text('Bán'),
            ),
          ],
        ),
      ),
    );
  }
}

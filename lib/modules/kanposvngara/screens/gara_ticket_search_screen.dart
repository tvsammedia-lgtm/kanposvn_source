import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../models/gara_repair_order.dart';
import '../providers/gara_providers.dart';
import '../services/gara_receipt_printer.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/printer_service.dart';

class GaraTicketSearchScreen extends ConsumerStatefulWidget {
  const GaraTicketSearchScreen({super.key});

  @override
  ConsumerState<GaraTicketSearchScreen> createState() => _GaraTicketSearchScreenState();
}

class _GaraTicketSearchScreenState extends ConsumerState<GaraTicketSearchScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';

  final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<GaraRepairOrder> _filterOrders(List<GaraRepairOrder> orders) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return orders;

    return orders.where((o) {
      final customer = o.customer.value;
      final vehicle = o.vehicle.value;
      if (o.orderCode.toLowerCase().contains(q)) return true;
      if (customer != null && customer.name.toLowerCase().contains(q)) return true;
      if (vehicle != null && vehicle.licensePlate.toLowerCase().contains(q)) return true;
      return false;
    }).toList();
  }

  Future<void> _printTicket(GaraRepairOrder order) async {
    try {
      await order.customer.load();
      await order.vehicle.load();
      await order.details.load();
      final details = order.details.toList();
      for (final d in details) {
        await d.product.load();
      }
      await printGaraReceiptPdf(order, details);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('In phiếu thất bại: $e')));
      }
    }
  }

  void _showOrderDetail(GaraRepairOrder order) {
    final customer = order.customer.value;
    final vehicle = order.vehicle.value;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Phiếu ${order.orderCode}'),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ngày: ${DateFormat('dd/MM/yyyy HH:mm').format(order.orderDate ?? DateTime.now())}'),
                if (customer != null && customer.name.isNotEmpty)
                  Text('Khách: ${customer.name}'),
                if (vehicle != null && vehicle.licensePlate.isNotEmpty)
                  Text('Biển số: ${vehicle.licensePlate}'),
                if (order.currentKm > 0)
                  Text('Số km: ${order.currentKm}'),
                Text('Trạng thái: ${order.status.label}'),
                const Divider(),
                _ReceiptDetailList(order: order),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tổng cộng:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(_currency.format(order.totalAmount), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.teal)),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Đóng')),
          OutlinedButton.icon(
            icon: const Icon(Icons.print_outlined, size: 18),
            label: const Text('In 80mm'),
            onPressed: () {
              Navigator.pop(ctx);
              _printTicket80(order);
            },
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            icon: const Icon(Icons.print, color: Colors.white, size: 18),
            label: const Text('In lại', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(ctx);
              _printTicket(order);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _printTicket80(GaraRepairOrder order) async {
    try {
      final printer = ref.read(printerSettingsProvider).settings;
      if (!printer.isConfigured) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Chưa cấu hình máy in 80mm. Vào Cài đặt → Máy in để cấu hình.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }
      await order.customer.load();
      await order.vehicle.load();
      await order.details.load();
      final details = order.details.toList();
      for (final d in details) {
        await d.product.load();
      }
      await printReceipt80(context, ref, await buildGaraReceiptData(order, details));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('In phiếu 80mm thất bại: $e')));
      }
    }
  }

  void _openQrScanner() {
    if (!Platform.isAndroid && !Platform.isIOS) {
      _openManualEntry();
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _QrScannerPage(
          onScan: (code) {
            Navigator.pop(context);
            _handleQrResult(code);
          },
        ),
      ),
    );
  }

  void _openManualEntry() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nhập mã phiếu'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Ví dụ: RO-123456',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            Navigator.pop(ctx);
            final code = value.trim();
            if (code.isNotEmpty) _handleQrResult(code);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            icon: const Icon(Icons.search, size: 18, color: Colors.white),
            label: const Text('Tra cứu', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(ctx);
              final code = controller.text.trim();
              if (code.isNotEmpty) _handleQrResult(code);
            },
          ),
        ],
      ),
    );
  }

  void _handleQrResult(String code) {
    final orders = ref.read(garaOrdersProvider).valueOrNull ?? [];
    GaraRepairOrder? match;
    for (final o in orders) {
      if (o.orderCode == code) {
        match = o;
        break;
      }
    }
    if (match != null) {
      _showOrderDetail(match);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không tìm thấy phiếu: $code'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ticketsAsync = ref.watch(garaPaidOrdersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tra Cứu Phiếu Thanh Toán & Giao Xe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Quét mã QR',
            onPressed: _openQrScanner,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, size: 20, color: Colors.teal),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    onChanged: (value) => setState(() => _query = value),
                    decoration: InputDecoration(
                      hintText: 'Tìm theo mã phiếu, khách hàng hoặc biển số',
                      isDense: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ticketsAsync.when(
              data: (tickets) {
                final filtered = _filterOrders(tickets);
                if (filtered.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.receipt_long, size: 64, color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Text(
                          tickets.isEmpty
                              ? 'Chưa có phiếu thanh toán & giao xe nào'
                              : 'Không tìm thấy phiếu phù hợp',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemCount: filtered.length,
                  itemBuilder: (ctx, i) {
                    final order = filtered[i];
                    final customer = order.customer.value;
                    final vehicle = order.vehicle.value;
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      child: ListTile(
                        leading: const Icon(Icons.check_circle, color: Colors.green),
                        title: Text(
                          order.orderCode,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        subtitle: Text(
                          '${DateFormat('dd/MM/yyyy HH:mm').format(order.orderDate ?? DateTime.now())}'
                          '  •  ${customer?.name ?? 'Khách'}  •  ${vehicle?.licensePlate ?? '---'}'
                          '  •  ${_currency.format(order.totalAmount)}',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              order.status.label,
                              style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 4),
                            IconButton(
                              icon: const Icon(Icons.print, size: 20, color: Colors.teal),
                              tooltip: 'In phiếu',
                              onPressed: () => _printTicket(order),
                            ),
                          ],
                        ),
                        onTap: () => _showOrderDetail(order),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReceiptDetailList extends ConsumerWidget {
  final GaraRepairOrder order;
  const _ReceiptDetailList({required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(garaOrderDetailsProvider(order.id));

    return detailsAsync.when(
      data: (details) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: details.map((d) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${d.product.value?.name ?? 'Hạng mục'} x${_fmtQty(d.quantity)}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                Text(
                  NumberFormat.currency(locale: 'vi_VN', symbol: 'đ').format(d.total),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
          );
        }).toList(),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.all(8),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, st) => Text('Lỗi tải chi tiết: $err'),
    );
  }
}

String _fmtQty(double qty) {
  if (qty == qty.roundToDouble()) return qty.toInt().toString();
  return qty.toStringAsFixed(2);
}

class _QrScannerPage extends StatefulWidget {
  final void Function(String code) onScan;
  const _QrScannerPage({required this.onScan});

  @override
  State<_QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<_QrScannerPage> {
  MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Quét mã QR phiếu'),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final barcode = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
          if (barcode == null || barcode.rawValue == null) return;
          widget.onScan(barcode.rawValue!.trim());
        },
      ),
    );
  }
}

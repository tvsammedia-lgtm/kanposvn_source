import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_route.dart';
import '../services/vantai_business_logic.dart';

/// PRD mục 10-11: Nhận hàng hóa & ký gửi + theo dõi trạng thái
/// (Chờ nhận -> Đang đi -> Kho trung chuyển -> Đã giao) + thu hộ COD.
class VantaiShipmentScreen extends ConsumerStatefulWidget {
  const VantaiShipmentScreen({super.key});

  @override
  ConsumerState<VantaiShipmentScreen> createState() =>
      _VantaiShipmentScreenState();
}

class _VantaiShipmentScreenState extends ConsumerState<VantaiShipmentScreen> {
  VantaiRoute? _selectedRoute;
  ShipmentStatus? _statusFilter = ShipmentStatus.PENDING;
  final _senderNameCtrl = TextEditingController();
  final _senderPhoneCtrl = TextEditingController();
  final _receiverNameCtrl = TextEditingController();
  final _receiverPhoneCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _feeCtrl = TextEditingController();
  final _codCtrl = TextEditingController();

  static final _money =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ', decimalDigits: 0);

  Future<void> _submitShipment() async {
    if (_selectedRoute == null) return;
    final fee = double.tryParse(_feeCtrl.text) ?? 0;
    if (fee <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Nhập cước phí hợp lệ!'), backgroundColor: Colors.red));
      return;
    }

    final s = VantaiShipment()
      ..shipmentId = const Uuid().v4()
      ..shipmentCode = 'SH-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..senderName = _senderNameCtrl.text.trim()
      ..senderPhone = _senderPhoneCtrl.text.trim()
      ..receiverName = _receiverNameCtrl.text.trim()
      ..receiverPhone = _receiverPhoneCtrl.text.trim()
      ..weightKg = double.tryParse(_weightCtrl.text) ?? 0
      ..shippingFee = fee
      ..codAmount = double.tryParse(_codCtrl.text) ?? 0
      ..status = ShipmentStatus.PENDING
      ..createdAt = DateTime.now();

    s.route.value = _selectedRoute;

    await ref.read(vantaiShipmentsProvider.notifier).createShipment(s);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Đã nhận hàng ${s.shipmentCode}!'
              '${s.codAmount > 0 ? " Thu hộ COD ${_money.format(s.codAmount)}." : ""}'),
          backgroundColor: Colors.green));
      _senderNameCtrl.clear();
      _senderPhoneCtrl.clear();
      _receiverNameCtrl.clear();
      _receiverPhoneCtrl.clear();
      _weightCtrl.clear();
      _feeCtrl.clear();
      _codCtrl.clear();
    }
  }

  void _suggestFee() {
    final kg = double.tryParse(_weightCtrl.text) ?? 0;
    final km = _selectedRoute?.distanceKm ?? 0;
    final fee = VantaiBusinessLogic.suggestShipmentFee(kg, km);
    if (fee > 0) setState(() => _feeCtrl.text = '${fee.toInt()}');
  }

  Color _statusColor(ShipmentStatus s) => switch (s) {
        ShipmentStatus.PENDING => Colors.blue,
        ShipmentStatus.IN_TRANSIT => Colors.orange,
        ShipmentStatus.AT_WAREHOUSE => Colors.purple,
        ShipmentStatus.DELIVERED => Colors.green,
        ShipmentStatus.CANCELLED => Colors.red,
      };

  /// Luồng trạng thái kế tiếp theo quy trình vận đơn.
  ShipmentStatus? _nextStatus(ShipmentStatus s) => switch (s) {
        ShipmentStatus.PENDING => ShipmentStatus.IN_TRANSIT,
        ShipmentStatus.IN_TRANSIT => ShipmentStatus.AT_WAREHOUSE,
        ShipmentStatus.AT_WAREHOUSE => ShipmentStatus.DELIVERED,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final routesAsync = ref.watch(vantaiRoutesProvider);
    final shipmentsAsync = ref.watch(vantaiShipmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nhận Hàng Hóa & Ký Gửi')),
      body: Row(
        children: [
          // Left panel: form
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Lập Phiếu Gửi Hàng',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    routesAsync.when(
                      data: (routes) =>
                          DropdownButtonFormField<VantaiRoute>(
                        isExpanded: true,
                        decoration: const InputDecoration(
                            labelText: 'Tuyến đường',
                            border: OutlineInputBorder()),
                        value: _selectedRoute,
                        items: routes
                            .map((r) => DropdownMenuItem(
                                value: r, child: Text(r.routeName)))
                            .toList(),
                        onChanged: (val) => setState(() => _selectedRoute = val),
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('Lỗi tải tuyến'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                        controller: _senderNameCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Tên Người Gửi',
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _senderPhoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            labelText: 'SĐT Người Gửi',
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _receiverNameCtrl,
                        decoration: const InputDecoration(
                            labelText: 'Tên Người Nhận',
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _receiverPhoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            labelText: 'SĐT Người Nhận',
                            border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    Row(children: [
                      Expanded(
                          child: TextField(
                              controller: _weightCtrl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'Khối lượng (Kg)',
                                  border: OutlineInputBorder()))),
                      IconButton(
                        tooltip:
                            'Gợi ý cước: 20K + 3K/kg + 150đ/km tuyến',
                        icon: const Icon(Icons.calculate_outlined),
                        onPressed: _suggestFee,
                      ),
                      Expanded(
                          child: TextField(
                              controller: _feeCtrl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'Cước phí (đ)',
                                  border: OutlineInputBorder()))),
                    ]),
                    const SizedBox(height: 8),
                    TextField(
                        controller: _codCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Thu hộ COD (đ, 0 nếu không)',
                            border: OutlineInputBorder(),
                            helperText:
                                'COD thu rồi trả người gửi - không tính doanh thu')),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        onPressed: _submitShipment,
                        child: const Text('Lập Phiếu & In',
                            style: TextStyle(fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // Right panel: List of shipments
          Expanded(
            flex: 2,
            child: shipmentsAsync.when(
              data: (shipments) {
                if (shipments.isEmpty) {
                  return const Center(child: Text('Chưa có hàng hóa nào.'));
                }
                final list = _statusFilter == null
                    ? shipments
                    : shipments
                        .where((s) => s.status == _statusFilter)
                        .toList();
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      spacing: 6,
                      children: [
                        ChoiceChip(
                            label: const Text('Tất cả'),
                            selected: _statusFilter == null,
                            onSelected: (_) =>
                                setState(() => _statusFilter = null)),
                        for (final s in ShipmentStatus.values)
                          ChoiceChip(
                            label: Text(s.label),
                            selected: _statusFilter == s,
                            onSelected: (_) => setState(() => _statusFilter = s),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final s = list[index];
                        final next = _nextStatus(s.status);
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _statusColor(s.status),
                              child: const Icon(Icons.inventory_2,
                                  color: Colors.white),
                            ),
                            title: Text(
                                '${s.shipmentCode} • ${s.route.value?.routeName ?? "?"}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                'Gửi: ${s.senderName} → Nhận: ${s.receiverName}\n'
                                '${s.weightKg.toStringAsFixed(1)} kg • Cước ${_money.format(s.shippingFee)}'
                                '${s.codAmount > 0 ? " • COD ${_money.format(s.codAmount)}" : ""}'
                                '\n${s.status.label}'),
                            isThreeLine: true,
                            trailing: PopupMenuButton<String>(
                              onSelected: (v) async {
                                switch (v) {
                                  case 'next':
                                    if (next != null) {
                                      await ref
                                          .read(vantaiShipmentsProvider.notifier)
                                          .updateStatus(s, next);
                                    }
                                    break;
                                  case 'delivered':
                                    await ref
                                        .read(vantaiShipmentsProvider.notifier)
                                        .updateStatus(
                                            s, ShipmentStatus.DELIVERED);
                                    break;
                                  case 'cancel':
                                    await ref
                                        .read(vantaiShipmentsProvider.notifier)
                                        .updateStatus(
                                            s, ShipmentStatus.CANCELLED);
                                    break;
                                }
                              },
                              itemBuilder: (_) => [
                                if (next != null)
                                  PopupMenuItem(
                                      value: 'next',
                                      child: Text('Chuyển: ${next.label}')),
                                if (next != null && s.codAmount > 0)
                                  const PopupMenuItem(
                                      value: 'delivered',
                                      child: Text(
                                          'Đã giao + thu hộ COD ngay')),
                                if (s.status != ShipmentStatus.CANCELLED &&
                                    s.status != ShipmentStatus.DELIVERED)
                                  const PopupMenuItem(
                                      value: 'cancel', child: Text('Hủy đơn')),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          )
        ],
      ),
    );
  }
}

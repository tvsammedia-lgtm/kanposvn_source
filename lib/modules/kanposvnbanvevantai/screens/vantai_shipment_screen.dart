import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../providers/vantai_providers.dart';
import '../models/vantai_shipment.dart';
import '../models/vantai_route.dart';

class VantaiShipmentScreen extends ConsumerStatefulWidget {
  const VantaiShipmentScreen({super.key});

  @override
  ConsumerState<VantaiShipmentScreen> createState() => _VantaiShipmentScreenState();
}

class _VantaiShipmentScreenState extends ConsumerState<VantaiShipmentScreen> {
  VantaiRoute? _selectedRoute;
  final _senderNameCtrl = TextEditingController();
  final _senderPhoneCtrl = TextEditingController();
  final _receiverNameCtrl = TextEditingController();
  final _receiverPhoneCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  final _feeCtrl = TextEditingController();

  void _submitShipment() async {
    if (_selectedRoute == null) return;
    final fee = double.tryParse(_feeCtrl.text) ?? 0;
    
    final s = VantaiShipment()
      ..shipmentId = const Uuid().v4()
      ..shipmentCode = 'SH-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}'
      ..senderName = _senderNameCtrl.text
      ..senderPhone = _senderPhoneCtrl.text
      ..receiverName = _receiverNameCtrl.text
      ..receiverPhone = _receiverPhoneCtrl.text
      ..weightKg = double.tryParse(_weightCtrl.text) ?? 0
      ..shippingFee = fee
      ..status = ShipmentStatus.PENDING
      ..createdAt = DateTime.now();
      
    s.route.value = _selectedRoute;

    await ref.read(vantaiShipmentsProvider.notifier).createShipment(s);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lập phiếu thu hàng thành công!')));
      _senderNameCtrl.clear();
      _senderPhoneCtrl.clear();
      _receiverNameCtrl.clear();
      _receiverPhoneCtrl.clear();
      _weightCtrl.clear();
      _feeCtrl.clear();
    }
  }

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
                    const Text('Lập Phiếu Gửi Hàng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    routesAsync.when(
                      data: (routes) => DropdownButtonFormField<VantaiRoute>(
                        decoration: const InputDecoration(labelText: 'Tuyến đường', border: OutlineInputBorder()),
                        value: _selectedRoute,
                        items: routes.map((r) => DropdownMenuItem(value: r, child: Text(r.routeName))).toList(),
                        onChanged: (val) => setState(() => _selectedRoute = val),
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (_, __) => const Text('Lỗi tải tuyến'),
                    ),
                    const SizedBox(height: 16),
                    TextField(controller: _senderNameCtrl, decoration: const InputDecoration(labelText: 'Tên Người Gửi', border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(controller: _senderPhoneCtrl, decoration: const InputDecoration(labelText: 'SĐT Người Gửi', border: OutlineInputBorder())),
                    const SizedBox(height: 16),
                    TextField(controller: _receiverNameCtrl, decoration: const InputDecoration(labelText: 'Tên Người Nhận', border: OutlineInputBorder())),
                    const SizedBox(height: 8),
                    TextField(controller: _receiverPhoneCtrl, decoration: const InputDecoration(labelText: 'SĐT Người Nhận', border: OutlineInputBorder())),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: TextField(controller: _weightCtrl, decoration: const InputDecoration(labelText: 'Trọng lượng (Kg)', border: OutlineInputBorder()))),
                        const SizedBox(width: 16),
                        Expanded(child: TextField(controller: _feeCtrl, decoration: const InputDecoration(labelText: 'Cước phí (đ)', border: OutlineInputBorder()))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                        onPressed: _submitShipment,
                        child: const Text('Lập Phiếu & In', style: TextStyle(fontSize: 18)),
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
                if (shipments.isEmpty) return const Center(child: Text('Chưa có hàng hóa nào.'));
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: shipments.length,
                  itemBuilder: (context, index) {
                    final s = shipments[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.inventory_2, color: Colors.orange, size: 40),
                        title: Text('${s.shipmentCode} - ${s.route.value?.routeName}'),
                        subtitle: Text('Gửi: ${s.senderName} -> Nhận: ${s.receiverName}\nTrọng lượng: ${s.weightKg} kg'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${s.shippingFee} đ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                            Text(s.status.label, style: const TextStyle(color: Colors.blue)),
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
          )
        ],
      ),
    );
  }
}

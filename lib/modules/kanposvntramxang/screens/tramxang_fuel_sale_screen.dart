import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../providers/tramxang_providers.dart';
import '../services/tramxang_isar_service.dart';

/// Bán xăng trực tiếp tại vòi: chọn trụ/vòi -> nhập số lít -> BÁN XĂNG.
/// Ghi nhận: giảm tồn bồn, cập nhật tổng meter vòi, tạo PumpTransaction.
class TramXangFuelSaleScreen extends ConsumerStatefulWidget {
  const TramXangFuelSaleScreen({super.key});

  @override
  ConsumerState<TramXangFuelSaleScreen> createState() =>
      _TramXangFuelSaleScreenState();
}

class _TramXangFuelSaleScreenState
    extends ConsumerState<TramXangFuelSaleScreen> {
  final TextEditingController _litersController = TextEditingController();
  String? _selectedNozzleId;
  String _paymentMethod = 'CASH';
  bool _selling = false;

  @override
  void initState() {
    super.initState();
    _litersController.text = '10';
  }

  @override
  void dispose() {
    _litersController.dispose();
    super.dispose();
  }

  String _fmt(double v) {
    return v.toStringAsFixed(v == v.roundToDouble() ? 0 : 2);
  }

  String _money(double v) {
    return v.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  }

  @override
  Widget build(BuildContext context) {
    final nozzles = ref.watch(tramXangPumpNozzlesProvider);
    final tanks = ref.watch(tramXangTanksProvider);
    final shift = ref.watch(tramXangActiveShiftProvider);

    if (_selectedNozzleId == null && nozzles.isNotEmpty) {
      _selectedNozzleId = nozzles.first.nozzleId;
    }

    final nozzle = nozzles.isEmpty
        ? null
        : nozzles.firstWhere(
            (n) => n.nozzleId == _selectedNozzleId,
            orElse: () => nozzles.first,
          );
    final tank = nozzle == null
        ? null
        : tanks.cast<TramXangTank?>().firstWhere(
            (t) => t!.tankId == nozzle.tankId,
            orElse: () => null,
          );

    return Scaffold(
      appBar: AppBar(title: const Text('Bán Xăng Tại Vòi')),
      body: shift == null ? _buildNoShift() : _buildBody(nozzle, tank, nozzles),
    );
  }

  Widget _buildNoShift() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.lock_clock, size: 72, color: Colors.grey),
          SizedBox(height: 12),
          Text('Chưa mở ca bán hàng.',
              style: TextStyle(fontSize: 17)),
          Text('Mở ca tại tab "Ca Bán Hàng" để bán xăng.',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBody(TramXangPumpNozzle? nozzle, TramXangTank? tank,
      List<TramXangPumpNozzle> nozzles) {
    final quantity = double.tryParse(_litersController.text) ?? 0;
    final unitPrice = nozzle == null
        ? 0.0
        : ref
            .read(tramXangProductsProvider)
            .firstWhere((p) => p.productId == nozzle.productId)
            .retailPrice;
    final amount = quantity * unitPrice;
    final canSell = nozzle != null && quantity > 0 && tank != null;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (nozzles.isNotEmpty) ...[
          DropdownButtonFormField<String>(
            initialValue: _selectedNozzleId,
            decoration: const InputDecoration(
              labelText: 'Chọn trụ / vòi bơm',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.local_gas_station),
            ),
            items: [
              for (final n in nozzles)
                DropdownMenuItem(
                  value: n.nozzleId,
                  child: Text(_nozzleLabel(n)),
                ),
            ],
            onChanged: (v) => setState(() => _selectedNozzleId = v),
          ),
          const SizedBox(height: 12),
          _buildNozzleInfo(nozzle, tank),
        ] else
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Hệ thống chưa có trụ/vòi bơm nào.'),
            ),
          ),
        const SizedBox(height: 16),
        TextField(
          controller: _litersController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Số lít bán',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.speed),
            suffixText: 'Lít',
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final v in [10, 20, 30, 50, 100])
              ActionChip(
                label: Text('$v L'),
                onPressed: () {
                  setState(() => _litersController.text = '$v');
                },
              ),
          ],
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đơn giá: ${_money(unitPrice)} đ/L'),
                    Text('Tồn bồn hiện tại: ${_fmt(tank?.currentQuantity ?? 0)} L',
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Text('${_money(amount)} đ',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: [
            for (final m in [
              ('CASH', 'Tiền mặt'),
              ('TRANSFER', 'Chuyển khoản'),
              ('QR', 'QR Code'),
              ('DEBT', 'Ghi nợ'),
            ])
              FilterChip(
                label: Text(m.$2),
                selected: _paymentMethod == m.$1,
                onSelected: (_) => setState(() => _paymentMethod = m.$1),
              ),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          icon: _selling
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.local_gas_station),
          label: const Text('BÁN XĂNG'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF59E0B),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: canSell && !_selling ? () => _sell(nozzle, tank, unitPrice) : null,
        ),
      ],
    );
  }

  String _nozzleLabel(TramXangPumpNozzle n) {
    final products = ref.read(tramXangProductsProvider);
    final p = products.cast<TramXangProduct?>().firstWhere(
        (p) => p!.productId == n.productId, orElse: () => null);
    return '${n.pumpId.toUpperCase()} - Vòi ${n.nozzleNo}: ${p?.name ?? '?'}';
  }

  Widget _buildNozzleInfo(TramXangPumpNozzle? nozzle, TramXangTank? tank) {
    if (nozzle == null) return const SizedBox.shrink();
    final level = tank == null || tank.capacityLiter <= 0
        ? 0.0
        : (tank.currentQuantity / tank.capacityLiter).clamp(0.0, 1.0);
    final low = tank != null && tank.currentQuantity <= tank.criticalLevelLiter;
    return Card(
      color: low ? const Color(0xFFFFEBEE) : null,
      child: ListTile(
        leading: Icon(Icons.propane_tank,
            color: low ? Colors.red : Colors.green),
        title: Text(nozzle.productId.toUpperCase()),
        subtitle: tank == null
            ? const Text('Không tìm thấy bồn chứa')
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tank.name),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: level,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    color: low
                        ? Colors.red
                        : tank.currentQuantity <= tank.minLevelLiter
                            ? Colors.orange
                            : Colors.green,
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _sell(
      TramXangPumpNozzle nozzle, TramXangTank tank, double unitPrice) async {
    final quantity = double.tryParse(_litersController.text) ?? 0;
    if (quantity <= 0) return;
    final product =
        ref.read(tramXangProductsProvider).firstWhere((p) => p.productId == nozzle.productId);
    setState(() => _selling = true);
    try {
      final sale = await ref.read(tramXangSalesProvider.notifier).createSale(
            items: [
              TramXangSaleItem(
                product: product,
                quantity: quantity,
                unitPrice: unitPrice,
                tank: tank,
                nozzle: nozzle,
              ),
            ],
            paymentMethod: _paymentMethod,
          );
      await ref.read(tramXangTanksProvider.notifier).loadTanks();
      await ref.read(tramXangPumpNozzlesProvider.notifier).loadNozzles();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Đã bán ${_fmt(quantity)} L ${product.name} - ${sale.saleNo}'),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
        backgroundColor: Colors.red,
      ));
    } finally {
      if (mounted) setState(() => _selling = false);
    }
  }
}
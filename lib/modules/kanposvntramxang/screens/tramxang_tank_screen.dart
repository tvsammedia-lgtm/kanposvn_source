import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/inventory.dart';
import '../models/product.dart';
import '../models/tank.dart';
import '../providers/tramxang_providers.dart';

/// Quản lý bồn chứa: theo dõi mức tồn, cảnh báo ngưỡng, ghi số đo,
/// nhập nhiên liệu vào bồn.
class TramXangTankScreen extends ConsumerStatefulWidget {
  const TramXangTankScreen({super.key});

  @override
  ConsumerState<TramXangTankScreen> createState() => _TramXangTankScreenState();
}

class _TramXangTankScreenState extends ConsumerState<TramXangTankScreen> {
  void _refresh() {
    ref.read(tramXangTanksProvider.notifier).loadTanks();
    ref.read(tramXangTankReadingsProvider.notifier).loadReadings();
    ref.invalidate(tramXangTankReconProvider);
  }

  @override
  Widget build(BuildContext context) {
    final tanks = ref.watch(tramXangTanksProvider);
    final products = ref.watch(tramXangProductsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Quản Lý Bồn Xăng')),
      body: tanks.isEmpty
          ? const Center(child: Text('Chưa có bồn nào.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final t in tanks)
                  _buildTankCard(context, t, products),
              ],
            ),
    );
  }

  Widget _buildTankCard(BuildContext context, TramXangTank tank,
      List<TramXangProduct> products) {
    final p = products.cast<TramXangProduct?>().firstWhere(
        (p) => p!.productId == tank.productId,
        orElse: () => null);
    final pct = tank.capacityLiter <= 0
        ? 0.0
        : (tank.currentQuantity / tank.capacityLiter).clamp(0.0, 1.0);
    final critical = tank.currentQuantity <= tank.criticalLevelLiter;
    final low = !critical && tank.currentQuantity <= tank.minLevelLiter;
    final overflow = tank.currentQuantity > tank.safeCapacityLiter;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: critical
                ? Colors.red
                : (overflow ? Colors.orange : Colors.transparent),
            width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  critical
                      ? Icons.warning
                      : (overflow ? Icons.error_outline : Icons.propane_tank),
                  color: critical
                      ? Colors.red
                      : (overflow ? Colors.orange : Colors.teal),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('${tank.name} (${tank.code})',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Text(p?.name ?? tank.productId,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: pct,
              minHeight: 22,
              borderRadius: BorderRadius.circular(4),
              backgroundColor: Colors.grey[300],
              color: critical
                  ? Colors.red
                  : (low ? Colors.orange : Colors.green),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tồn: ${_formatMetric(tank.currentQuantity)} L '
                    '/ ${_formatMetric(tank.capacityLiter)} L '
                    '(${(pct * 100).toStringAsFixed(1)}%)'),
                if (critical)
                  const Text('CẦN NHẬP KHẨN CẤP', style: TextStyle(color: Colors.red))
                else if (low)
                  const Text('DƯỚI MỨC MIN', style: TextStyle(color: Colors.orange))
                else if (overflow)
                  const Text('VƯỢT MỨC AN TOÀN', style: TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.straighten),
                  label: const Text('Ghi số đo'),
                  onPressed: () => _openReadingDialog(tank),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.local_shipping),
                  label: const Text('Nhập nhiên liệu'),
                  onPressed: () => _openImportDialog(tank),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatMetric(double v) {
    return v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
  }

  Future<void> _openReadingDialog(TramXangTank tank) async {
    final qty = TextEditingController(text: _formatMetric(tank.currentQuantity));
    final temp = TextEditingController(text: '30');
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ghi số đo bồn ${tank.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: qty,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Số đo (Lít)'),
            ),
            TextField(
              controller: temp,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Nhiệt độ (°C)'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Lưu')),
        ],
      ),
    );
    if (result == true) {
      final q = double.tryParse(qty.text) ?? 0;
      try {
        await ref
            .read(tramXangIsarServiceProvider)
            .addTankReading(
              tank,
              TramXangTankReading()
                ..readingId =
                    'rd_${DateTime.now().millisecondsSinceEpoch}'
                ..readingTime = DateTime.now()
                ..quantity = q
                ..height = q / 100
                ..temperature = double.tryParse(temp.text) ?? 0
                ..source = 'MANUAL'
                ..employeeId = 'EMP_OWNER',
            );
        _refresh();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Đã ghi số đo bồn'), backgroundColor: Colors.green));
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$e'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _openImportDialog(TramXangTank tank) async {
    final suppliers = ref.read(tramXangSuppliersProvider);
    final product = ref
        .read(tramXangProductsProvider)
        .cast<TramXangProduct?>()
        .firstWhere((p) => p!.productId == tank.productId,
            orElse: () => null);
    if (product == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bồn chưa gắn sản phẩm')));
      return;
    }
    final qty = TextEditingController();
    final unitCost =
        TextEditingController(text: product.importPrice.toStringAsFixed(0));
    final invoice = TextEditingController();
    String? supplierId = suppliers.isEmpty ? null : suppliers.first.supplierId;
    final isFuel = product.productType == 'FUEL';

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Nhập nhiên liệu vào ${tank.name}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: qty,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                    labelText: 'Số lượng (${product.unit})'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: unitCost,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Đơn giá nhập (đ)'),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: supplierId,
                decoration: const InputDecoration(labelText: 'Nhà cung cấp'),
                items: [
                  for (final s in suppliers)
                    DropdownMenuItem(
                        value: s.supplierId, child: Text(s.name)),
                ],
                onChanged: (v) => supplierId = v,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: invoice,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Số hóa đơn / phiếu'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Nhập')),
        ],
      ),
    );
    if (result == true) {
      final supplier = suppliers
          .cast<TramXangSupplier?>()
          .firstWhere((s) => s!.supplierId == supplierId,
              orElse: () => suppliers.isEmpty ? null : suppliers.first);
      if (supplier == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Chưa có nhà cung cấp.')));
        return;
      }
      final q = double.tryParse(qty.text) ?? 0;
      final cost = double.tryParse(unitCost.text) ?? product.importPrice;
      try {
        await ref.read(tramXangPurchasesProvider.notifier).importInventory(
              product: product,
              quantity: q,
              unitCost: cost,
              supplier: supplier,
              invoiceNo: invoice.text,
              warehouseId: isFuel ? 'TANK-${product.sku}' : 'SHOP',
              tank: isFuel ? tank : null,
            );
        _refresh();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Đã nhập ${product.name} thành công'),
            backgroundColor: Colors.green));
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$e'), backgroundColor: Colors.red));
      }
    }
  }
}
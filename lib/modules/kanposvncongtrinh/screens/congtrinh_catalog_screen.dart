import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/congtrinh_providers.dart';
import '../services/congtrinh_isar_service.dart';
import '../utils/congtrinh_format.dart';

/// Danh mục vật tư theo nhóm + đơn giá hiện hành, cảnh báo bảng giá cũ.
class CongTrinhCatalogScreen extends ConsumerStatefulWidget {
  const CongTrinhCatalogScreen({super.key});

  @override
  ConsumerState<CongTrinhCatalogScreen> createState() =>
      _CongTrinhCatalogScreenState();
}

class _CongTrinhCatalogScreenState
    extends ConsumerState<CongTrinhCatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(congTrinhCategoriesProvider);
    final materials = ref.watch(congTrinhMaterialsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Vật Tư & Đơn Giá')),
      body: categories.isEmpty
          ? const Center(child: Text('Chưa có dữ liệu mẫu.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final cat in categories) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(cat.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F46E5))),
                  ),
                  Card(
                    child: Column(
                      children: [
                        for (final m in materials
                            .where((x) => x.categoryId == cat.categoryId))
                          _MaterialRow(materialId: m.materialId),
                      ],
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}

class _MaterialRow extends ConsumerStatefulWidget {
  final String materialId;
  const _MaterialRow({required this.materialId});

  @override
  ConsumerState<_MaterialRow> createState() => _MaterialRowState();
}

class _MaterialRowState extends ConsumerState<_MaterialRow> {
  @override
  Widget build(BuildContext context) {
    final prices = ref.watch(congTrinhMaterialPricesProvider);
    final materials = ref.watch(congTrinhMaterialsProvider);
    final material = materials
        .firstWhere((m) => m.materialId == widget.materialId,
            orElse: () => materials.first);
    final all = prices
        .where((p) => p.materialId == widget.materialId)
        .toList()
      ..sort((a, b) {
        final da = a.effectiveDate ?? DateTime(2000);
        final db = b.effectiveDate ?? DateTime(2000);
        return db.compareTo(da);
      });
    final current = all.isEmpty ? null : all.first;

    final now = DateTime.now();
    final eff = current?.effectiveDate;
    final isOld =
        eff != null && now.difference(eff).inDays > 30;
    final isMissing = current == null;
    final currentPrice = current?.price;

    return ListTile(
      dense: true,
      leading: const Icon(Icons.category, size: 18, color: Colors.blueGrey),
      title: Text(
        '${material.code} · ${material.name}',
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Text(ctNumber(currentPrice ?? 0)),
      trailing: isMissing
          ? const Tooltip(
              message: 'Chưa có đơn giá',
              child: Icon(Icons.warning_amber, size: 18, color: Colors.orange))
          : isOld
              ? Tooltip(
                  message: 'Đơn giá đã cũ (>30 ngày)',
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(ctMoneyCompact(currentPrice!),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      const Icon(Icons.schedule,
                          size: 16, color: Colors.deepOrange),
                    ],
                  ),
                )
              : Text('${ctMoneyCompact(currentPrice!)} / ${material.defaultUnit}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
      onTap: () => _showPriceDetail(material.materialId, material.name),
    );
  }

  void _showPriceDetail(String materialId, String name) {
    showModalBottomSheet(
      context: context,
      builder: (_) => _PriceSheet(
          materialId: materialId,
          materialName: name,
          service: ref.read(congTrinhIsarServiceProvider)),
    );
  }
}

class _PriceSheet extends ConsumerStatefulWidget {
  final String materialId;
  final String materialName;
  final CongTrinhIsarService service;
  const _PriceSheet(
      {required this.materialId,
      required this.materialName,
      required this.service});

  @override
  ConsumerState<_PriceSheet> createState() => _PriceSheetState();
}

class _PriceSheetState extends ConsumerState<_PriceSheet> {
  late Future<List<Object?>> _future;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<Object?>> _load() async {
    final prices = await widget.service.getMaterialPrices();
    final suppliers = await widget.service.getSuppliers();
    return [
      prices.where((p) => p.materialId == widget.materialId).toList(),
      suppliers,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Object?>>(
        future: _future,
        builder: (context, snap) {
          if (!snap.hasData) {
            return const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final prices = snap.data![0] as List;
          final suppliers = snap.data![1] as List;
          final supplierName = {
            for (final s in suppliers) (s as dynamic).supplierId: (s).name
          };
          prices.sort((a, b) {
            final da = (a as dynamic).effectiveDate ?? DateTime(2000);
            final db = (b as dynamic).effectiveDate ?? DateTime(2000);
            return db.compareTo(da);
          });
          final min = prices.isEmpty
              ? 0.0
              : prices.map((p) => (p as dynamic).price).reduce((a, b) => a <= b ? a : b);
          final max = prices.isEmpty
              ? 0.0
              : prices.map((p) => (p as dynamic).price).reduce((a, b) => a >= b ? a : b);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bảng giá · ${widget.materialName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text(
                  'Thấp nhất ${ctMoney(min)} · Cao nhất ${ctMoney(max)}',
                  style: const TextStyle(
                      fontSize: 12, color: Colors.blueGrey),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (final p in prices)
                        ListTile(
                          dense: true,
                          leading: const Icon(Icons.payments, size: 18),
                          title: Text(
                              '${(p as dynamic).price} đ / ${p.unit}'
                              ' — ${ctDate(p.effectiveDate)}'),
                          subtitle: Text(
                            '${supplierName[p.supplierId] ?? 'Tham khảo'} · '
                            '${p.source}',
                          ),
                          trailing: p.price == min
                              ? const Text('RẺ',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))
                              : null,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
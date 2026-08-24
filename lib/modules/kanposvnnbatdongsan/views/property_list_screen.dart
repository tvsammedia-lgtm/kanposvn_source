import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/property.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';
import 'property_form_screen.dart';

/// Danh sách BĐS + Tìm kiếm nâng cao (PRD kanbatdongsan.md mục 10).
class PropertyListScreen extends ConsumerStatefulWidget {
  const PropertyListScreen({super.key});

  @override
  ConsumerState<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends ConsumerState<PropertyListScreen> {
  final _searchCtrl = TextEditingController();
  bool _showFilters = false;

  // Bộ lọc nâng cao (PRD §10).
  String? _category;
  String? _type;
  String? _province;
  String? _district;
  double? _priceFrom;
  double? _priceTo;
  double? _areaFrom;
  double? _areaTo;
  String? _direction;
  String? _legal;
  String? _frontage;
  PropertyStatus? _status;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _resetFilters() {
    setState(() {
      _searchCtrl.clear();
      _category = null;
      _type = null;
      _province = null;
      _district = null;
      _priceFrom = null;
      _priceTo = null;
      _areaFrom = null;
      _areaTo = null;
      _direction = null;
      _legal = null;
      _frontage = null;
      _status = null;
    });
  }

  List<BdsProperty> _applyFilters(List<BdsProperty> all) {
    final q = _searchCtrl.text.trim().toLowerCase();
    return all.where((p) {
      if (p.deletedAt != null) return false;
      if (q.isNotEmpty) {
        final haystack =
            '${p.title ?? ''} ${p.description ?? ''} ${p.propertyCode ?? ''} '
                    '${p.province ?? ''} ${p.district ?? ''} ${p.ward ?? ''}'
                .toLowerCase();
        if (!haystack.contains(q)) return false;
      }
      if (_category != null &&
          BdsBusinessLogic.propertyCategory(p.propertyType) != _category) {
        return false;
      }
      if (_type != null && p.propertyType != _type) return false;
      if (_province != null && p.province != _province) return false;
      if (_district != null && p.district != _district) return false;
      if (_direction != null && p.direction != _direction) return false;
      if (_legal != null && p.legalStatus != _legal) return false;
      if (_frontage != null && p.frontage != _frontage) return false;
      if (_status != null && p.status != _status) return false;
      if (_priceFrom != null && (p.price ?? 0) < _priceFrom!) return false;
      if (_priceTo != null && (p.price ?? 0) > _priceTo!) return false;
      if (_areaFrom != null && (p.areaSize ?? 0) < _areaFrom!) return false;
      if (_areaTo != null && (p.areaSize ?? 0) > _areaTo!) return false;
      return true;
    }).toList()
      ..sort((a, b) => (b.updatedAt ?? DateTime(0))
          .compareTo(a.updatedAt ?? DateTime(0)));
  }

  void _deleteProperty(BuildContext context, WidgetRef ref, int id) async {
    final repo = ref.read(propertyRepositoryProvider);
    await repo.deleteProperty(id);
    ref.invalidate(propertiesProvider);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Đã xóa bất động sản')));
  }

  Color _statusColor(PropertyStatus s) {
    switch (s) {
      case PropertyStatus.available:
        return Colors.blue;
      case PropertyStatus.negotiating:
        return Colors.orange;
      case PropertyStatus.deposited:
        return Colors.deepPurple;
      case PropertyStatus.sold:
        return Colors.green;
    }
  }

  String _statusLabel(PropertyStatus s) {
    switch (s) {
      case PropertyStatus.available:
        return 'Đang rao';
      case PropertyStatus.negotiating:
        return 'Đang GD';
      case PropertyStatus.deposited:
        return 'Đặt cọc';
      case PropertyStatus.sold:
        return 'Đã bán';
    }
  }

  @override
  Widget build(BuildContext context) {
    final propsAsync = ref.watch(propertiesProvider);
    final brokersAsync = ref.watch(brokersProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (_) => const PropertyFormScreen()));
          if (mounted) ref.invalidate(propertiesProvider);
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText:
                          'Tìm theo mã, tiêu đề, địa chỉ...',
                      prefixIcon: const Icon(Icons.search),
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  tooltip: 'Bộ lọc nâng cao',
                  icon: Icon(_showFilters ? Icons.filter_alt : Icons.filter_alt_outlined,
                      color: _hasFilters ? Theme.of(context).colorScheme.primary : null),
                  onPressed: () => setState(() => _showFilters = !_showFilters),
                ),
                IconButton(
                  tooltip: 'Xóa bộ lọc',
                  icon: const Icon(Icons.refresh),
                  onPressed: _resetFilters,
                ),
              ],
            ),
          ),
          if (_showFilters) _buildFilterPanel(),
          Expanded(
            child: propsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Lỗi: $e')),
              data: (all) {
                final list = _applyFilters(all);
                if (list.isEmpty) {
                  return const Center(child: Text('Không có BĐS phù hợp'));
                }
                final brokers = brokersAsync.value ?? [];
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 88),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final p = list[i];
                    final brokerName = brokers
                        .where((b) => b.remoteId == p.brokerId)
                        .map((b) => b.fullName)
                        .firstWhere((n) => n != null, orElse: () => null);
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      child: ListTile(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      PropertyFormScreen(property: p)));
                          if (mounted) ref.invalidate(propertiesProvider);
                        },
                        title: Text(
                          '[${p.propertyCode ?? '-'}] ${p.title ?? ''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 2),
                            Text(
                              '${p.propertyType ?? '-'} · '
                              '${BdsBusinessLogic.formatMoney(p.areaSize)} m² · '
                              '${p.district ?? '-'}, ${p.province ?? '-'}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  '${BdsBusinessLogic.formatMoney(p.price)} đ',
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: _statusColor(p.status)
                                        .withOpacity(0.12),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    _statusLabel(p.status),
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: _statusColor(p.status)),
                                  ),
                                ),
                                const Spacer(),
                                if (brokerName != null)
                                  Text('MG: $brokerName',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.redAccent),
                          onPressed: () => showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Xác nhận xóa'),
                              content: Text(
                                  'Xóa "${p.title ?? 'BĐS'}" ?'),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('Hủy')),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    _deleteProperty(context, ref, p.id);
                                  },
                                  child: const Text('Xóa',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool get _hasFilters =>
      _category != null ||
      _type != null ||
      _province != null ||
      _district != null ||
      _priceFrom != null ||
      _priceTo != null ||
      _areaFrom != null ||
      _areaTo != null ||
      _direction != null ||
      _legal != null ||
      _frontage != null ||
      _status != null;

  Widget _dropdown<T>(
      {required String label,
      required T? value,
      required List<DropdownMenuItem<T>> items,
      required ValueChanged<T?> onChanged}) {
    return DropdownButtonFormField<T>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6)),
      items: items,
      onChanged: onChanged,
    );
  }

  Widget _numField(String label, double? value, ValueChanged<double?> onSaved) {
    return TextFormField(
      initialValue: value?.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6)),
      onChanged: (v) {
        onSaved(double.tryParse(v));
        setState(() {});
      },
    );
  }

  Widget _buildFilterPanel() {
    final propsAsync = ref.watch(propertiesProvider);
    final provinces = (propsAsync.value ?? [])
        .map((p) => p.province)
        .whereType<String>()
        .toSet()
        .toList()
      ..sort();
    final districts = (propsAsync.value ?? [])
        .where((p) => _province == null || p.province == _province)
        .map((p) => p.district)
        .whereType<String>()
        .toSet()
        .toList()
      ..sort();

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width > 900 ? 5 : 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3.2,
        children: [
          _dropdown<String>(
            label: 'Nhóm',
            value: _category,
            items: const [
              'Đất',
              'Nhà',
              'Chung cư',
              'Mặt bằng',
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) => setState(() {
              _category = v;
              // Nhóm đổi thì subtype không còn hợp lệ.
              if (_type != null &&
                  v != null &&
                  BdsBusinessLogic.propertyCategory(_type) != v) {
                _type = null;
              }
            }),
          ),
          _dropdown<String>(
            label: 'Loại BĐS',
            value: _type,
            items: BdsBusinessLogic.allPropertyTypes
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => _type = v),
          ),
          _dropdown<String>(
            label: 'Tỉnh/TP',
            value: _province,
            items: provinces
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() {
              _province = v;
              _district = null;
            }),
          ),
          _dropdown<String>(
            label: 'Quận/Huyện',
            value: _district,
            items: districts
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => _district = v),
          ),
          _dropdown<String>(
            label: 'Hướng',
            value: _direction,
            items: BdsBusinessLogic.directions
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => _direction = v),
          ),
          _dropdown<String>(
            label: 'Pháp lý',
            value: _legal,
            items: BdsBusinessLogic.legalStatuses
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => _legal = v),
          ),
          _dropdown<String>(
            label: 'Mặt tiền',
            value: _frontage,
            items: BdsBusinessLogic.frontages
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => _frontage = v),
          ),
          _dropdown<PropertyStatus>(
            label: 'Trạng thái',
            value: _status,
            items: const [
              PropertyStatus.available,
              PropertyStatus.negotiating,
              PropertyStatus.deposited,
              PropertyStatus.sold,
            ]
                .map((s) => DropdownMenuItem(
                    value: s, child: Text(_statusLabel(s))))
                .toList(),
            onChanged: (v) => setState(() => _status = v),
          ),
          _numField('Giá từ (tỷ)', _priceFrom, (v) => _priceFrom = v),
          _numField('Giá đến (tỷ)', _priceTo, (v) => _priceTo = v),
          _numField('DT từ (m²)', _areaFrom, (v) => _areaFrom = v),
          _numField('DT đến (m²)', _areaTo, (v) => _areaTo = v),
        ],
      ),
    );
  }
}

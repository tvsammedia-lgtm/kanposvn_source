import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/property.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Thêm/sửa BĐS — đủ trường theo PRD kanbatdongsan.md mục 7/8/9.
class PropertyFormScreen extends ConsumerStatefulWidget {
  final BdsProperty? property;

  const PropertyFormScreen({super.key, this.property});

  @override
  ConsumerState<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends ConsumerState<PropertyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _title;
  late final TextEditingController _desc;
  late final TextEditingController _price;
  late final TextEditingController _areaSize;
  late final TextEditingController _width;
  late final TextEditingController _length;
  late final TextEditingController _floors;
  late final TextEditingController _bedrooms;
  late final TextEditingController _bathrooms;
  late final TextEditingController _province;
  late final TextEditingController _district;
  late final TextEditingController _ward;
  late final TextEditingController _area;

  String? _ownerId;
  String? _brokerId;
  String? _type;
  String? _legal;
  String? _direction;
  String? _frontage;
  PropertyStatus _status = PropertyStatus.available;
  Set<String> _features = {};

  bool get _isEdit => widget.property != null;

  @override
  void initState() {
    super.initState();
    final p = widget.property;
    _title = TextEditingController(text: p?.title ?? '');
    _desc = TextEditingController(text: p?.description ?? '');
    _price = TextEditingController(text: p?.price?.toString() ?? '');
    _areaSize = TextEditingController(text: p?.areaSize?.toString() ?? '');
    _width = TextEditingController(text: p?.width?.toString() ?? '');
    _length = TextEditingController(text: p?.length?.toString() ?? '');
    _floors = TextEditingController(text: p?.floors?.toString() ?? '');
    _bedrooms = TextEditingController(text: p?.bedrooms?.toString() ?? '');
    _bathrooms = TextEditingController(text: p?.bathrooms?.toString() ?? '');
    _province = TextEditingController(text: p?.province ?? '');
    _district = TextEditingController(text: p?.district ?? '');
    _ward = TextEditingController(text: p?.ward ?? '');
    _area = TextEditingController(text: p?.area ?? '');
    _ownerId = p?.ownerId;
    _brokerId = p?.brokerId;
    _type = p?.propertyType;
    _legal = p?.legalStatus;
    _direction = p?.direction;
    _frontage = p?.frontage;
    _status = p?.status ?? PropertyStatus.available;
    _features = {...?p?.features};
  }

  @override
  void dispose() {
    for (final c in [
      _title,
      _desc,
      _price,
      _areaSize,
      _width,
      _length,
      _floors,
      _bedrooms,
      _bathrooms,
      _province,
      _district,
      _ward,
      _area,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final property = widget.property ?? BdsProperty();
    if (!_isEdit) {
      property.remoteId ??= const Uuid().v4();
    }
    property.title = _title.text.trim();
    property.description = _desc.text.trim();
    property.price = double.tryParse(_price.text);
    property.areaSize = double.tryParse(_areaSize.text);
    property.width = double.tryParse(_width.text);
    property.length = double.tryParse(_length.text);
    property.floors = int.tryParse(_floors.text);
    property.bedrooms = int.tryParse(_bedrooms.text);
    property.bathrooms = int.tryParse(_bathrooms.text);
    property.province = _province.text.trim();
    property.district = _district.text.trim();
    property.ward = _ward.text.trim();
    property.area = _area.text.trim();
    property.ownerId = _ownerId;
    property.brokerId = _brokerId;
    property.propertyType = _type;
    property.legalStatus = _legal;
    property.direction = _direction;
    property.frontage = _frontage;
    property.status = _status;
    property.features = _features.toList();

    // Tự sinh mã BĐS nếu chưa có.
    if ((property.propertyCode ?? '').isEmpty) {
      final all = await ref.read(propertiesProvider.future);
      property.propertyCode = BdsBusinessLogic.nextPropertyCode(all);
    }

    await ref.read(propertyRepositoryProvider).saveProperty(property);
    ref.invalidate(propertiesProvider);

    if (!mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(_isEdit ? 'Đã cập nhật bất động sản' : 'Đã thêm bất động sản')));
  }

  InputDecoration _deco(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  /// Danh sách option + giá trị hiện tại (phòng dữ liệu cũ nằm ngoài danh
  /// sách -> tránh assert "exactly one item with value" của DropdownButton).
  List<DropdownMenuItem<String>> _optionItems(
          List<String> options, String? current) =>
      [
        if (current != null && current.isNotEmpty && !options.contains(current))
          DropdownMenuItem(value: current, child: Text('$current (cũ)')),
        ...options.map((o) => DropdownMenuItem(value: o, child: Text(o))),
      ];

  Widget _field(String label, TextEditingController c,
          {String? Function(String?)? validator, TextInputType? keyboard}) =>
      TextFormField(
        controller: c,
        keyboardType: keyboard,
        decoration: _deco(label),
        validator: validator,
      );

  @override
  Widget build(BuildContext context) {
    final sellersAsync = ref.watch(sellersProvider);
    final brokersAsync = ref.watch(brokersProvider);
    final sellers = sellersAsync.value ?? [];
    final brokers = brokersAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(
          title: Text(_isEdit ? 'Sửa Bất động sản' : 'Thêm Bất động sản')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Thông tin chung',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _field('Tiêu đề *', _title,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Bắt buộc nhập' : null),
            const SizedBox(height: 12),
            _field('Mô tả', _desc, keyboard: TextInputType.multiline),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: DropdownButtonFormField<String>(
                value: _ownerId,
                decoration: _deco('Chủ sở hữu'),
                items: sellers
                    .map((c) => DropdownMenuItem(
                        value: c.remoteId, child: Text(c.name ?? '-')))
                    .toList(),
                onChanged: (v) => setState(() => _ownerId = v),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: DropdownButtonFormField<String>(
                value: _brokerId,
                decoration: _deco('Môi giới phụ trách'),
                items: brokers
                    .map((b) => DropdownMenuItem(
                        value: b.remoteId, child: Text(b.fullName ?? '-')))
                    .toList(),
                onChanged: (v) => setState(() => _brokerId = v),
              )),
            ]),
            const SizedBox(height: 16),
            Text('Địa chỉ',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: _field('Tỉnh/Thành phố', _province)),
              const SizedBox(width: 12),
              Expanded(child: _field('Quận/Huyện', _district)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _field('Phường/Xã', _ward)),
              const SizedBox(width: 12),
              Expanded(child: _field('Khu vực', _area)),
            ]),
            const SizedBox(height: 16),
            Text('Thông số',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: _field('Giá bán (tỷ) *', _price,
                      validator: (v) =>
                          double.tryParse(v ?? '') == null ? 'Nhập số' : null,
                      keyboard: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(
                  child: _field('Diện tích (m²)', _areaSize,
                      keyboard: TextInputType.number)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: _field('Ngang (m)', _width,
                      keyboard: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(
                  child: _field('Dài (m)', _length,
                      keyboard: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(
                  child: _field('Số tầng', _floors,
                      keyboard: TextInputType.number)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: _field('Phòng ngủ', _bedrooms,
                      keyboard: TextInputType.number)),
              const SizedBox(width: 12),
              Expanded(
                  child: _field('WC', _bathrooms,
                      keyboard: TextInputType.number)),
            ]),
            const SizedBox(height: 16),
            Text('Phân loại & đặc điểm',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _type,
              decoration: _deco('Loại BĐS (§8)'),
              items: _optionItems(BdsBusinessLogic.allPropertyTypes, _type),
              onChanged: (v) => setState(() => _type = v),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: DropdownButtonFormField<String>(
                value: _direction,
                decoration: _deco('Hướng'),
                items: _optionItems(BdsBusinessLogic.directions, _direction),
                onChanged: (v) => setState(() => _direction = v),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: DropdownButtonFormField<String>(
                value: _frontage,
                decoration: _deco('Mặt tiền'),
                items: _optionItems(BdsBusinessLogic.frontages, _frontage),
                onChanged: (v) => setState(() => _frontage = v),
              )),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: DropdownButtonFormField<String>(
                value: _legal,
                decoration: _deco('Pháp lý'),
                items:
                    _optionItems(BdsBusinessLogic.legalStatuses, _legal),
                onChanged: (v) => setState(() => _legal = v),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: DropdownButtonFormField<PropertyStatus>(
                value: _status,
                decoration: _deco('Trạng thái'),
                items: const [
                  PropertyStatus.available,
                  PropertyStatus.negotiating,
                  PropertyStatus.deposited,
                  PropertyStatus.sold,
                ]
                    .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text(switch (s) {
                          PropertyStatus.available => 'Đang rao',
                          PropertyStatus.negotiating => 'Đang giao dịch',
                          PropertyStatus.deposited => 'Đặt cọc',
                          PropertyStatus.sold => 'Đã bán',
                        })))
                    .toList(),
                onChanged: (v) =>
                    setState(() => _status = v ?? PropertyStatus.available),
              )),
            ]),
            const SizedBox(height: 12),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text('Đặc điểm nổi bật (§9):')),
            Wrap(
              spacing: 6,
              children: BdsBusinessLogic.features
                  .map((f) => FilterChip(
                        label: Text(f, style: const TextStyle(fontSize: 12)),
                        selected: _features.contains(f),
                        onSelected: (sel) => setState(() {
                          sel ? _features.add(f) : _features.remove(f);
                        }),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: const Text('LƯU LẠI'),
            ),
          ],
        ),
      ),
    );
  }
}

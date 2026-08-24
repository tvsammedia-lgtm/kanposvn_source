import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/customer.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Thêm/sửa khách hàng — nhu cầu mua đầy đủ theo PRD kanbatdongsan.md mục 6.
class CustomerFormScreen extends ConsumerStatefulWidget {
  final Customer? customer;
  final CustomerType initialType;

  const CustomerFormScreen({super.key, this.customer, this.initialType = CustomerType.buyer});

  @override
  ConsumerState<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends ConsumerState<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _address;
  late final TextEditingController _notes;
  late final TextEditingController _dCity;
  late final TextEditingController _dDistrict;
  late final TextEditingController _dWard;
  late final TextEditingController _dArea;
  late final TextEditingController _priceFrom;
  late final TextEditingController _priceTo;
  late final TextEditingController _areaFrom;
  late final TextEditingController _areaTo;

  late CustomerType _type;
  bool _isVip = false;
  String? _dType;
  String? _dDirection;
  String? _dFrontage;
  String? _dLegal;

  bool get _isEdit => widget.customer != null;

  @override
  void initState() {
    super.initState();
    final c = widget.customer;
    _type = c?.type ?? widget.initialType;
    _isVip = c?.isVip ?? false;
    _name = TextEditingController(text: c?.name ?? '');
    _phone = TextEditingController(text: c?.phone ?? '');
    _email = TextEditingController(text: c?.email ?? '');
    _address = TextEditingController(text: c?.address ?? '');
    _notes = TextEditingController(text: c?.notes ?? '');
    _dCity = TextEditingController(text: c?.demandCity ?? '');
    _dDistrict = TextEditingController(text: c?.demandDistrict ?? '');
    _dWard = TextEditingController(text: c?.demandWard ?? '');
    _dArea = TextEditingController(text: c?.demandArea ?? '');
    _priceFrom =
        TextEditingController(text: c?.demandPriceFrom?.toString() ?? '');
    _priceTo = TextEditingController(text: c?.demandPriceTo?.toString() ?? '');
    _areaFrom =
        TextEditingController(text: c?.demandAreaFrom?.toString() ?? '');
    _areaTo = TextEditingController(text: c?.demandAreaTo?.toString() ?? '');
    _dType = c?.demandPropertyType;
    _dDirection = c?.demandDirection;
    _dFrontage = c?.demandFrontage;
    _dLegal = c?.demandLegalStatus;
  }

  @override
  void dispose() {
    for (final c in [
      _name,
      _phone,
      _email,
      _address,
      _notes,
      _dCity,
      _dDistrict,
      _dWard,
      _dArea,
      _priceFrom,
      _priceTo,
      _areaFrom,
      _areaTo
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final customer = widget.customer ?? Customer();
    if (!_isEdit) customer.remoteId ??= const Uuid().v4();
    customer.name = _name.text.trim();
    customer.phone = _phone.text.trim();
    customer.email = _email.text.trim();
    customer.address = _address.text.trim();
    customer.notes = _notes.text.trim();
    customer.type = _type;
    customer.isVip = _isVip;
    if (_type == CustomerType.buyer) {
      customer.demandCity = _dCity.text.trim();
      customer.demandDistrict = _dDistrict.text.trim();
      customer.demandWard = _dWard.text.trim();
      customer.demandArea = _dArea.text.trim();
      customer.demandPriceFrom = double.tryParse(_priceFrom.text);
      customer.demandPriceTo = double.tryParse(_priceTo.text);
      customer.demandAreaFrom = double.tryParse(_areaFrom.text);
      customer.demandAreaTo = double.tryParse(_areaTo.text);
      customer.demandPropertyType = _dType;
      customer.demandDirection = _dDirection;
      customer.demandFrontage = _dFrontage;
      customer.demandLegalStatus = _dLegal;
    }

    await ref.read(customerRepositoryProvider).saveCustomer(customer);
    ref.invalidate(customersProvider);

    if (!mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(_isEdit ? 'Đã cập nhật khách hàng' : 'Đã thêm khách hàng')));
  }

  InputDecoration _deco(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  /// Option + giá trị hiện tại (phòng dữ liệu cũ ngoài danh sách).
  List<DropdownMenuItem<String>> _optionItems(
          List<String> options, String? current) =>
      [
        if (current != null &&
            current.isNotEmpty &&
            !options.contains(current))
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
    return Scaffold(
      appBar: AppBar(
          title: Text(
              _isEdit ? 'Sửa khách hàng' : (_type == CustomerType.buyer ? 'Thêm khách mua' : 'Thêm khách bán'))),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SegmentedButton<CustomerType>(
              segments: const [
                ButtonSegment(
                    value: CustomerType.buyer,
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Khách mua')),
                ButtonSegment(
                    value: CustomerType.seller,
                    icon: Icon(Icons.sell),
                    label: Text('Khách bán')),
              ],
              selected: {_type},
              onSelectionChanged: (sel) =>
                  setState(() => _type = sel.first),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Khách VIP'),
              subtitle: const Text('Ưu tiên chăm sóc, hiển thị nhãn VIP'),
              value: _isVip,
              onChanged: (v) => setState(() => _isVip = v),
            ),
            const SizedBox(height: 8),
            _field('Họ tên *', _name,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Bắt buộc nhập' : null),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: _field('Điện thoại', _phone,
                      keyboard: TextInputType.phone)),
              const SizedBox(width: 12),
              Expanded(child: _field('Email', _email)),
            ]),
            const SizedBox(height: 12),
            _field('Địa chỉ', _address),
            const SizedBox(height: 12),
            _field('Ghi chú', _notes),

            // ================= NHU CẦU KHÁCH MUA (§6) =================
            if (_type == CustomerType.buyer) ...[
              const SizedBox(height: 20),
              Text('Nhu cầu tìm kiếm',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(child: _field('Thành phố', _dCity)),
                const SizedBox(width: 12),
                Expanded(child: _field('Quận/Huyện', _dDistrict)),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(child: _field('Phường/Xã', _dWard)),
                const SizedBox(width: 12),
                Expanded(child: _field('Khu vực', _dArea)),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: _field('Giá từ (tỷ)', _priceFrom,
                        keyboard: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(
                    child: _field('Giá đến (tỷ)', _priceTo,
                        keyboard: TextInputType.number)),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                    child: _field('DT từ (m²)', _areaFrom,
                        keyboard: TextInputType.number)),
                const SizedBox(width: 12),
                Expanded(
                    child: _field('DT đến (m²)', _areaTo,
                        keyboard: TextInputType.number)),
              ]),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _dType,
                decoration: _deco('Loại BĐS mong muốn'),
                items:
                    _optionItems(BdsBusinessLogic.allPropertyTypes, _dType),
                onChanged: (v) => setState(() => _dType = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _dDirection,
                decoration: _deco('Hướng mong muốn'),
                items:
                    _optionItems(BdsBusinessLogic.directions, _dDirection),
                onChanged: (v) => setState(() => _dDirection = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _dFrontage,
                decoration: _deco('Mặt tiền mong muốn'),
                items:
                    _optionItems(BdsBusinessLogic.frontages, _dFrontage),
                onChanged: (v) => setState(() => _dFrontage = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _dLegal,
                decoration: _deco('Pháp lý mong muốn'),
                items:
                    _optionItems(BdsBusinessLogic.legalStatuses, _dLegal),
                onChanged: (v) => setState(() => _dLegal = v),
              ),
            ],
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

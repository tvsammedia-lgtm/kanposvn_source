import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../providers/pawn_provider.dart';
import '../../providers/customer_provider.dart';
import '../../models/pawn_contract.dart';
import '../../models/customer.dart';

class PawnCreateScreen extends ConsumerStatefulWidget {
  const PawnCreateScreen({super.key});

  @override
  ConsumerState<PawnCreateScreen> createState() => _PawnCreateScreenState();
}

class _PawnCreateScreenState extends ConsumerState<PawnCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  // Customer
  final _customerNameCtrl = TextEditingController();
  final _customerPhoneCtrl = TextEditingController();
  final _cccdCtrl = TextEditingController();
  Customer? _selectedCustomer;

  // Asset
  final _assetDescCtrl = TextEditingController();
  final _assetModelCtrl = TextEditingController();
  final _assetBrandCtrl = TextEditingController();
  final _imeiCtrl = TextEditingController();
  final _serialCtrl = TextEditingController();
  final _assetValueCtrl = TextEditingController();

  // Pawn terms
  final _pawnAmountCtrl = TextEditingController();
  final _interestRateCtrl = TextEditingController();
  InterestType _interestType = InterestType.daily;
  int _numberOfDays = 30;

  @override
  void dispose() {
    _customerNameCtrl.dispose();
    _customerPhoneCtrl.dispose();
    _cccdCtrl.dispose();
    _assetDescCtrl.dispose();
    _assetModelCtrl.dispose();
    _assetBrandCtrl.dispose();
    _imeiCtrl.dispose();
    _serialCtrl.dispose();
    _assetValueCtrl.dispose();
    _pawnAmountCtrl.dispose();
    _interestRateCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final customer = _selectedCustomer ?? Customer()
      ..customerCode = 'KH${const Uuid().v4().substring(0, 8).toUpperCase()}'
      ..fullName = _customerNameCtrl.text
      ..phone = _customerPhoneCtrl.text
      ..cccd = _cccdCtrl.text
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    final pawnDate = DateTime.now();
    final contract = PawnContract()
      ..contractNumber = 'HD${DateTime.now().millisecondsSinceEpoch}'
      ..description = _assetDescCtrl.text
      ..assetModel = _assetModelCtrl.text
      ..assetBrand = _assetBrandCtrl.text
      ..imei = _imeiCtrl.text
      ..serial = _serialCtrl.text
      ..assetValue = double.tryParse(_assetValueCtrl.text) ?? 0
      ..pawnAmount = double.tryParse(_pawnAmountCtrl.text) ?? 0
      ..interestRate = double.tryParse(_interestRateCtrl.text) ?? 0
      ..interestType = _interestType
      ..pawnDate = pawnDate
      ..dueDate = pawnDate.add(Duration(days: _numberOfDays))
      ..numberOfDays = _numberOfDays
      ..status = PawnStatus.active
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    ref.read(pawnProvider.notifier).addContract(contract, customer);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tạo hợp đồng thành công!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tạo Hợp Đồng Cầm Đồ')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // --- CHỌN KHÁCH HÀNG ---
            _sectionTitle('KHÁCH HÀNG'),
            _customersDropdown(),
            if (_selectedCustomer == null) ...[
              _field(_customerNameCtrl, 'Họ và tên', required: true),
              _field(_customerPhoneCtrl, 'Số điện thoại', keyboard: TextInputType.phone),
              _field(_cccdCtrl, 'Số CCCD', keyboard: TextInputType.number),
            ],
            const SizedBox(height: 16),

            // --- TÀI SẢN ---
            _sectionTitle('TÀI SẢN CẦM'),
            _field(_assetDescCtrl, 'Mô tả tài sản (VD: iPhone 14 Pro Max)', required: true),
            Row(
              children: [
                Expanded(child: _field(_assetBrandCtrl, 'Hãng')),
                const SizedBox(width: 8),
                Expanded(child: _field(_assetModelCtrl, 'Model')),
              ],
            ),
            Row(
              children: [
                Expanded(child: _field(_imeiCtrl, 'IMEI')),
                const SizedBox(width: 8),
                Expanded(child: _field(_serialCtrl, 'Serial')),
              ],
            ),
            _field(_assetValueCtrl, 'Giá trị tài sản (đ)', keyboard: TextInputType.number),
            const SizedBox(height: 16),

            // --- ĐIỀU KHOẢN CẦM ---
            _sectionTitle('ĐIỀU KHOẢN'),
            _field(_pawnAmountCtrl, 'Tiền cầm (đ)', required: true, keyboard: TextInputType.number),

            // Lãi suất
            _field(_interestRateCtrl, 'Lãi suất', required: true, keyboard: TextInputType.number),

            // Loại lãi suất
            const Text('Loại lãi suất', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            SegmentedButton<InterestType>(
              segments: const [
                ButtonSegment(value: InterestType.daily, label: Text('Ngày')),
                ButtonSegment(value: InterestType.monthly, label: Text('Tháng')),
                ButtonSegment(value: InterestType.yearly, label: Text('Năm')),
                ButtonSegment(value: InterestType.fixedAmount, label: Text('Cố định')),
              ],
              selected: {_interestType},
              onSelectionChanged: (s) => setState(() => _interestType = s.first),
            ),
            const SizedBox(height: 12),

            // Số ngày
            Row(
              children: [
                const Text('Số ngày cầm: '),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: _numberOfDays > 1 ? () => setState(() => _numberOfDays--) : null,
                ),
                Text('$_numberOfDays ngày', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _numberOfDays++),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Ngày đáo hạn: ${_formatDate(DateTime.now().add(Duration(days: _numberOfDays)))}',
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Nút tạo
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save),
                label: const Text('Tạo Hợp Đồng'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFB45309),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customersDropdown() {
    final customerState = ref.watch(customerProvider);
    return customerState.when(
      data: (customers) => DropdownButtonFormField<Customer>(
        value: _selectedCustomer,
        hint: const Text('Chọn khách hàng có sẵn'),
        isExpanded: true,
        decoration: const InputDecoration(border: OutlineInputBorder(), isDense: true),
        items: customers.map((c) => DropdownMenuItem(
          value: c,
          child: Text('${c.fullName ?? "?"} - ${c.phone ?? ""}'),
        )).toList(),
        onChanged: (v) => setState(() => _selectedCustomer = v),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Lỗi tải danh sách KH'),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFB45309))),
    );
  }

  Widget _field(TextEditingController ctrl, String label, {bool required = false, TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyboard,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), isDense: true),
        validator: required ? (v) => (v == null || v.isEmpty) ? 'Bắt buộc' : null : null,
      ),
    );
  }

  String _formatDate(DateTime d) => '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}

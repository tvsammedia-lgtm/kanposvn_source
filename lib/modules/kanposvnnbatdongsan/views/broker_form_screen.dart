import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/broker.dart';
import '../providers/batdongsan_providers.dart';

/// Thêm/sửa môi giới — đủ thông tin theo PRD kanbatdongsan.md mục 4.2.
class BrokerFormScreen extends ConsumerStatefulWidget {
  final Broker? broker;

  const BrokerFormScreen({super.key, this.broker});

  @override
  ConsumerState<BrokerFormScreen> createState() => _BrokerFormScreenState();
}

class _BrokerFormScreenState extends ConsumerState<BrokerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _code;
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _cccd;
  late final TextEditingController _branch;
  DateTime? _joinDate;
  late BrokerStatus _status;

  bool get _isEdit => widget.broker != null;

  @override
  void initState() {
    super.initState();
    final b = widget.broker;
    _code = TextEditingController(text: b?.brokerCode ?? '');
    _name = TextEditingController(text: b?.fullName ?? '');
    _phone = TextEditingController(text: b?.phone ?? '');
    _email = TextEditingController(text: b?.email ?? '');
    _cccd = TextEditingController(text: b?.cccd ?? '');
    _branch = TextEditingController(text: b?.branch ?? '');
    _joinDate = b?.joinDate;
    _status = b?.status ?? BrokerStatus.active;
  }

  @override
  void dispose() {
    for (final c in [_code, _name, _phone, _email, _cccd, _branch]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final broker = widget.broker ?? Broker();
    if (!_isEdit) broker.remoteId ??= const Uuid().v4();
    broker.brokerCode =
        _code.text.trim().isEmpty ? null : _code.text.trim();
    broker.fullName = _name.text.trim();
    broker.phone = _phone.text.trim();
    broker.email = _email.text.trim();
    broker.cccd = _cccd.text.trim();
    broker.branch = _branch.text.trim();
    broker.joinDate = _joinDate;
    broker.status = _status;

    await ref.read(brokerRepositoryProvider).saveBroker(broker);
    ref.invalidate(brokersProvider);

    if (!mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(_isEdit ? 'Đã cập nhật môi giới' : 'Đã thêm môi giới')));
  }

  InputDecoration _deco(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  Widget _field(String label, TextEditingController c,
          {bool required = false,
          TextInputType? keyboard}) =>
      TextFormField(
        controller: c,
        keyboardType: keyboard,
        decoration: _deco(label),
        validator: (v) => (required && (v == null || v.isEmpty))
            ? 'Bắt buộc nhập'
            : null,
      );

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _joinDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _joinDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Sửa môi giới' : 'Thêm môi giới')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _field('Họ tên *', _name, required: true),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _field('Mã môi giới', _code)),
              const SizedBox(width: 12),
              Expanded(
                  child: _field('SĐT', _phone, keyboard: TextInputType.phone)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _field('Email', _email)),
              const SizedBox(width: 12),
              Expanded(child: _field('CCCD', _cccd)),
            ]),
            const SizedBox(height: 12),
            _field('Chi nhánh', _branch),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: _deco('Ngày vào làm'),
                    child: Text(_joinDate == null
                        ? 'Chưa chọn'
                        : '${_joinDate!.day}/${_joinDate!.month}/${_joinDate!.year}'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<BrokerStatus>(
                  value: _status,
                  decoration: _deco('Trạng thái'),
                  items: const [
                    DropdownMenuItem(
                        value: BrokerStatus.active, child: Text('Đang làm')),
                    DropdownMenuItem(
                        value: BrokerStatus.inactive, child: Text('Nghỉ')),
                    DropdownMenuItem(
                        value: BrokerStatus.suspended,
                        child: Text('Đình chỉ')),
                  ],
                  onChanged: (v) =>
                      setState(() => _status = v ?? BrokerStatus.active),
                ),
              ),
            ]),
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

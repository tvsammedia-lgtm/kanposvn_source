import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/customer.dart';
import '../models/property.dart';
import '../models/transaction.dart';
import '../providers/batdongsan_providers.dart';
import '../services/batdongsan_business_logic.dart';

/// Thêm/sửa giao dịch — theo PRD kanbatdongsan.md mục 12/13.
class TransactionFormScreen extends ConsumerStatefulWidget {
  final TransactionRecord? transaction;

  const TransactionFormScreen({super.key, this.transaction});

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _finalPrice;
  late final TextEditingController _askingPrice;
  late final TextEditingController _commission;
  late final TextEditingController _floorFee;
  late final TextEditingController _commissionRate;
  late final TextEditingController _bonus;
  late final TextEditingController _deduction;
  late final TextEditingController _notes;
  DateTime _date = DateTime.now();

  String? _sellerId;
  String? _buyerId;
  String? _propertyKey;
  String? _brokerId;
  late TransactionStatus _status;

  bool get _isEdit => widget.transaction != null;

  static const _statusLabels = {
    TransactionStatus.negotiating: 'Đang đàm phán',
    TransactionStatus.deposited: 'Đặt cọc',
    TransactionStatus.notarized: 'Đã công chứng',
    TransactionStatus.completed: 'Hoàn thành',
    TransactionStatus.cancelled: 'Đã hủy',
  };

  @override
  void initState() {
    super.initState();
    final t = widget.transaction;
    _sellerId = t?.sellerId;
    _buyerId = t?.buyerId;
    _propertyKey = t?.propertyId;
    _brokerId = t?.brokerId;
    _date = t?.transactionDate ?? DateTime.now();
    _status = t?.status ?? TransactionStatus.negotiating;
    _askingPrice =
        TextEditingController(text: t?.askingPrice?.toString() ?? '');
    _finalPrice = TextEditingController(text: t?.finalPrice?.toString() ?? '');
    _commission = TextEditingController(text: t?.commission?.toString() ?? '');
    _floorFee = TextEditingController(text: t?.floorFee?.toString() ?? '');
    _commissionRate =
        TextEditingController(text: t?.commissionRate?.toString() ?? '');
    _bonus = TextEditingController(text: t?.brokerBonus?.toString() ?? '');
    _deduction =
        TextEditingController(text: t?.brokerDeduction?.toString() ?? '');
    _notes = TextEditingController(text: t?.notes ?? '');

    // Tự gợi ý hoa hồng 2% + phí sàn 1% trên giá chốt.
    void suggest(String value) {
      if (_isEdit) return;
      final price = double.tryParse(value);
      if (price != null) {
        _commission.text = (price * 0.02).toStringAsFixed(3);
        _floorFee.text = (price * 0.01).toStringAsFixed(3);
        setState(() {});
      }
    }

    _finalPrice.addListener(() => suggest(_finalPrice.text));
  }

  @override
  void dispose() {
    for (final c in [
      _askingPrice,
      _finalPrice,
      _commission,
      _floorFee,
      _commissionRate,
      _bonus,
      _deduction,
      _notes
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final tx = widget.transaction ?? TransactionRecord();
    if (!_isEdit) {
      tx.remoteId ??= const Uuid().v4();
      final all = await ref.read(transactionsProvider.future);
      tx.transactionCode = BdsBusinessLogic.nextTransactionCode(all);
    }
    tx.sellerId = _sellerId;
    tx.buyerId = _buyerId;
    tx.propertyId = _propertyKey;
    tx.brokerId = _brokerId;
    tx.transactionDate = _date;
    tx.askingPrice = double.tryParse(_askingPrice.text);
    tx.finalPrice = double.tryParse(_finalPrice.text);
    tx.commission = double.tryParse(_commission.text);
    tx.floorFee = double.tryParse(_floorFee.text);
    tx.commissionRate = double.tryParse(_commissionRate.text);
    tx.brokerBonus = double.tryParse(_bonus.text);
    tx.brokerDeduction = double.tryParse(_deduction.text);
    tx.notes = _notes.text.trim().isEmpty ? null : _notes.text.trim();
    tx.status = _status;

    await ref.read(transactionRepositoryProvider).saveTransaction(tx);

    // Đồng bộ trạng thái BĐS khi tạo GD đặt cọc / đàm phán.
    final props = ref.read(propertiesProvider).value ?? [];
    for (final p in props) {
      if ((p.propertyCode == tx.propertyId || p.remoteId == tx.propertyId) &&
          p.status == PropertyStatus.available &&
          (_status == TransactionStatus.deposited ||
              _status == TransactionStatus.negotiating)) {
        p.status = _status == TransactionStatus.deposited
            ? PropertyStatus.deposited
            : PropertyStatus.negotiating;
        await ref.read(propertyRepositoryProvider).saveProperty(p);
        ref.invalidate(propertiesProvider);
        break;
      }
    }

    ref.invalidate(transactionsProvider);
    ref.invalidate(dashboardMetricsProvider);

    if (!mounted) return;
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            _isEdit ? 'Đã cập nhật giao dịch' : 'Đã tạo ${tx.transactionCode}')));
  }

  InputDecoration _deco(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      );

  Widget _num(String label, TextEditingController c,
          {bool required = false}) =>
      TextFormField(
        controller: c,
        keyboardType: TextInputType.number,
        decoration: _deco(label),
        validator: required
            ? (v) =>
                v == null || v.isEmpty || double.tryParse(v) == null
                    ? 'Nhập số hợp lệ'
                    : null
            : null,
      );

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    final buyersAsync = ref.watch(buyersProvider);
    final sellersAsync = ref.watch(sellersProvider);
    final brokersAsync = ref.watch(brokersProvider);
    final propsAsync = ref.watch(propertiesProvider);

    // BĐS chọn được: đang rao/đang GD/đặt cọc (trừ đã bán khi tạo mới).
    final selectableProps = (propsAsync.value ?? []).where((p) {
      final isCurrentTxProperty =
          p.propertyCode == _propertyKey || p.remoteId == _propertyKey;
      if (_isEdit && isCurrentTxProperty) return true;
      return p.status != PropertyStatus.sold;
    }).toList();

    // Khi sửa: chỉ cho chọn trạng thái hợp lệ theo luồng.
    final statusChoices = _isEdit
        ? [widget.transaction!.status, ...BdsBusinessLogic.nextStatuses(widget.transaction!.status)]
        : [TransactionStatus.negotiating];

    return Scaffold(
      appBar: AppBar(
          title:
              Text(_isEdit ? 'Sửa giao dịch' : 'Tạo giao dịch mới')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<Customer>(
              value: null,
              decoration:
                  _deco('Người bán * (${_sellerId == null ? "chưa chọn" : "đã chọn"})'),
              items: (sellersAsync.value ?? [])
                  .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text('${c.name} · ${c.phone ?? ''}',
                          overflow: TextOverflow.ellipsis)))
                  .toList(),
              onChanged: (c) => setState(() => _sellerId = c?.remoteId),
              validator: (_) => _sellerId == null ? 'Chọn người bán' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Customer>(
              value: null,
              decoration:
                  _deco('Người mua * (${_buyerId == null ? "chưa chọn" : "đã chọn"})'),
              items: (buyersAsync.value ?? [])
                  .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text('${c.name} · ${c.phone ?? ''}',
                          overflow: TextOverflow.ellipsis)))
                  .toList(),
              onChanged: (c) => setState(() => _buyerId = c?.remoteId),
              validator: (_) => _buyerId == null ? 'Chọn người mua' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<BdsProperty>(
              value: selectableProps
                  .where((p) =>
                      p.propertyCode == _propertyKey ||
                      p.remoteId == _propertyKey)
                  .firstOrNull,
              isExpanded: true,
              decoration: _deco('Bất động sản *'),
              items: selectableProps
                  .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text('[${p.propertyCode}] ${p.title ?? ''}',
                          overflow: TextOverflow.ellipsis)))
                  .toList(),
              onChanged: (p) => setState(() {
                _propertyKey = p?.propertyCode;
                if (p?.price != null && !_isEdit) {
                  _askingPrice.text = p!.price.toString();
                }
              }),
              validator: (p) =>
                  _propertyKey == null ? 'Chọn bất động sản' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _brokerId,
              decoration: _deco('Môi giới phụ trách'),
              items: (brokersAsync.value ?? [])
                  .map((b) => DropdownMenuItem(
                      value: b.remoteId,
                      child: Text('${b.fullName} · ${b.branch ?? ''}',
                          overflow: TextOverflow.ellipsis)))
                  .toList(),
              onChanged: (v) => setState(() => _brokerId = v),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: _deco('Ngày giao dịch'),
                    child: Text(DateFormat('dd/MM/yyyy').format(_date)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<TransactionStatus>(
                  value: _status,
                  decoration: _deco('Trạng thái'),
                  items: statusChoices
                      .map((s) => DropdownMenuItem(
                          value: s, child: Text(_statusLabels[s]!)))
                      .toList(),
                  onChanged: (v) =>
                      setState(() => _status = v ?? TransactionStatus.negotiating),
                ),
              ),
            ]),
            const SizedBox(height: 16),
            Row(children: [
              Expanded(child: _num('Giá bán (tỷ)', _askingPrice)),
              const SizedBox(width: 12),
              Expanded(
                  child: _num('Giá chốt (tỷ) *', _finalPrice, required: true)),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: TextFormField(
                controller: _commission,
                keyboardType: TextInputType.number,
                decoration: _deco('Hoa hồng (tỷ)'),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                controller: _floorFee,
                keyboardType: TextInputType.number,
                decoration: _deco('Phí sàn (tỷ)'),
              )),
            ]),
            const SizedBox(height: 16),
            Text('Hoa hồng môi giới (§13)',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                  child: TextFormField(
                controller: _commissionRate,
                keyboardType: TextInputType.number,
                decoration: _deco('Tỷ lệ MG nhận (%)'),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                controller: _bonus,
                keyboardType: TextInputType.number,
                decoration: _deco('Thưởng (tỷ)'),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: TextFormField(
                controller: _deduction,
                keyboardType: TextInputType.number,
                decoration: _deco('Khấu trừ (tỷ)'),
              )),
            ]),
            Builder(builder: (context) {
              // Xem trước hoa hồng thực nhận.
              final preview = TransactionRecord()
                ..commission = double.tryParse(_commission.text)
                ..commissionRate = double.tryParse(_commissionRate.text)
                ..brokerBonus = double.tryParse(_bonus.text)
                ..brokerDeduction = double.tryParse(_deduction.text);
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'MG thực nhận: '
                  '${BdsBusinessLogic.formatMoney(BdsBusinessLogic.brokerNetCommission(preview))} · '
                  'Công ty giữ: '
                  '${BdsBusinessLogic.formatMoney(BdsBusinessLogic.companyCommissionShare(preview))}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              );
            }),
            const SizedBox(height: 12),
            TextFormField(
              controller: _notes,
              decoration:
                  _deco('Ghi chú').copyWith(border: const OutlineInputBorder()),
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: const Text('LƯU GIAO DỊCH'),
            ),
          ],
        ),
      ),
    );
  }
}

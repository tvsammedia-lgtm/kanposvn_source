import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../providers/spa_providers.dart';
import '../providers/spa_crm_inventory_providers.dart';
import '../models/spa_bed.dart';
import '../models/spa_service_model.dart';
import '../models/spa_technician.dart';
import '../models/spa_session.dart';
import '../models/spa_customer.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';

class SpaPosScreen extends ConsumerStatefulWidget {
  final SpaBed bed;
  const SpaPosScreen({super.key, required this.bed});

  @override
  ConsumerState<SpaPosScreen> createState() => _SpaPosScreenState();
}

class _SpaPosScreenState extends ConsumerState<SpaPosScreen> {
  Timer? _timer;
  final Set<int> _doneSteps = {}; // SOP checklist (§10)

  SpaCustomer? _selectedCustomer;
  SpaServiceModel? _selectedService;
  SpaTechnician? _selectedTech;

  static const _paymentMethods = [
    'Tiền mặt',
    'Chuyển khoản',
    'QR Code',
    'Ví điện tử',
    'Thẻ',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _completePayment(
    BuildContext context,
    SpaSession session,
    ReceiptPrintMode mode, {
    List<Map<String, dynamic>>? payments,
    double tip = 0,
  }) async {
    ref
        .read(spaSessionsProvider.notifier)
        .checkoutSession(session, payments: payments, tip: tip);
    final svc = session.service.value;
    final cus = session.customer.value;
    final total = session.totalAmount + tip;
    try {
      await printReceiptByMode(
        context,
        ref,
        ReceiptData(
          shopName: 'KANPOSVN SPA',
          title: 'HÓA ĐƠN THANH TOÁN',
          orderCode: session.sessionId.length > 8
              ? session.sessionId.substring(0, 8)
              : session.sessionId,
          date: DateTime.now(),
          customer: cus?.name ?? '',
          qrData: session.sessionId,
          items: [
            if (svc != null)
              ReceiptItem(
                name: svc.name,
                quantity: 1,
                unitPrice: svc.price,
                total: svc.price,
              ),
            if (tip > 0)
              ReceiptItem(
                name: 'Tiền tip KTV',
                quantity: 1,
                unitPrice: tip,
                total: tip,
              ),
          ],
          subtotal: total,
          grandTotal: total,
        ),
        mode,
        pdfFilename: 'HoaDon_${session.sessionId.substring(0, 8)}.pdf',
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('In hóa đơn thất bại: $e')),
      );
    }
    if (mounted) Navigator.pop(context);
  }

  /// Dialog thanh toán đa phương thức (§14) + tiền tip (§7).
  void _showPaymentDialog(
      BuildContext context, SpaSession session, ReceiptPrintMode mode) {
    final currency = NumberFormat.currency(
        locale: 'vi_VN', symbol: '₫', decimalDigits: 0);
    final base = session.totalAmount;
    final splits = <String, double>{_paymentMethods.first: base};
    double tip = 0;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDState) {
          final sumPaid = splits.values.fold<double>(0, (s, v) => s + v);
          return AlertDialog(
            title: const Text('Thanh toán'),
            content: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Tổng dịch vụ: ${currency.format(base)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ...splits.entries.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: DropdownButtonFormField<String>(
                                  initialValue: e.key,
                                  decoration:
                                      const InputDecoration(isDense: true),
                                  items: _paymentMethods
                                      .where((m) =>
                                          !splits.containsKey(m) || m == e.key)
                                      .map((m) => DropdownMenuItem(
                                          value: m, child: Text(m)))
                                      .toList(),
                                  onChanged: (v) => setDState(() {
                                    if (v != null && v != e.key) {
                                      final old = Map.of(splits);
                                      splits.clear();
                                      old.forEach((k, val) {
                                        splits[k == e.key ? v : k] = val;
                                      });
                                    }
                                  }),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  initialValue: e.value.toStringAsFixed(0),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      isDense: true, suffixText: '₫'),
                                  onChanged: (v) => splits[e.key] =
                                      double.tryParse(
                                              v.replaceAll(',', '')) ??
                                          0,
                                ),
                              ),
                            ],
                          ),
                        )),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Thêm phương thức'),
                      onPressed: splits.length >= _paymentMethods.length
                          ? null
                          : () => setDState(() {
                                final next = _paymentMethods.firstWhere(
                                    (m) => !splits.containsKey(m));
                                splits[next] = 0;
                              }),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          labelText: 'Tiền tip KTV (tùy chọn)',
                          suffixText: '₫'),
                      keyboardType: TextInputType.number,
                      onChanged: (v) =>
                          tip = double.tryParse(v.replaceAll(',', '')) ?? 0,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cần trả: ${currency.format(base + tip)}'),
                        Text(
                          'Đã trả: ${currency.format(sumPaid)}'
                          '${sumPaid < base ? ' (Chưa đủ phần dịch vụ)' : ''}',
                          style: TextStyle(
                              color:
                                  sumPaid >= base ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Huỷ')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white),
                onPressed: sumPaid >= base && base > 0
                    ? () {
                        Navigator.pop(ctx);
                        _completePayment(context, session, mode,
                            payments: splits.entries
                                .map((e) => {
                                      'method': e.key,
                                      'amount': e.value,
                                    })
                                .toList(),
                            tip: tip);
                      }
                    : null,
                child: const Text('Xác nhận & In bill'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionsAsync = ref.watch(spaSessionsProvider);
    final servicesAsync = ref.watch(spaServicesProvider);
    final techsAsync = ref.watch(spaTechsProvider);
    final customersAsync = ref.watch(spaCustomersProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Giường: ${widget.bed.name} - ${widget.bed.room}')),
      body: sessionsAsync.when(
        data: (sessions) {
          final activeSession = sessions.cast<SpaSession?>().firstWhere(
            (s) => s != null && s.bed.value?.id == widget.bed.id && s.status == SpaSessionStatus.IN_PROGRESS,
            orElse: () => null,
          );

          if (activeSession == null) {
            // Bed is empty, show selection
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('1. Chọn Khách Hàng (Bắt buộc)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          customersAsync.when(
                            data: (cus) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: cus.map((c) => ChoiceChip(
                                  label: Text('${c.name} (${c.phone})'),
                                  selected: _selectedCustomer?.id == c.id,
                                  onSelected: (sel) {
                                    if (sel) setState(() => _selectedCustomer = c);
                                  },
                                )).toList(),
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (e,_) => Text('Lỗi: $e'),
                          ),
                          if (_selectedCustomer != null)
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical: 8.0),
                               child: Text('Lưu ý y tế: ${_selectedCustomer!.allergies} | ${_selectedCustomer!.medicalCondition}', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                             ),
                          const SizedBox(height: 24),
                          const Text('2. Chọn Dịch vụ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          servicesAsync.when(
                            data: (svcs) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: svcs.map((s) => ChoiceChip(
                                  label: Text('${s.name} (${s.price}đ)'),
                                  selected: _selectedService?.id == s.id,
                                  onSelected: (sel) {
                                    if (sel) setState(() => _selectedService = s);
                                  },
                                )).toList(),
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (e,_) => Text('Lỗi: $e'),
                          ),
                          const SizedBox(height: 24),
                          const Text('3. Chọn Kỹ Thuật Viên', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          techsAsync.when(
                            data: (techs) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: techs.map((t) => ChoiceChip(
                                  label: Text(t.name),
                                  selected: _selectedTech?.id == t.id,
                                  onSelected: (sel) {
                                    if (sel) setState(() => _selectedTech = t);
                                  },
                                )).toList(),
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            error: (e,_) => Text('Lỗi: $e'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.spa, size: 100, color: Colors.pink),
                        const SizedBox(height: 24),
                        Text('Khách hàng: ${_selectedCustomer?.name ?? "Chưa chọn"}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text('Dịch vụ: ${_selectedService?.name ?? "Chưa chọn"}', style: const TextStyle(fontSize: 18)),
                        Text('KTV: ${_selectedTech?.name ?? "Chưa chọn"}', style: const TextStyle(fontSize: 18)),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, padding: const EdgeInsets.all(24)),
                          onPressed: (_selectedCustomer != null && _selectedService != null && _selectedTech != null) ? () {
                            ref.read(spaSessionsProvider.notifier).openSession(widget.bed, _selectedService!, _selectedTech!, _selectedCustomer!);
                          } : null,
                          child: const Text('BẮT ĐẦU DỊCH VỤ', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }


          // Active Session
          final duration = DateTime.now().difference(activeSession.startTime!);
          final timeStr = '${duration.inHours.toString().padLeft(2,'0')}:${(duration.inMinutes%60).toString().padLeft(2,'0')}:${(duration.inSeconds%60).toString().padLeft(2,'0')}';
          final svc = activeSession.service.value;
          final tech = activeSession.technician.value;
          final cus = activeSession.customer.value;

          return Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              width: 500,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('ĐANG PHỤC VỤ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple)),
                      const SizedBox(height: 24),
                      Text('Khách hàng: ${cus?.name}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
                      const SizedBox(height: 8),
                      Text('Dịch vụ: ${svc?.name}', style: const TextStyle(fontSize: 20)),
                      Text('KTV: ${tech?.name}', style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 24),
                      Text(timeStr, style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('Thời gian liệu trình: ${svc?.durationMinutes} phút', style: const TextStyle(color: Colors.grey)),
                      if (svc != null && svc.sopSteps.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Quy trình SOP (${_doneSteps.length}/${svc.sopSteps.length}):',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        ...svc.sopSteps.asMap().entries.map((e) => CheckboxListTile(
                              dense: true,
                              value: _doneSteps.contains(e.key),
                              title: Text(
                                e.value,
                                style: TextStyle(
                                  decoration: _doneSteps.contains(e.key)
                                      ? TextDecoration.lineThrough
                                      : null,
                                  color: _doneSteps.contains(e.key)
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                              onChanged: (v) => setState(() {
                                v == true
                                    ? _doneSteps.add(e.key)
                                    : _doneSteps.remove(e.key);
                              }),
                            )),
                      ],
                      const SizedBox(height: 16),
                      Text('Tổng tiền: ${activeSession.totalAmount.toStringAsFixed(0)} đ', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.all(12),
                              ),
                              onPressed: () => _showPaymentDialog(
                                  context, activeSession, ReceiptPrintMode.thermal80),
                              icon: const Icon(Icons.print,
                                  color: Colors.white, size: 16),
                              label: const Text('IN BILL 80mm',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                padding: const EdgeInsets.all(12),
                              ),
                              onPressed: () => _showPaymentDialog(
                                  context, activeSession, ReceiptPrintMode.pdf),
                              icon: const Icon(Icons.picture_as_pdf,
                                  color: Colors.white, size: 16),
                              label: const Text('IN PDF',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.all(16)),
                          onPressed: () => _showPaymentDialog(
                              context, activeSession, ReceiptPrintMode.auto),
                          child: const Text('HOÀN THÀNH & THANH TOÁN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}

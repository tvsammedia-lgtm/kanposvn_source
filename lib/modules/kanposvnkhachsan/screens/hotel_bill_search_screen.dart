import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';
import '../models/hotel_checkin_checkout.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_receipt_builder.dart';

final _currency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
final _dateFmt = DateFormat('dd/MM/yyyy HH:mm');

class HotelBillSearchScreen extends ConsumerStatefulWidget {
  const HotelBillSearchScreen({super.key});

  @override
  ConsumerState<HotelBillSearchScreen> createState() =>
      _HotelBillSearchScreenState();
}

class _HotelBillSearchScreenState extends ConsumerState<HotelBillSearchScreen> {
  final _searchCtrl = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;

  List<RoomCheckIn> _filter(List<RoomCheckIn> items) {
    final q = _searchCtrl.text.trim().toLowerCase();
    return items.where((c) {
      if (!c.isCheckedOut) return false;
      if (q.isNotEmpty) {
        final code = c.checkInId.toLowerCase();
        final name = (c.customerName).toLowerCase();
        final room = (c.room.value?.roomName ?? '').toLowerCase();
        if (!code.contains(q) && !name.contains(q) && !room.contains(q)) {
          return false;
        }
      }
      final t = c.actualCheckOut ?? c.expectedCheckOut;
      if (t != null) {
        if (_fromDate != null && t.isBefore(_fromDate!)) return false;
        if (_toDate != null && t.isAfter(_toDate!)) return false;
      }
      return true;
    }).toList()
      ..sort((a, b) {
        final ta = a.actualCheckOut ?? a.expectedCheckOut ?? DateTime(0);
        final tb = b.actualCheckOut ?? b.expectedCheckOut ?? DateTime(0);
        return tb.compareTo(ta);
      });
  }

  Future<void> _reprint(RoomCheckIn checkIn) async {
    final orderItems = ref.read(hotelOrderItemsProvider(checkIn.id));
    final items = orderItems.maybeWhen(
      data: (list) => serviceItemsToReceiptItems(list),
      orElse: () => <ReceiptItem>[],
    );
    final gross = (checkIn.roomTotalCharge) + (checkIn.serviceTotalCharge);
    final prePaid = (checkIn.prePaid).clamp(0.0, double.infinity);
    final receipt = await buildHotelReceiptData(
      gross: gross,
      discount: checkIn.discount,
      prePaid: prePaid,
      items: items,
      checkInId: checkIn.checkInId,
      customerName: checkIn.customerName,
      roomName: checkIn.room.value?.roomName ?? '---',
      checkInTime: checkIn.actualCheckIn ?? checkIn.createdAt,
      checkoutTime: checkIn.actualCheckOut ?? checkIn.expectedCheckOut ?? DateTime.now(),
    );
    await printReceiptByMode(context, ref, receipt, ReceiptPrintMode.auto);
  }

  @override
  Widget build(BuildContext context) {
    final checkInsAsync = ref.watch(hotelCheckInsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Tìm hóa đơn'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: 'Tìm theo mã bill, tên khách, phòng...',
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      suffixIcon: _searchCtrl.text.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => setState(() {
                                _searchCtrl.clear();
                              }),
                            ),
                    ),
                    onChanged: (v) => setState(() {}),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      InputChip(
                        avatar: const Icon(Icons.calendar_today, size: 16),
                        label: Text(_fromDate == null
                            ? 'Từ ngày'
                            : 'Từ: ${_dateFmt.format(_fromDate!)}'),
                      onPressed: _pickFrom,
                      visualDensity: VisualDensity.compact,
                    ),
                    InputChip(
                      avatar: const Icon(Icons.calendar_today, size: 16),
                      label: Text(_toDate == null
                          ? 'Đến ngày'
                          : 'Đến: ${_dateFmt.format(_toDate!)}'),
                      onPressed: _pickTo,
                      visualDensity: VisualDensity.compact,
                    ),
                    if (_fromDate != null || _toDate != null)
                      InputChip(
                        label: const Text('Xóa lọc'),
                        onPressed: () => setState(() {
                          _fromDate = null;
                          _toDate = null;
                        }),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
            ),
            Expanded(
              child: checkInsAsync.when(
                data: (list) {
                  final items = _filter(list);
                  if (items.isEmpty) {
                    return const Center(
                      child: Text('Chưa có hóa đơn nào'),
                    );
                  }
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, i) {
                      final c = items[i];
                      final code = c.checkInId.length > 8
                          ? c.checkInId.substring(0, 8)
                          : c.checkInId;
                      final checkoutAt = c.actualCheckOut ?? c.expectedCheckOut;
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.receipt_long, size: 20),
                          ),
                          title: Text(c.customerName.isEmpty
                              ? 'Khách vãng lai'
                              : c.customerName,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            'Mã bill: $code\n${_dateFmt.format(checkoutAt ?? DateTime.now())} · Phòng ${c.room.value?.roomName ?? "---"}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          isThreeLine: true,
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                _currency.format(
                                  (c.roomTotalCharge +
                                          c.serviceTotalCharge -
                                          c.discount -
                                          (c.prePaid).clamp(0.0, double.infinity)).clamp(0.0, double.infinity),
                                ),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              IconButton(
                                icon: const Icon(Icons.print,
                                    color: AppColors.primary),
                                tooltip: 'In lại',
                                onPressed: () => _reprint(c),
                              ),
                            ],
                        ),
                      ),
                    );
                  },
                );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Lỗi tải hóa đơn: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFrom() async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _fromDate ?? DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _fromDate = picked;
        if (_toDate == null || _toDate!.isBefore(_fromDate!)) {
          _toDate = _fromDate;
        }
      });
    }
  }

  Future<void> _pickTo() async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _toDate ?? DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() => _toDate = picked);
    }
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }
}
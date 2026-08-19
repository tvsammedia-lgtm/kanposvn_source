import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/hotel_checkin_checkout.dart';
import '../models/hotel_room.dart';
import '../models/hotel_service.dart';
import '../providers/hotel_providers.dart';
import '../services/hotel_billing_service.dart';
import '../services/hotel_receipt_builder.dart';
import '../../../core/printer/printer_actions.dart';
import '../../../core/printer/receipt_data.dart';
import '../../../core/printer/receipt_print_mode.dart';

class RoomPosScreen extends ConsumerStatefulWidget {
  final HotelRoom room;
  final RoomCheckIn checkIn;
  const RoomPosScreen({super.key, required this.room, required this.checkIn});

  @override
  ConsumerState<RoomPosScreen> createState() => _RoomPosScreenState();
}

class _RoomPosScreenState extends ConsumerState<RoomPosScreen> {
  String _selectedCategory = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    final now = ref.watch(hotelClockProvider);
    final menuAsync = ref.watch(hotelServiceItemsProvider);
    final orderAsync = ref.watch(hotelOrderItemsProvider(widget.checkIn.id));

    final checkInTime = widget.checkIn.actualCheckIn ?? widget.checkIn.createdAt;
    final roomType = widget.room.roomType.value;
    final roomCharge = roomType != null
        ? HotelBillingCalculator.computeRoomCharge(
            roomType: roomType,
            rentalType: widget.checkIn.rentalType,
            checkIn: checkInTime,
            now: now,
          )
        : 0.0;
    final elapsed = HotelBillingCalculator.formatElapsed(checkInTime, now);

    final serviceTotal = orderAsync.maybeWhen(
      data: (items) => items.fold(0.0, (sum, oi) => sum + oi.totalPrice),
      orElse: () => 0.0,
    );
    final grandTotal = roomCharge + serviceTotal;

    return Scaffold(
      appBar: AppBar(
        title: Text('POS Phòng ${widget.room.roomName}'),
        backgroundColor: const Color(0xFF0284C7),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: Colors.white),
            label: const Text('ĐÓNG', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Row(
        children: [
          // -------- Trái: Menu --------
          Expanded(
            flex: 3,
            child: menuAsync.when(
              data: (menu) {
                if (menu.isEmpty) return const Center(child: Text('Menu rỗng. Hãy thêm món trong tab Dịch vụ.'));
                final categories = ['Tất cả', ...menu.map((m) => m.category).toSet()];
                final filteredMenu = _selectedCategory == 'Tất cả'
                    ? menu
                    : menu.where((m) => m.category == _selectedCategory).toList();
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[200],
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories
                              .map((cat) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChoiceChip(
                                      label: Text(cat, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                      selected: _selectedCategory == cat,
                                      onSelected: (sel) {
                                        if (sel) setState(() => _selectedCategory = cat);
                                      },
                                      selectedColor: const Color(0xFF0284C7),
                                      labelStyle: TextStyle(color: _selectedCategory == cat ? Colors.white : Colors.black),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: filteredMenu.length,
                        itemBuilder: (context, index) {
                          final item = filteredMenu[index];
                          return _MenuCard(
                            item: item,
                            onTap: () => ref
                                .read(hotelOrderItemsProvider(widget.checkIn.id).notifier)
                                .addItem(item),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Lỗi: $err')),
            ),
          ),

          // -------- Phải: Hoá đơn + Timer --------
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // Thông tin check-in + timer
                  Container(
                    padding: const EdgeInsets.all(12),
                    color: const Color(0xFFE0F2FE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phòng ${widget.room.roomName}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                elapsed,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Khách: ${widget.checkIn.customerName.isEmpty ? 'Khách vãng lai' : widget.checkIn.customerName}'),
                        Text('Thuê: ${widget.checkIn.rentalType.label}'),
                        Text('Giờ vào: ${_fmt(checkInTime)}'),
                        Text('Giờ ra: ${_fmt(widget.checkIn.actualCheckOut ?? widget.checkIn.expectedCheckOut ?? now)}'),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TIỀN PHÒNG', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('${roomCharge.toStringAsFixed(0)} đ',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Danh sách món đã gọi
                  Expanded(
                    child: orderAsync.when(
                      data: (items) => items.isEmpty
                          ? const Center(child: Text('Chưa có món nào', style: TextStyle(color: Colors.grey, fontSize: 16)))
                          : ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final oi = items[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(oi.serviceItem.value?.itemName ?? '...',
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                            Text('${oi.unitPrice.toStringAsFixed(0)} đ',
                                                style: const TextStyle(color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                                        onPressed: () => ref.read(hotelOrderItemsProvider(widget.checkIn.id).notifier)
                                            .updateQuantity(oi.id, -1),
                                      ),
                                      Text('${oi.quantity}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle, color: Colors.green),
                                        onPressed: () => ref.read(hotelOrderItemsProvider(widget.checkIn.id).notifier)
                                            .updateQuantity(oi.id, 1),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Text('${oi.totalPrice.toStringAsFixed(0)} đ',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, st) => Center(child: Text('Lỗi: $err')),
                    ),
                  ),

                  // Tổng tiền + thanh toán
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFFE0F2FE),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tiền phòng:'),
                            Text('${roomCharge.toStringAsFixed(0)} đ'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Dịch vụ:'),
                            Text('${serviceTotal.toStringAsFixed(0)} đ'),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('TỔNG CỘNG:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('${grandTotal.toStringAsFixed(0)} đ',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                ),
                                onPressed: () => _completeCheckout(
                                  roomCharge,
                                  serviceTotal,
                                  mode: ReceiptPrintMode.thermal80,
                                ),
                                icon: const Icon(Icons.print, color: Colors.white, size: 16),
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
                                ),
                                onPressed: () => _completeCheckout(
                                  roomCharge,
                                  serviceTotal,
                                  mode: ReceiptPrintMode.pdf,
                                ),
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
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () => _checkout(roomCharge, serviceTotal),
                            child: const Text('CHECK-OUT / THANH TOÁN',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _completeCheckout(
    double roomCharge,
    double serviceTotal, {
    double discount = 0,
    double? cashReceived,
    String paymentMethod = 'Tiền mặt',
    ReceiptPrintMode mode = ReceiptPrintMode.auto,
  }) async {
    final checkInTime = widget.checkIn.actualCheckIn ?? widget.checkIn.createdAt;
    final now = DateTime.now();

    // Tính toán thanh toán: amountDue = (phòng + dịch vụ) − giảm giá − đã cọc.
    final gross = roomCharge + serviceTotal;
    final prePaid = (widget.checkIn.prePaid).clamp(0.0, double.infinity);
    final amountDue = (gross - discount - prePaid).clamp(0.0, double.infinity);
    final received = (cashReceived ?? amountDue);

    await ref.read(hotelCheckInsProvider.notifier).checkout(
          widget.checkIn,
          roomTotalCharge: roomCharge,
          discount: discount,
        );
    ref.read(hotelRoomsProvider.notifier).loadRooms();

    final orderItems = ref.read(hotelOrderItemsProvider(widget.checkIn.id));
    final items = orderItems.maybeWhen(
      data: (list) => serviceItemsToReceiptItems(list),
      orElse: () => <ReceiptItem>[],
    );

    try {
      final receipt = await buildHotelReceiptData(
        gross: gross,
        discount: discount,
        prePaid: prePaid,
        items: items,
        checkInId: widget.checkIn.checkInId,
        customerName: widget.checkIn.customerName,
        roomName: widget.room.roomName,
        checkInTime: checkInTime,
        checkoutTime: now,
        rentalType: widget.checkIn.rentalType,
        cashReceived: received,
        paymentMethod: paymentMethod,
      );
      await printReceiptByMode(
        context,
        ref,
        receipt,
        mode,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('In hóa đơn thất bại: $e')),
      );
    }
    if (mounted) Navigator.of(context).pop();
  }

  Future<void> _checkout(double roomCharge, double serviceTotal) async {
    final discountController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận Check-out'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phòng ${widget.room.roomName} - ${widget.checkIn.rentalType.label}'),
            const SizedBox(height: 8),
            Text('Tiền phòng: ${roomCharge.toStringAsFixed(0)} đ'),
            Text('Tiền dịch vụ: ${serviceTotal.toStringAsFixed(0)} đ'),
            Text('Tổng: ${(roomCharge + serviceTotal).toStringAsFixed(0)} đ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Đã cọc: ${widget.checkIn.prePaid.toStringAsFixed(0)} đ'),
            const SizedBox(height: 12),
            const Text('Giảm giá (đ):'),
            TextField(
              controller: discountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(hintText: '0'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('XÁC NHẬN')),
        ],
      ),
    );
    if (confirmed != true) return;

    final discount = double.tryParse(discountController.text) ?? 0;
    final gross = roomCharge + serviceTotal;
    final prePaid = (widget.checkIn.prePaid).clamp(0.0, double.infinity);
    final amountDue = (gross - discount - prePaid).clamp(0.0, double.infinity);

    // Bước thanh toán: ghi nhận phương thức + số tiền khách đưa để in hóa đơn
    // có đủ dòng "Khách đưa / Tiền thừa".
    String paymentMethod = 'Tiền mặt';
    final receivedController =
        TextEditingController(text: amountDue.toStringAsFixed(0));
    final payConfirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Thanh toán'),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Số tiền cần thu: ${amountDue.toStringAsFixed(0)} đ',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                items: const [
                  DropdownMenuItem(value: 'Tiền mặt', child: Text('Tiền mặt')),
                  DropdownMenuItem(value: 'Chuyển khoản', child: Text('Chuyển khoản')),
                  DropdownMenuItem(value: 'Thẻ', child: Text('Thẻ')),
                ],
                onChanged: (v) => paymentMethod = v ?? 'Tiền mặt',
                decoration: const InputDecoration(labelText: 'Phương thức'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: receivedController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*'))],
                decoration: const InputDecoration(labelText: 'Khách đưa (đ)', hintText: '0'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('HỦY')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('IN HÓA ĐƠN')),
        ],
      ),
    );
    if (payConfirmed != true) return;

    final received = double.tryParse(receivedController.text) ?? amountDue;
    await _completeCheckout(
      roomCharge,
      serviceTotal,
      discount: discount,
      cashReceived: received,
      paymentMethod: paymentMethod,
      mode: ReceiptPrintMode.auto,
    );
  }

  String _fmt(DateTime t) =>
      '${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')}/${t.year} '
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}

class _MenuCard extends StatelessWidget {
  final HotelServiceItem item;
  final VoidCallback onTap;
  const _MenuCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.itemName, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 8),
              Text('${item.price.toStringAsFixed(0)} đ',
                  style: const TextStyle(color: Color(0xFF0284C7), fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

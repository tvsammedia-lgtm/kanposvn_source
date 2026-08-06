import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/cafe_table.dart';
import '../models/cafe_order.dart';
import '../providers/cafe_providers.dart';
import '../cafe_navigation.dart';

class TablesScreen extends ConsumerStatefulWidget {
  const TablesScreen({super.key});

  @override
  ConsumerState<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends ConsumerState<TablesScreen> {
  final currencyFormatter = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'đ',
    decimalDigits: 0,
  );
  String? _selectedTableId;

  @override
  Widget build(BuildContext context) {
    final areas = ref.watch(cafeAreasProvider);
    final tables = ref.watch(cafeTablesProvider);
    final orders = ref.watch(cafeOrdersProvider);
    final posCart = ref.watch(cafePosCartProvider);

    final selectedTable = _selectedTableId != null
        ? tables.where((t) => t.id == _selectedTableId).firstOrNull
        : null;

    CafeOrder? selectedOrder;
    if (selectedTable != null) {
      final found = _findActiveOrder(selectedTable, orders);
      final cartMatch = posCart.tableId == selectedTable.id;
      if (found != null && found.items.isNotEmpty) {
        selectedOrder = found;
      } else if (cartMatch && posCart.items.isNotEmpty) {
        selectedOrder = posCart;
      } else {
        selectedOrder = found;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sơ Đồ Bàn - Cafe')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (areas.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Chưa có khu vực nào. Vui lòng seed dữ liệu.'),
                ),
              );
            }

            final isWide = constraints.maxWidth >= 900;
            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                      itemCount: areas.length,
                      itemBuilder: (context, areaIndex) {
                        final area = areas[areaIndex];
                        final areaTables = tables
                            .where((t) => t.areaId == area.id)
                            .toList();
                        final emptyCount = areaTables
                            .where((t) => t.status == TableStatus.trong)
                            .length;
                        final occupiedCount = areaTables.length - emptyCount;

                        return _buildFloorSection(
                          context,
                          area,
                          areaTables,
                          emptyCount,
                          occupiedCount,
                          orders,
                          posCart,
                        );
                      },
                    ),
                  ),
                  const VerticalDivider(width: 1, thickness: 1),
                  Expanded(
                    flex: 2,
                    child: _buildOrderDetailPanel(selectedTable, selectedOrder),
                  ),
                ],
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    itemCount: areas.length,
                    itemBuilder: (context, areaIndex) {
                      final area = areas[areaIndex];
                      final areaTables = tables
                          .where((t) => t.areaId == area.id)
                          .toList();
                      final emptyCount = areaTables
                          .where((t) => t.status == TableStatus.trong)
                          .length;
                      final occupiedCount = areaTables.length - emptyCount;

                      return _buildFloorSection(
                        context,
                        area,
                        areaTables,
                        emptyCount,
                        occupiedCount,
                        orders,
                        posCart,
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                SizedBox(
                  height: constraints.maxHeight * 0.42,
                  child: _buildOrderDetailPanel(selectedTable, selectedOrder),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFloorSection(
    BuildContext context,
    CafeArea area,
    List<CafeTable> areaTables,
    int emptyCount,
    int occupiedCount,
    List<CafeOrder> orders,
    CafeOrder posCart,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Floor header
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber.shade700, Colors.amber.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.stairs, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                area.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              _statBadge(
                Icons.table_restaurant,
                '$emptyCount trống',
                Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 12),
              _statBadge(
                Icons.people,
                '$occupiedCount có khách',
                Colors.white.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
        // Tables row
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
          child: Wrap(
            spacing: 12,
            runSpacing: 14,
            children: areaTables
                .map((t) => _buildTableCard(context, t, orders, posCart))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _statBadge(IconData icon, String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }

  Widget _buildTableCard(
    BuildContext context,
    CafeTable table,
    List<CafeOrder> orders,
    CafeOrder posCart,
  ) {
    final found = _findActiveOrder(table, orders);
    final cartMatch = posCart.tableId == table.id;
    final activeOrder = (found != null && found.items.isNotEmpty)
        ? found
        : (cartMatch && posCart.items.isNotEmpty ? posCart : found);
    final hasGuest = table.customerInfo != null || activeOrder != null;
    final displayStatus = hasGuest && table.status == TableStatus.trong
        ? TableStatus.coKhach
        : table.status;
    final statusColor = Color(displayStatus.colorValue);
    final isSelected = table.id == _selectedTableId;

    final displayName =
        activeOrder?.customerName ?? table.customerInfo?.customerName ?? '';
    final displayTotal =
        activeOrder?.grandTotal ?? table.customerInfo?.currentTotal ?? 0;
    final displayGuestCount = table.customerInfo?.guestCount ?? 1;
    final displayCheckIn =
        table.customerInfo?.checkInTime ??
        activeOrder?.createdAt ??
        DateTime.now();

    String durationText = '';
    if (hasGuest) {
      final diff = DateTime.now().difference(displayCheckIn);
      final hours = diff.inHours.toString().padLeft(2, '0');
      final mins = (diff.inMinutes % 60).toString().padLeft(2, '0');
      durationText = '$hours:$mins';
    }

    return Tooltip(
      message: '${table.name}\n${displayStatus.label}',
      child: GestureDetector(
        onTap: () {
          setState(() => _selectedTableId = table.id);
          _showTableActionSheet(context, table);
        },
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: isSelected
                ? statusColor.withValues(alpha: 0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? statusColor
                  : statusColor.withValues(alpha: 0.6),
              width: isSelected ? 2.5 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: statusColor.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top status bar
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        displayStatus.label,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    if (table.seatCount > 0)
                      Text(
                        '${table.seatCount}gh',
                        style: TextStyle(color: statusColor, fontSize: 10),
                      ),
                  ],
                ),
              ),
              // Table name
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
                child: Text(
                  table.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              // Info section
              if (hasGuest) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    displayName,
                    style: const TextStyle(fontSize: 11, color: Colors.black87),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 2),
                    Text(
                      durationText,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.people, size: 10, color: Colors.grey.shade500),
                    const SizedBox(width: 2),
                    Text(
                      '$displayGuestCount',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  currencyFormatter.format(displayTotal),
                  style: const TextStyle(
                    color: Color(0xFFD97706),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
              ] else if (table.note.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 6),
                  child: Text(
                    table.note,
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ] else ...[
                const SizedBox(height: 6),
                Icon(
                  Icons.table_restaurant_outlined,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 4),
                Text(
                  'Trống',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
                ),
                const SizedBox(height: 6),
              ],
            ],
          ),
        ),
      ),
    );
  }

  CafeOrder? _findActiveOrder(CafeTable table, List<CafeOrder> orders) {
    if (table.activeOrderId != null) {
      try {
        return orders.firstWhere(
          (o) =>
              o.id == table.activeOrderId &&
              o.status != OrderStatus.daThanhToan &&
              o.status != OrderStatus.daHuy,
        );
      } catch (_) {}
    }
    try {
      return orders.firstWhere(
        (o) =>
            o.tableId == table.id &&
            (o.status == OrderStatus.dangPhucVu ||
                o.status == OrderStatus.choThanhToan),
      );
    } catch (_) {
      return null;
    }
  }

  void _showTableActionSheet(BuildContext context, CafeTable table) {
    final orders = ref.read(cafeOrdersProvider);
    final posCart = ref.read(cafePosCartProvider);
    final found = _findActiveOrder(table, orders);
    final cartMatch = posCart.tableId == table.id;
    final activeOrder = (found != null && found.items.isNotEmpty)
        ? found
        : (cartMatch && posCart.items.isNotEmpty ? posCart : found);
    final sheetStatus = activeOrder != null && table.status == TableStatus.trong
        ? TableStatus.coKhach
        : table.status;
    final canAct =
        table.status != TableStatus.dangDon &&
        table.status != TableStatus.daThanhToan;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${table.name} · ${table.areaName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Color(
                        sheetStatus.colorValue,
                      ).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      sheetStatus.label,
                      style: TextStyle(
                        color: Color(table.status.colorValue),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _infoChip(Icons.event_seat, '${table.seatCount} ghế'),
                      if (table.customerInfo != null) ...[
                        const SizedBox(width: 8),
                        _infoChip(
                          Icons.people,
                          '${table.customerInfo!.guestCount} khách',
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 16),
                  // --- Nút GỌI MÓN / THANH TOÁN (trống & có khách đều mở được) ---
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD97706),
                        disabledBackgroundColor: const Color(
                          0xFFD97706,
                        ).withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: Icon(
                        table.status == TableStatus.dangDon
                            ? Icons.cleaning_services
                            : (table.status == TableStatus.daThanhToan
                                  ? Icons.check_circle_outline
                                  : (activeOrder != null
                                        ? Icons.payment
                                        : Icons.add_shopping_cart)),
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        table.status == TableStatus.dangDon
                            ? 'Bàn đang dọn'
                            : (table.status == TableStatus.daThanhToan
                                  ? 'Bàn đã thanh toán'
                                  : (activeOrder != null
                                        ? 'Thanh toán'
                                        : 'Gọi món')),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: canAct
                          ? () {
                              Navigator.pop(ctx);
                              if (activeOrder != null) {
                                _enterOrderForPayment(
                                  context,
                                  table,
                                  activeOrder,
                                );
                              } else {
                                _showOrderTypePickerDialog(context, table);
                              }
                            }
                          : null,
                    ),
                  ),
                  if (activeOrder != null) ...[
                    const SizedBox(height: 8),
                    // Tóm tắt đơn hàng
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 16,
                            color: Colors.amber.shade700,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${activeOrder.items.length} món · ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber.shade900,
                            ),
                          ),
                          Text(
                            currencyFormatter.format(activeOrder.grandTotal),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.amber.shade900,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '#${activeOrder.orderCode}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.amber.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const Divider(),
                  // --- Các thao tác quản lý bàn ---
                  if (table.status == TableStatus.coKhach ||
                      table.status == TableStatus.dangPhucVu ||
                      table.status == TableStatus.choThanhToan ||
                      table.status == TableStatus.daThanhToan) ...[
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.swap_horiz, color: Colors.blue),
                      title: const Text('Chuyển bàn'),
                      onTap: () {
                        Navigator.pop(ctx);
                        _showMoveTableDialog(context, table);
                      },
                    ),
                    ListTile(
                      dense: true,
                      leading: const Icon(
                        Icons.merge_type,
                        color: Colors.purple,
                      ),
                      title: const Text('Ghép bàn'),
                      onTap: () {
                        Navigator.pop(ctx);
                        _showMergeTableDialog(context, table);
                      },
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.cleaning_services,
                        color: table.status == TableStatus.daThanhToan
                            ? Colors.teal
                            : Colors.grey,
                      ),
                      title: Text(
                        'Dọn bàn',
                        style: TextStyle(
                          color: table.status == TableStatus.daThanhToan
                              ? null
                              : Colors.grey,
                        ),
                      ),
                      subtitle: Text(
                        table.status == TableStatus.daThanhToan
                            ? 'Chuyển bàn về trạng thái trống'
                            : 'Bàn đang có khách',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      onTap: table.status == TableStatus.daThanhToan
                          ? () {
                              Navigator.pop(ctx);
                              _showCleanTableDialog(context, table);
                            }
                          : null,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _enterOrderForPayment(
    BuildContext context,
    CafeTable table,
    CafeOrder order,
  ) async {
    ref.read(cafePosCartProvider.notifier).loadOrder(order);
    if (table.status != TableStatus.coKhach) {
      await ref
          .read(cafeTablesProvider.notifier)
          .updateTableStatus(
            table.id,
            TableStatus.coKhach,
            customerInfo:
                table.customerInfo ??
                TableCustomerInfo(
                  customerName: order.customerName.isNotEmpty
                      ? order.customerName
                      : 'Khách lẻ',
                  checkInTime: order.createdAt,
                  currentTotal: order.grandTotal,
                ),
          );
    }
    await openPosForOrder(context, ref);
  }

  void _showOrderTypePickerDialog(BuildContext context, CafeTable table) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        title: const Text('Chọn loại phục vụ'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _orderTypeOption(
              ctx,
              table,
              OrderType.taiBan,
              Icons.table_restaurant,
              'Tại bàn',
              'Phục vụ khách tại bàn',
            ),
            const SizedBox(height: 8),
            _orderTypeOption(
              ctx,
              table,
              OrderType.mangDi,
              Icons.takeout_dining,
              'Mang đi',
              'Khách mua mang về',
            ),
            const SizedBox(height: 8),
            _orderTypeOption(
              ctx,
              table,
              OrderType.giaoHang,
              Icons.delivery_dining,
              'Giao hàng',
              'Grab / ShopeeFood / Be',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
        ],
      ),
    );
  }

  Widget _orderTypeOption(
    BuildContext ctx,
    CafeTable table,
    OrderType type,
    IconData icon,
    String label,
    String desc,
  ) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () async {
          Navigator.pop(ctx);
          final cartNotifier = ref.read(cafePosCartProvider.notifier);
          await cartNotifier.startNewOrder(
            tableId: table.id,
            tableName: table.name,
            type: type,
          );
          final newOrder = ref.read(cafePosCartProvider);
          await ref
              .read(cafeTablesProvider.notifier)
              .setActiveOrder(table.id, newOrder.id);
          await ref
              .read(cafeTablesProvider.notifier)
              .updateTableStatus(
                table.id,
                TableStatus.coKhach,
                customerInfo:
                    table.customerInfo ??
                    TableCustomerInfo(
                      customerName: 'Khách lẻ',
                      checkInTime: DateTime.now(),
                    ),
              );
          ref.read(cafeOrdersProvider.notifier).loadOrders();
          await openPosForOrder(context, ref);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          side: BorderSide(color: _orderTypeColor(type)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: _orderTypeColor(type), size: 22),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: _orderTypeColor(type),
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey.shade600),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Color _orderTypeColor(OrderType type) {
    switch (type) {
      case OrderType.taiBan:
        return const Color(0xFFD97706);
      case OrderType.mangDi:
        return Colors.blue;
      case OrderType.giaoHang:
        return Colors.green;
    }
  }

  void _showCleanTableDialog(BuildContext context, CafeTable table) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        title: Text('Dọn bàn ${table.name}'),
        content: const Text(
          'Xác nhận bàn đã dọn xong? Bàn sẽ chuyển sang trạng thái trống để phục vụ khách tiếp theo.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              ref.read(cafeTablesProvider.notifier).clearTable(table.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${table.name} đã sẵn sàng phục vụ')),
              );
            },
            child: const Text(
              'Dọn xong',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showMoveTableDialog(BuildContext context, CafeTable sourceTable) {
    final tables = ref.read(cafeTablesProvider);
    final emptyTables = tables
        .where((t) => t.id != sourceTable.id && t.status == TableStatus.trong)
        .toList();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        title: Text('Chuyển từ ${sourceTable.name} sang:'),
        content: emptyTables.isEmpty
            ? const Text('Không có bàn trống nào để chuyển!')
            : SizedBox(
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: emptyTables.length,
                  itemBuilder: (c, i) {
                    final target = emptyTables[i];
                    return ListTile(
                      title: Text('${target.name} (${target.areaName})'),
                      onTap: () {
                        ref
                            .read(cafeTablesProvider.notifier)
                            .moveTable(sourceTable.id, target.id);
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Đã chuyển bàn ${sourceTable.name} -> ${target.name}',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget _buildOrderDetailPanel(CafeTable? table, CafeOrder? order) {
    final panelStatus =
        order != null && table != null && table.status == TableStatus.trong
        ? TableStatus.coKhach
        : table?.status ?? TableStatus.trong;
    if (table == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.touch_app, size: 48, color: Colors.grey.shade300),
            const SizedBox(height: 12),
            Text(
              'Chọn bàn để xem chi tiết',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
          ],
        ),
      );
    }

    if (order == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 48,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 12),
            Text(
              'Bàn ${table.name} chưa có món nào',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              panelStatus.label,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      );
    }

    final totalItems = order.items.fold<int>(
      0,
      (sum, item) => sum + item.quantity,
    );

    return Container(
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(panelStatus.colorValue),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Bàn ${table.name}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '#${order.orderCode}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '$totalItems món · ${currencyFormatter.format(order.grandTotal)}',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          // Column headers
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Text(
                    'Món',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'SL',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Đơn giá',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Thành tiền',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          // Items list
          Expanded(
            child: ListView.builder(
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                final item = order.items[index];
                final unitPriceWithSize =
                    item.unitPrice + item.selectedSize.extraPrice;
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade100),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.menuItemName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.selectedSize.name,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${item.quantity}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              currencyFormatter.format(unitPriceWithSize),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              currencyFormatter.format(item.totalPrice),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (item.selectedToppings.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 2,
                            children: item.selectedToppings
                                .map(
                                  (t) => Text(
                                    '+ ${t.name} ${currencyFormatter.format(t.price)}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                      if (item.note.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 4, top: 2),
                          child: Text(
                            'Ghi chú: ${item.note}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.orange.shade700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Footer - total
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              children: [
                _totalRow('Tạm tính', order.subtotal),
                if (order.totalDiscount > 0) ...[
                  const SizedBox(height: 4),
                  _totalRow(
                    'Giảm giá',
                    -order.totalDiscount,
                    valueColor: Colors.green,
                  ),
                ],
                const Divider(height: 16),
                _totalRow(
                  'Tổng cộng',
                  order.grandTotal,
                  bold: true,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalRow(
    String label,
    double amount, {
    bool bold = false,
    double fontSize = 13,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
        Text(
          currencyFormatter.format(amount),
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  void _showMergeTableDialog(BuildContext context, CafeTable table1) {
    final tables = ref.read(cafeTablesProvider);
    final otherTables = tables
        .where(
          (t) =>
              t.id != table1.id &&
              (t.status == TableStatus.coKhach ||
                  t.status == TableStatus.dangPhucVu),
        )
        .toList();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        title: Text('Ghép ${table1.name} với bàn:'),
        content: otherTables.isEmpty
            ? const Text('Không có bàn nào khác đang có khách!')
            : SizedBox(
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: otherTables.length,
                  itemBuilder: (c, i) {
                    final target = otherTables[i];
                    return ListTile(
                      title: Text('${target.name} (${target.areaName})'),
                      onTap: () {
                        ref
                            .read(cafeTablesProvider.notifier)
                            .mergeTables(table1.id, target.id);
                        Navigator.pop(ctx);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Đã ghép bàn ${table1.name} và ${target.name}',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}

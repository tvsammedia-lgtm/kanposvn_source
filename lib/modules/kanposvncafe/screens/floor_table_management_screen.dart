import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cafe_order.dart';
import '../models/cafe_table.dart';
import '../providers/cafe_providers.dart';
import '../cafe_navigation.dart';

class FloorTableManagementScreen extends ConsumerStatefulWidget {
  const FloorTableManagementScreen({super.key});

  @override
  ConsumerState<FloorTableManagementScreen> createState() =>
      _FloorTableManagementScreenState();
}

class _FloorTableManagementScreenState
    extends ConsumerState<FloorTableManagementScreen>
    with WidgetsBindingObserver {
  String? _selectedAreaId;
  bool _isReloading = false;

  @override
  Widget build(BuildContext context) {
    final areas = ref.watch(cafeAreasProvider);
    final tables = ref.watch(cafeTablesProvider);

    // Prevent rebuild loops by not triggering reload during build
    if (_selectedAreaId == null && areas.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _selectedAreaId = areas.first.id;
          });
        }
      });
    }

    CafeArea? selectedArea;
    if (_selectedAreaId != null) {
      for (final area in areas) {
        if (area.id == _selectedAreaId) {
          selectedArea = area;
          break;
        }
      }
    }
    if (selectedArea == null && areas.isNotEmpty) {
      selectedArea = areas.first;
    }

    final selectedAreaResolved = selectedArea;
    final areaTables = selectedAreaResolved == null
        ? <CafeTable>[]
        : tables.where((t) => t.areaId == selectedAreaResolved.id).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 900;
                  return isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: _buildAreaPanel(areas, tables),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 5,
                              child: _buildTablePanel(selectedArea, areaTables),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(child: _buildAreaPanel(areas, tables)),
                            const SizedBox(height: 16),
                            Flexible(
                              child: _buildTablePanel(selectedArea, areaTables),
                            ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAreaPanel(List<CafeArea> areas, List<CafeTable> tables) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tầng / Khu vực',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (areas.isEmpty)
              Flexible(
                fit: FlexFit.loose,
                child: Center(
                  child: Text('Chưa có tầng nào. Hãy thêm tầng mới.'),
                ),
              )
            else
              Flexible(
                fit: FlexFit.loose,
                child: ListView.separated(
                  itemCount: areas.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final area = areas[index];
                    final assignedTables = tables
                        .where((table) => table.areaId == area.id)
                        .length;
                    final isSelected = area.id == _selectedAreaId;
                    return InkWell(
                      onTap: () => setState(() {
                        _selectedAreaId = area.id;
                      }),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.orange.shade50
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Colors.deepOrange
                                : Colors.grey.shade300,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    area.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    area.description.isNotEmpty
                                        ? area.description
                                        : 'Không có mô tả.',
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Số bàn: $assignedTables'),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  tooltip: 'Sửa tầng',
                                  onPressed: () =>
                                      _showAreaDialog(context, area),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  tooltip: 'Xóa tầng',
                                  onPressed: () =>
                                      _confirmDeleteArea(context, area),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  tooltip: 'Thêm tầng',
                  onPressed: () => _showAreaDialog(context),
                  iconSize: 30,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  tooltip: 'Bớt tầng',
                  onPressed: areas.isEmpty ? null : () => _removeSelectedArea(),
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Quản lý tầng / bàn',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Làm mới',
          onPressed: _manualRefresh,
        ),
      ],
    );
  }

  Widget _buildTablePanel(CafeArea? selectedArea, List<CafeTable> areaTables) {
    if (selectedArea == null) {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: Text('Vui lòng chọn tầng để quản lý bàn.')),
        ),
      );
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bàn trong tầng: ${selectedArea.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Flexible(
              fit: FlexFit.loose,
              child: areaTables.isEmpty
                  ? const Center(child: Text('Chưa có bàn trong tầng này.'))
                  : ListView.separated(
                      itemCount: areaTables.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final table = areaTables[index];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      table.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text('Số ghế: ${table.seatCount}'),
                                    const SizedBox(height: 4),
                                    Text('Trạng thái: ${table.status.label}'),
                                    if (table.note.isNotEmpty) ...[
                                      const SizedBox(height: 4),
                                      Text('Ghi chú: ${table.note}'),
                                    ],
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.green,
                                ),
                                tooltip: 'Gọi món',
                                onPressed: () =>
                                    _gotoPosForTable(context, table),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                tooltip: 'Sửa bàn',
                                onPressed: () => _showTableDialog(
                                  context,
                                  selectedArea,
                                  table: table,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                tooltip: 'Xóa bàn',
                                onPressed: () =>
                                    _confirmDeleteTable(context, table),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  tooltip: 'Thêm bàn',
                  onPressed: () => _addTableForArea(selectedArea),
                  iconSize: 30,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  tooltip: 'Bớt bàn',
                  onPressed: areaTables.isEmpty
                      ? null
                      : () => _removeLastTableForArea(selectedArea),
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAreaDialog(BuildContext context, [CafeArea? area]) async {
    final nameController = TextEditingController(text: area?.name ?? '');
    final descriptionController = TextEditingController(
      text: area?.description ?? '',
    );
    final sortOrderController = TextEditingController(
      text: area?.sortOrder.toString() ?? '0',
    );

    final saved = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          title: Text(area == null ? 'Thêm tầng mới' : 'Sửa tầng'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên tầng'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: sortOrderController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Thứ tự hiển thị',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) return;
                Navigator.of(context).pop(true);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );

    if (saved != true) return;

    final newArea = CafeArea(
      id: area?.id ?? 'AREA-${DateTime.now().millisecondsSinceEpoch}',
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      sortOrder: int.tryParse(sortOrderController.text.trim()) ?? 0,
    );

    await ref.read(cafeAreasProvider.notifier).saveArea(newArea);
    setState(() {
      _selectedAreaId = newArea.id;
    });
  }

  Future<void> _showTableDialog(
    BuildContext context,
    CafeArea area, {
    CafeTable? table,
  }) async {
    final nameController = TextEditingController(text: table?.name ?? '');
    final seatCountController = TextEditingController(
      text: table?.seatCount.toString() ?? '4',
    );
    final noteController = TextEditingController(text: table?.note ?? '');
    final selectedAreaId = table?.areaId ?? area.id;

    final saved = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          title: Text(table == null ? 'Thêm bàn mới' : 'Sửa bàn'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên bàn'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: seatCountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Số ghế'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(labelText: 'Ghi chú'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty) return;
                Navigator.of(context).pop(true);
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );

    if (saved != true) return;

    final newTable = CafeTable(
      id: table?.id ?? 'TABLE-${DateTime.now().millisecondsSinceEpoch}',
      name: nameController.text.trim(),
      areaId: selectedAreaId,
      areaName: area.name,
      seatCount: int.tryParse(seatCountController.text.trim()) ?? 4,
      status: table?.status ?? TableStatus.trong,
      note: noteController.text.trim(),
      customerInfo: table?.customerInfo,
      activeOrderId: table?.activeOrderId,
    );

    await ref.read(cafeIsarServiceProvider).saveTable(newTable);
    ref.read(cafeTablesProvider.notifier).loadTables();

    setState(() {
      _selectedAreaId = newTable.areaId;
    });
  }

  Future<void> _addTableForArea(CafeArea area) async {
    final existingTables = ref
        .read(cafeTablesProvider)
        .where((table) => table.areaId == area.id)
        .toList();
    final newTable = CafeTable(
      id: 'TABLE-${DateTime.now().millisecondsSinceEpoch}',
      name: 'Bàn ${existingTables.length + 1}',
      areaId: area.id,
      areaName: area.name,
      seatCount: 4,
      status: TableStatus.trong,
    );
    await ref.read(cafeIsarServiceProvider).saveTable(newTable);
    ref.read(cafeTablesProvider.notifier).loadTables();
  }

  Future<void> _removeSelectedArea() async {
    if (_selectedAreaId == null) return;
    final selectedAreas = ref
        .read(cafeAreasProvider)
        .where((area) => area.id == _selectedAreaId)
        .toList();
    if (selectedAreas.isEmpty) return;
    await _confirmDeleteArea(context, selectedAreas.first);
  }

  Future<void> _removeLastTableForArea(CafeArea area) async {
    final areaTables = ref
        .read(cafeTablesProvider)
        .where((table) => table.areaId == area.id)
        .toList();
    if (areaTables.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không có bàn để xóa trong tầng này.')),
      );
      return;
    }

    final tableToDelete = areaTables.last;
    await _confirmDeleteTable(context, tableToDelete);
  }

  Future<void> _confirmDeleteArea(BuildContext context, CafeArea area) async {
    final hasTables = ref
        .read(cafeTablesProvider)
        .any((table) => table.areaId == area.id);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa tầng'),
          content: Text(
            hasTables
                ? 'Tầng này có bàn. Xóa tầng cũng sẽ xóa các bàn thuộc tầng. Bạn có chắc chắn muốn tiếp tục?'
                : 'Bạn có chắc chắn muốn xóa tầng này?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    await ref.read(cafeAreasProvider.notifier).deleteArea(area.id);
    ref.read(cafeTablesProvider.notifier).loadTables();
    if (_selectedAreaId == area.id) {
      setState(() {
        _selectedAreaId = null;
      });
    }
  }

  Future<void> _confirmDeleteTable(
    BuildContext context,
    CafeTable table,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa bàn'),
          content: const Text('Bạn có chắc chắn muốn xóa bàn này không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    await ref.read(cafeIsarServiceProvider).deleteTable(table.id);
    ref.read(cafeTablesProvider.notifier).loadTables();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Initial data load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reloadData();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isReloading) {
      _reloadData();
    }
  }

  Future<void> _manualRefresh() async {
    await _reloadData();
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đã làm mới dữ liệu')));
    }
  }

  Future<void> _reloadData() async {
    if (_isReloading) return;
    _isReloading = true;
    try {
      await Future.delayed(
        const Duration(milliseconds: 100),
      ); // Small delay to prevent rapid calls
      ref.read(cafeAreasProvider.notifier).loadAreas();
      ref.read(cafeTablesProvider.notifier).loadTables();
      ref.read(cafeOrdersProvider.notifier).loadOrders();
    } catch (e) {
      // ignore reload errors
    } finally {
      _isReloading = false;
    }
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

  Future<void> _gotoPosForTable(BuildContext context, CafeTable table) async {
    final orders = ref.read(cafeOrdersProvider);
    final posCart = ref.read(cafePosCartProvider);
    final found = _findActiveOrder(table, orders);
    final cartMatch = posCart.tableId == table.id;
    final activeOrder = (found != null && found.items.isNotEmpty)
        ? found
        : (cartMatch && posCart.items.isNotEmpty ? posCart : found);

    if (activeOrder != null) {
      ref.read(cafePosCartProvider.notifier).loadOrder(activeOrder);
      if (table.status != TableStatus.coKhach) {
        await ref
            .read(cafeTablesProvider.notifier)
            .updateTableStatus(
              table.id,
              TableStatus.coKhach,
              customerInfo:
                  table.customerInfo ??
                  TableCustomerInfo(
                    customerName: activeOrder.customerName.isNotEmpty
                        ? activeOrder.customerName
                        : 'Khách lẻ',
                    checkInTime: activeOrder.createdAt,
                    currentTotal: activeOrder.grandTotal,
                  ),
            );
      }
      await openPosForOrder(context, ref);
      return;
    }

    _showOrderTypePickerDialog(context, table);
  }

  void _showOrderTypePickerDialog(BuildContext context, CafeTable table) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        title: const Text('Chọn loại phục vụ'),
        content: SingleChildScrollView(
          child: Column(
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
                    fontWeight: FontWeight.bold,
                    color: _orderTypeColor(type),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _orderTypeColor(OrderType type) {
    switch (type) {
      case OrderType.taiBan:
        return Colors.orange;
      case OrderType.mangDi:
        return Colors.green;
      case OrderType.giaoHang:
        return Colors.blue;
    }
  }
}

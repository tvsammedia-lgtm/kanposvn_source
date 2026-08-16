import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/warehouse_api.dart';
import '../auth/auth_service.dart';
import '../theme/app_colors.dart';

/// Controller quản lý Kho đa chi nhánh (Customer → Branch → Warehouse → Stock).
final warehouseControllerProvider =
    ChangeNotifierProvider<WarehouseController>(
  (ref) => WarehouseController(),
);

class WarehouseController extends ChangeNotifier {
  bool loading = true;
  String? error;
  String appCode = '';
  String? branchId;
  String? customerId;

  List<WhWarehouse> warehouses = [];
  String? selectedWarehouseId;
  List<WhStockRow> stock = [];
  List<WhProduct> noStockProducts = [];
  List<WhProduct> products = [];
  List<WhTransfer> transfers = [];

  WhWarehouse? get selectedWarehouse {
    for (final w in warehouses) {
      if (w.id == selectedWarehouseId) return w;
    }
    return warehouses.isNotEmpty ? warehouses.first : null;
  }

  Future<void> init(String appCode, {String? branchId}) async {
    this.appCode = appCode;
    this.branchId = branchId;
    loading = true;
    error = null;
    notifyListeners();
    try {
      final (whs, custId) =
          await WarehouseApi.fetchWarehouses(appCode, branchId: branchId);
      warehouses = whs;
      customerId = custId;
      // Giữ kho đã chọn trước đó nếu vẫn thuộc danh sách, ngược lại kho mặc định.
      final auth = AuthService.instance;
      final saved = auth?.warehouseId;
      final stillExists = warehouses.any((w) => w.id == saved);
      if (stillExists && saved != null) {
        selectedWarehouseId = saved;
      } else if (warehouses.isNotEmpty) {
        WhWarehouse def = warehouses.firstWhere(
          (w) => w.isDefault,
          orElse: () => warehouses.first,
        );
        selectedWarehouseId = def.id;
      } else {
        selectedWarehouseId = null;
      }
      await _loadAll();
    } catch (e) {
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> _loadAll() async {
    await reloadProducts();
    await reloadWarehouses();
    await reloadTransfers();
    await reloadStock();
  }

  Future<void> reloadWarehouses() async {
    final (whs, custId) =
        await WarehouseApi.fetchWarehouses(appCode, branchId: branchId);
    warehouses = whs;
    if (custId != null && custId.isNotEmpty) customerId = custId;
    if (warehouses.isNotEmpty &&
        !warehouses.any((w) => w.id == selectedWarehouseId)) {
      selectedWarehouseId = warehouses.first.id;
    }
    notifyListeners();
  }

  Future<void> reloadStock() async {
    final wh = selectedWarehouse;
    if (wh == null) {
      stock = [];
      noStockProducts = [];
      notifyListeners();
      return;
    }
    final (rows, noStock) =
        await WarehouseApi.fetchStock(appCode, warehouseId: wh.id);
    stock = rows;
    noStockProducts = noStock;
    notifyListeners();
  }

  Future<void> reloadProducts() async {
    products = await WarehouseApi.fetchProducts(appCode);
    notifyListeners();
  }

  Future<void> reloadTransfers() async {
    transfers = await WarehouseApi.fetchTransfers(appCode);
    notifyListeners();
  }

  Future<void> selectWarehouse(WhWarehouse w) async {
    selectedWarehouseId = w.id;
    notifyListeners();
    final auth = AuthService.instance;
    if (auth != null) {
      await auth.selectWarehouse(w.toJson());
    }
    await reloadStock();
  }

  Future<void> createWarehouse({
    required String name,
    String? code,
    bool isDefault = false,
  }) async {
    await WarehouseApi.createWarehouse(
      appCode: appCode,
      branchId: branchId,
      warehouseName: name,
      warehouseCode: code,
      isDefault: isDefault,
    );
    await reloadWarehouses();
    await reloadStock();
  }

  Future<void> createProduct({
    required String name,
    String? code,
    String? unit,
    double? price,
  }) async {
    await WarehouseApi.createProduct(
      appCode: appCode,
      name: name,
      productCode: code,
      unit: unit,
      price: price,
    );
    await reloadProducts();
    await reloadStock();
  }

  Future<void> postTx({
    required String txType,
    required String productId,
    required double qty,
    String? note,
  }) async {
    final wh = selectedWarehouse;
    if (wh == null) return;
    await WarehouseApi.postTransaction(
      appCode: appCode,
      warehouseId: wh.id,
      productId: productId,
      txType: txType,
      quantity: qty,
      note: note,
    );
    await reloadStock();
  }

  Future<void> createTransfer({
    required String fromWarehouseId,
    required String toWarehouseId,
    String? note,
    required List<({String productId, double qty})> items,
  }) async {
    await WarehouseApi.createTransfer(
      appCode: appCode,
      fromWarehouseId: fromWarehouseId,
      toWarehouseId: toWarehouseId,
      note: note,
      items: items,
    );
    await reloadTransfers();
  }

  Future<void> transferAction(WhTransfer t, String action) async {
    await WarehouseApi.transferAction(t.id, action);
    await reloadTransfers();
    // Xuất/nhận hàng thay đổi tồn kho.
    if (action == 'ship' || action == 'receive') {
      await reloadStock();
    }
  }
}

/// Màn hình quản lý Kho đa chi nhánh dùng chung mọi module.
class WarehouseScreen extends ConsumerStatefulWidget {
  const WarehouseScreen({super.key});

  @override
  ConsumerState<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends ConsumerState<WarehouseScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  String get _appCode =>
      AuthService.instance?.currentAppCode ??
      AuthService.instance?.storeAppCode ??
      'kanposvn';

  String? get _branchId => AuthService.instance?.branchId;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctrl = ref.read(warehouseControllerProvider);
      ctrl.init(_appCode, branchId: _branchId);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = ref.watch(warehouseControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.sidebarBg,
        foregroundColor: AppColors.textLight,
        title: const Text('Kho đa chi nhánh',
            style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryLight,
          labelColor: AppColors.textLight,
          unselectedLabelColor: AppColors.textMuted,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Kho'),
            Tab(text: 'Tồn kho'),
            Tab(text: 'Chuyển kho'),
            Tab(text: 'Sản phẩm'),
          ],
        ),
      ),
      body: ctrl.loading
          ? const Center(child: CircularProgressIndicator())
          : ctrl.error != null
              ? _ErrorState(message: ctrl.error!, onRetry: () {
                  final c = ref.read(warehouseControllerProvider);
                  c.init(_appCode, branchId: _branchId);
                })
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _WarehousesTab(ctrl: ctrl),
                    _StockTab(ctrl: ctrl),
                    _TransfersTab(ctrl: ctrl),
                    _ProductsTab(ctrl: ctrl),
                  ],
                ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 44, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('Thử lại')),
          ],
        ),
      ),
    );
  }
}

/// TAB 1 — Danh sách kho, chọn kho đang dùng, thêm kho.
class _WarehousesTab extends ConsumerWidget {
  final WarehouseController ctrl;
  const _WarehousesTab({required this.ctrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ctrl.warehouses.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warehouse_outlined,
                size: 48, color: AppColors.textMuted),
            const SizedBox(height: 12),
            const Text('Chưa có kho nào.',
                style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Thêm kho'),
              onPressed: () => _showCreateWarehouseDialog(context, ref, ctrl),
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () => ctrl.reloadWarehouses(),
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: ctrl.warehouses.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Thêm kho'),
                  onPressed: () => _showCreateWarehouseDialog(context, ref, ctrl),
                ),
              ),
            );
          }
          final w = ctrl.warehouses[index - 1];
          final selected = w.id == ctrl.selectedWarehouseId;
          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: selected ? AppColors.primary : AppColors.border,
                width: selected ? 2 : 1,
              ),
            ),
            child: ListTile(
              onTap: () => ctrl.selectWarehouse(w),
              leading: Icon(
                w.isCentral
                    ? Icons.account_balance
                    : Icons.warehouse_outlined,
                color: w.isCentral ? AppColors.accent : AppColors.primary,
              ),
              title: Row(
                children: [
                  Flexible(
                    child: Text(w.warehouseName,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.info.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(w.warehouseCode,
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.info)),
                  ),
                  if (w.isDefault) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('MẶC ĐỊNH',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColors.success,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (w.branchName != null && w.branchName!.isNotEmpty)
                    Text('${w.isCentral ? 'Kho trung tâm' : 'Chi nhánh'}: ${w.branchName}'),
                  Text(
                      '${w.productCount} sản phẩm · tổng tồn ${w.totalQuantity.toStringAsFixed(0)}'),
                ],
              ),
              trailing: selected
                  ? const Icon(Icons.check_circle, color: AppColors.success)
                  : const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ),
          );
        },
      ),
    );
  }
}

Future<void> _showCreateWarehouseDialog(
    BuildContext context, WidgetRef ref, WarehouseController ctrl) async {
  final nameCtrl = TextEditingController();
  final codeCtrl = TextEditingController();
  bool isDefault = false;
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: const Text('Thêm kho'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Tên kho *',
                hintText: 'VD: Kho chính quận 1',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: codeCtrl,
              decoration: const InputDecoration(
                labelText: 'Mã kho (tự động nếu để trống)',
                hintText: 'VD: KQ1',
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Đặt làm kho mặc định'),
              value: isDefault,
              onChanged: (v) => setState(() => isDefault = v),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Lưu'),
          ),
        ],
      ),
    ),
  );
  if (result != true) return;
  final name = nameCtrl.text.trim();
  if (name.isEmpty) return;
  final messenger = ScaffoldMessenger.of(context);
  try {
    await ctrl.createWarehouse(
      name: name,
      code: codeCtrl.text.trim().isEmpty ? null : codeCtrl.text.trim(),
      isDefault: isDefault,
    );
    messenger.showSnackBar(
        const SnackBar(content: Text('Đã thêm kho'), backgroundColor: AppColors.success));
  } on WarehouseApiException catch (e) {
    messenger.showSnackBar(SnackBar(
        content: Text(e.message), backgroundColor: Colors.red));
  } catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
  }
}

/// TAB 2 — Tồn kho của kho đang chọn + Nhập/Xuất/Điều chỉnh.
class _StockTab extends ConsumerWidget {
  final WarehouseController ctrl;
  const _StockTab({required this.ctrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wh = ctrl.selectedWarehouse;
    if (wh == null) {
      return const Center(
        child: Text('Chưa có kho.', style: TextStyle(color: AppColors.textMuted)),
      );
    }
    final allProducts = [
      ...ctrl.stock
          .map((s) => WhProduct(
                id: s.productId,
                productCode: s.productCode,
                name: s.productName,
                unit: s.unit,
                price: s.price,
                active: true,
              )),
      ...ctrl.noStockProducts,
    ];
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.surfaceAlt,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.warehouse, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text('${wh.warehouseName} (${wh.warehouseCode})',
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ),
              PopupMenuButton<String>(
                tooltip: 'Đổi kho',
                onSelected: (id) {
                  final w = ctrl.warehouses.firstWhere((e) => e.id == id);
                  ctrl.selectWarehouse(w);
                },
                itemBuilder: (_) => [
                  for (final w in ctrl.warehouses)
                    PopupMenuItem(
                        value: w.id,
                        child: Text(w.warehouseName, overflow: TextOverflow.ellipsis)),
                ],
                icon: const Icon(Icons.swap_horiz),
              ),
              IconButton(
                tooltip: 'Tải lại',
                icon: const Icon(Icons.refresh),
                onPressed: ctrl.reloadStock,
              ),
            ],
          ),
        ),
        Expanded(
          child: ctrl.stock.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Kho chưa có tồn.',
                          style: TextStyle(color: AppColors.textMuted)),
                      const SizedBox(height: 12),
                      if (allProducts.isNotEmpty)
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          label: const Text('Nhập kho'),
                          onPressed: () => _showTxDialog(context, ref, ctrl,
                              null, allProducts),
                        ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: ctrl.reloadStock,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: ctrl.stock.length,
                    itemBuilder: (context, index) {
                      final s = ctrl.stock[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                AppColors.primary.withValues(alpha: 0.12),
                            child: Text(
                              s.quantity.toStringAsFixed(0),
                              style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(s.productName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                              '${s.productCode.isNotEmpty ? '${s.productCode} · ' : ''}${s.unit.isNotEmpty ? '${s.unit} · ' : ''}${s.price > 0 ? '${s.price.toStringAsFixed(0)}đ' : ''}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                tooltip: 'Nhập kho',
                                icon: const Icon(Icons.arrow_downward,
                                    color: AppColors.success, size: 20),
                                onPressed: () => _showTxDialog(
                                    context, ref, ctrl, s, allProducts),
                              ),
                              IconButton(
                                tooltip: 'Xuất kho',
                                icon: const Icon(Icons.arrow_upward,
                                    color: Colors.red, size: 20),
                                onPressed: () => _showTxDialog(
                                    context, ref, ctrl, s, allProducts),
                              ),
                              PopupMenuButton<String>(
                                tooltip: 'Điều chỉnh',
                                onSelected: (type) => _showAdjustDialog(
                                    context, ref, ctrl, s, type),
                                itemBuilder: (_) => const [
                                  PopupMenuItem(
                                      value: 'ADJUSTMENT_UP',
                                      child: Text('Tăng tồn')),
                                  PopupMenuItem(
                                      value: 'ADJUSTMENT_DOWN',
                                      child: Text('Giảm tồn')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

/// Hộp thoại Nhập/Xuất kho cho 1 sản phẩm (hoặc thêm sản phẩm mới vào kho).
Future<void> _showTxDialog(
  BuildContext context,
  WidgetRef ref,
  WarehouseController ctrl,
  WhStockRow? row,
  List<WhProduct> allProducts,
) async {
  String type = row == null ? 'IMPORT' : 'EXPORT';
  String? productId = row?.productId;
  final qtyCtrl = TextEditingController(text: '1');
  final noteCtrl = TextEditingController();
  final messenger = ScaffoldMessenger.of(context);

  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(row == null ? 'Thêm sản phẩm vào kho' : 'Giao dịch kho'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (row == null)
                DropdownButtonFormField<String>(
                  initialValue: productId,
                  isExpanded: true,
                  decoration: const InputDecoration(labelText: 'Sản phẩm *'),
                  items: [
                    for (final p in allProducts)
                      DropdownMenuItem(
                          value: p.id,
                          child: Text(p.name, overflow: TextOverflow.ellipsis)),
                  ],
                  onChanged: (v) => setState(() => productId = v),
                ),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                      value: 'IMPORT',
                      icon: Icon(Icons.arrow_downward),
                      label: Text('Nhập')),
                  ButtonSegment(
                      value: 'EXPORT',
                      icon: Icon(Icons.arrow_upward),
                      label: Text('Xuất')),
                ],
                selected: {type},
                onSelectionChanged: (s) => setState(() => type = s.first),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: qtyCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Số lượng *'),
              ),
              TextField(
                controller: noteCtrl,
                decoration: const InputDecoration(labelText: 'Ghi chú'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Hủy')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Lưu'),
          ),
        ],
      ),
    ),
  );
  if (ok != true) return;
  final qty = double.tryParse(qtyCtrl.text.trim());
  if (productId == null || qty == null || qty <= 0) {
    messenger.showSnackBar(const SnackBar(
        content: Text('Chọn sản phẩm và nhập số lượng > 0'),
        backgroundColor: Colors.red));
    return;
  }
  try {
    await ctrl.postTx(
      txType: type,
      productId: productId!,
      qty: qty,
      note: noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
    );
    messenger.showSnackBar(const SnackBar(
        content: Text('Đã lưu giao dịch'),
        backgroundColor: AppColors.success));
  } on WarehouseApiException catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red));
  } catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
  }
}

/// Hộp thoại điều chỉnh tồn kho (tăng/giảm).
Future<void> _showAdjustDialog(
  BuildContext context,
  WidgetRef ref,
  WarehouseController ctrl,
  WhStockRow row,
  String type,
) async {
  final qtyCtrl = TextEditingController(text: '1');
  final messenger = ScaffoldMessenger.of(context);
  final label = type == 'ADJUSTMENT_UP' ? 'Tăng tồn' : 'Giảm tồn';
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('$label · ${row.productName}'),
      content: TextField(
        controller: qtyCtrl,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(labelText: 'Số lượng *'),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy')),
        ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Lưu')),
      ],
    ),
  );
  if (ok != true) return;
  final qty = double.tryParse(qtyCtrl.text.trim());
  if (qty == null || qty <= 0) return;
  try {
    await ctrl.postTx(txType: type, productId: row.productId, qty: qty);
    messenger.showSnackBar(const SnackBar(
        content: Text('Đã điều chỉnh tồn kho'),
        backgroundColor: AppColors.success));
  } on WarehouseApiException catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red));
  } catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
  }
}

const Map<String, String> _transferStatusLabels = {
  'DRAFT': 'Nháp',
  'CONFIRMED': 'Đã duyệt',
  'SHIPPING': 'Đang chuyển',
  'RECEIVED': 'Đã nhận',
  'CANCELLED': 'Đã hủy',
};

/// TAB 3 — Phiếu chuyển kho + tạo mới + xử lý.
class _TransfersTab extends ConsumerWidget {
  final WarehouseController ctrl;
  const _TransfersTab({required this.ctrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Row(
            children: [
              const Expanded(
                child: Text('Phiếu chuyển kho',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Tạo phiếu chuyển'),
                onPressed: ctrl.warehouses.length < 2
                    ? null
                    : () => _showCreateTransferDialog(context, ref, ctrl),
              ),
            ],
          ),
        ),
        if (ctrl.warehouses.length < 2)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Cần ít nhất 2 kho để chuyển.',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ),
          ),
        Expanded(
          child: ctrl.transfers.isEmpty
              ? const Center(
                  child: Text('Chưa có phiếu chuyển kho nào.',
                      style: TextStyle(color: AppColors.textMuted)))
              : RefreshIndicator(
                  onRefresh: ctrl.reloadTransfers,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: ctrl.transfers.length,
                    itemBuilder: (context, index) {
                      final t = ctrl.transfers[index];
                      return _TransferCard(
                        transfer: t,
                        onTap: () => _showTransferDetail(context, ref, ctrl, t),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

class _TransferCard extends StatelessWidget {
  final WhTransfer transfer;
  final VoidCallback onTap;
  const _TransferCard({required this.transfer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (transfer.status) {
      'DRAFT' => AppColors.warning,
      'CONFIRMED' => AppColors.info,
      'SHIPPING' => AppColors.accent,
      'RECEIVED' => AppColors.success,
      _ => AppColors.textMuted,
    };
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: statusColor.withValues(alpha: 0.12),
          child: Text(transfer.transferCode.replaceAll('XCK', ''),
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(transfer.transferCode,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _transferStatusLabels[transfer.status] ?? transfer.status,
                style: TextStyle(
                    color: statusColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('${transfer.fromWarehouseName} → ${transfer.toWarehouseName}'),
            Text('${transfer.itemCount} mặt hàng'
                '${transfer.note.isNotEmpty ? ' · ${transfer.note}' : ''}'),
          ],
        ),
      ),
    );
  }
}

Future<void> _showTransferDetail(BuildContext context, WidgetRef ref,
    WarehouseController ctrl, WhTransfer t) async {
  final messenger = ScaffoldMessenger.of(context);
  WhTransfer current = t;
  if (current.items.isEmpty) {
    try {
      current = await WarehouseApi.fetchTransfer(t.id);
    } catch (_) {}
  }
  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) {
        final canConfirm = current.status == 'DRAFT';
        final canShip = current.status == 'CONFIRMED';
        final canReceive = current.status == 'SHIPPING';
        final canCancel = current.status == 'DRAFT' || current.status == 'CONFIRMED';
        return AlertDialog(
          title: Text('${current.transferCode} · ${current.fromWarehouseName} → ${current.toWarehouseName}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Trạng thái: '),
                    Text(
                      _transferStatusLabels[current.status] ?? current.status,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: switch (current.status) {
                            'RECEIVED' => AppColors.success,
                            'CANCELLED' => AppColors.textMuted,
                            'SHIPPING' => AppColors.accent,
                            'CONFIRMED' => AppColors.info,
                            _ => AppColors.warning,
                          }),
                    ),
                  ],
                ),
                const Divider(),
                for (final item in current.items)
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.productName),
                    subtitle: Text(
                        '${item.productCode.isNotEmpty ? '${item.productCode} · ' : ''}${item.unit}'),
                    trailing: Text(
                        item.quantity.toStringAsFixed(0),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                if (current.note.isNotEmpty) ...[
                  const Divider(),
                  Text('Ghi chú: ${current.note}'),
                ],
              ],
            ),
          ),
          actions: [
            if (canConfirm)
              TextButton(
                onPressed: () async {
                  Navigator.pop(ctx);
                  try {
                    await ctrl.transferAction(current, 'confirm');
                    messenger.showSnackBar(const SnackBar(
                        content: Text('Đã duyệt phiếu'),
                        backgroundColor: AppColors.success));
                  } on WarehouseApiException catch (e) {
                    messenger.showSnackBar(SnackBar(
                        content: Text(e.message), backgroundColor: Colors.red));
                  }
                },
                child: const Text('Duyệt'),
              ),
            if (canShip)
              TextButton(
                onPressed: () async {
                  Navigator.pop(ctx);
                  try {
                    await ctrl.transferAction(current, 'ship');
                    messenger.showSnackBar(const SnackBar(
                        content: Text('Đã xuất kho — hàng đang vận chuyển'),
                        backgroundColor: AppColors.success));
                  } on WarehouseApiException catch (e) {
                    messenger.showSnackBar(SnackBar(
                        content: Text(e.message), backgroundColor: Colors.red));
                  }
                },
                child: const Text('Xuất kho'),
              ),
            if (canReceive)
              TextButton(
                onPressed: () async {
                  Navigator.pop(ctx);
                  try {
                    await ctrl.transferAction(current, 'receive');
                    messenger.showSnackBar(const SnackBar(
                        content: Text('Đã nhận hàng'),
                        backgroundColor: AppColors.success));
                  } on WarehouseApiException catch (e) {
                    messenger.showSnackBar(SnackBar(
                        content: Text(e.message), backgroundColor: Colors.red));
                  }
                },
                child: const Text('Nhận hàng'),
              ),
            if (canCancel)
              TextButton(
                onPressed: () async {
                  Navigator.pop(ctx);
                  try {
                    await ctrl.transferAction(current, 'cancel');
                    messenger.showSnackBar(const SnackBar(
                        content: Text('Đã hủy phiếu'),
                        backgroundColor: AppColors.success));
                  } on WarehouseApiException catch (e) {
                    messenger.showSnackBar(SnackBar(
                        content: Text(e.message), backgroundColor: Colors.red));
                  }
                },
                child: const Text('Hủy phiếu'),
              ),
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Đóng')),
          ],
        );
      },
    ),
  );
}

Future<void> _showCreateTransferDialog(
    BuildContext context, WidgetRef ref, WarehouseController ctrl) async {
  final messenger = ScaffoldMessenger.of(context);
  String? fromId = ctrl.selectedWarehouseId;
  String? toId;
  final noteCtrl = TextEditingController();
  final items = <({String productId, String productName, TextEditingController qty})>[];

  final allProducts = <WhProduct>[];
  for (final p in ctrl.products) {
    allProducts.add(p);
  }
  final productById = <String, WhProduct>{for (final p in allProducts) p.id: p};

  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) {
        void addItem() {
          if (allProducts.isEmpty) return;
          final first = allProducts.first;
          setState(() {
            items.add((
              productId: first.id,
              productName: first.name,
              qty: TextEditingController(text: '1'),
            ));
          });
        }

        void removeItem(int index) {
          setState(() {
            items.removeAt(index).qty.dispose();
          });
        }

        return AlertDialog(
          title: const Text('Tạo phiếu chuyển kho'),
          content: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    initialValue: fromId,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Kho chuyển đi *'),
                    items: [
                      for (final w in ctrl.warehouses)
                        DropdownMenuItem(value: w.id, child: Text(w.warehouseName)),
                    ],
                    onChanged: (v) => setState(() => fromId = v),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    initialValue: toId,
                    isExpanded: true,
                    decoration: const InputDecoration(labelText: 'Kho nhận *'),
                    items: [
                      for (final w in ctrl.warehouses)
                        if (w.id != fromId)
                          DropdownMenuItem(value: w.id, child: Text(w.warehouseName)),
                    ],
                    onChanged: (v) => setState(() => toId = v),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: noteCtrl,
                    decoration: const InputDecoration(labelText: 'Ghi chú'),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Mặt hàng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textSecondary)),
                  ),
                  for (var i = 0; i < items.length; i++) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: items[i].productId,
                            isExpanded: true,
                            items: [
                              for (final p in allProducts)
                                DropdownMenuItem(
                                    value: p.id,
                                    child: Text(p.name,
                                        overflow: TextOverflow.ellipsis)),
                            ],
                            onChanged: (v) => setState(() {
                              items[i] = (
                                productId: v ?? items[i].productId,
                                productName: productById[v]?.name ??
                                    items[i].productName,
                                qty: items[i].qty,
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: 72,
                          child: TextField(
                            controller: items[i].qty,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            decoration: const InputDecoration(
                                labelText: 'SL', isDense: true),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.red),
                          onPressed: () => removeItem(i),
                        ),
                      ],
                    ),
                  ],
                  if (allProducts.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Thêm mặt hàng'),
                        onPressed: addItem,
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  for (final it in items) {
                    it.qty.dispose();
                  }
                  Navigator.pop(ctx, false);
                },
                child: const Text('Hủy')),
            ElevatedButton(
              onPressed: () {
                for (final it in items) {
                  it.qty.dispose();
                }
                Navigator.pop(ctx, true);
              },
              child: const Text('Lưu phiếu'),
            ),
          ],
        );
      },
    ),
  );
  if (ok != true) return;
  if (fromId == null || toId == null || fromId == toId) return;
  final payload = <({String productId, double qty})>[];
  for (final it in items) {
    final qty = double.tryParse(it.qty.text.trim());
    if (qty != null && qty > 0) {
      payload.add((productId: it.productId, qty: qty));
    }
  }
  if (payload.isEmpty) return;
  try {
    await ctrl.createTransfer(
      fromWarehouseId: fromId!,
      toWarehouseId: toId!,
      note: noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
      items: payload,
    );
    messenger.showSnackBar(const SnackBar(
        content: Text('Đã tạo phiếu chuyển (Nháp) — duyệt để kiểm tra tồn kho'),
        backgroundColor: AppColors.success));
  } on WarehouseApiException catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red));
  } catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
  }
}

/// TAB 4 — Danh mục sản phẩm của Customer.
class _ProductsTab extends ConsumerWidget {
  final WarehouseController ctrl;
  const _ProductsTab({required this.ctrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Row(
            children: [
              const Expanded(
                child: Text('Sản phẩm (dùng chung mọi kho)',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Thêm sản phẩm'),
                onPressed: () => _showCreateProductDialog(context, ref, ctrl),
              ),
            ],
          ),
        ),
        Expanded(
          child: ctrl.products.isEmpty
              ? const Center(
                  child: Text('Chưa có sản phẩm.',
                      style: TextStyle(color: AppColors.textMuted)))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    final p = ctrl.products[index];
                    return ListTile(
                      leading: const CircleAvatar(
                          child: Icon(Icons.inventory_2_outlined, size: 20)),
                      title: Text(p.name,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(
                          '${p.productCode.isNotEmpty ? '${p.productCode} · ' : ''}${p.unit.isNotEmpty ? p.unit : ''}'),
                      trailing: p.price > 0
                          ? Text('${p.price.toStringAsFixed(0)}đ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary))
                          : null,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

Future<void> _showCreateProductDialog(
    BuildContext context, WidgetRef ref, WarehouseController ctrl) async {
  final nameCtrl = TextEditingController();
  final codeCtrl = TextEditingController();
  final unitCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final messenger = ScaffoldMessenger.of(context);

  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Thêm sản phẩm'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: 'Tên sản phẩm *'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: codeCtrl,
            decoration: const InputDecoration(
                labelText: 'Mã sản phẩm (VD: NS001)'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: unitCtrl,
            decoration: const InputDecoration(labelText: 'Đơn vị (VD: chai, kg)'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: priceCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Giá bán'),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Hủy')),
        ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Lưu')),
      ],
    ),
  );
  if (ok != true) return;
  final name = nameCtrl.text.trim();
  if (name.isEmpty) return;
  try {
    await ctrl.createProduct(
      name: name,
      code: codeCtrl.text.trim().isEmpty ? null : codeCtrl.text.trim(),
      unit: unitCtrl.text.trim().isEmpty ? null : unitCtrl.text.trim(),
      price: double.tryParse(priceCtrl.text.trim()),
    );
    messenger.showSnackBar(const SnackBar(
        content: Text('Đã thêm sản phẩm'), backgroundColor: AppColors.success));
  } on WarehouseApiException catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text(e.message), backgroundColor: Colors.red));
  } catch (e) {
    messenger.showSnackBar(
        SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red));
  }
}

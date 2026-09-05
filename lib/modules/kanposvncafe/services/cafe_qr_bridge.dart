import '../../../core/sync/qr_catalog.dart';
import '../../../core/sync/qr_order_bridge.dart';
import '../models/cafe_menu.dart';
import '../models/cafe_order.dart';
import '../models/cafe_table.dart';
import 'cafe_isar_service.dart';

/// Cầu QR Order Online cho module Cafe.
///
/// - Publish: bàn + danh mục + món (JSON DatabaseService) lên web.
/// - Nhận đơn: tạo CafeOrder 'QR-' + cloud id gắn bàn theo mapping cloud uuid,
///   đổi bàn sang Có khách.
/// - Hủy đơn: đánh dấu Đã hủy + trả bàn về Trống.
class CafeQrBridge extends QrOrderBridge {
  final CafeIsarService _isarService;
  final Future<void> Function()? onLocalRefresh;

  CafeQrBridge(this._isarService, {this.onLocalRefresh});

  @override
  String get appCode => 'kanposvncafe';

  @override
  String get label => 'Cafe';

  @override
  String get defaultBranchName => 'Cafe của tôi';

  @override
  String? get defaultBranchCode => 'cafe';

  @override
  Future<QrCatalogInput> buildCatalogInput() async {
    final tables = _isarService.getTables();
    final categories = _isarService.getCategories();
    final menu = _isarService.getMenuItems();
    return QrCatalogInput(
      branchName: defaultBranchName,
      branchCode: 'cafe',
      tables: tables
          .map((t) => QrTableDraft(
                code: t.id,
                name: t.name,
                zone: t.areaName,
                capacity: t.seatCount,
              ))
          .toList(),
      categories: [
        for (final c in categories)
          QrCategoryDraft(name: c.name, sortOrder: c.sortOrder),
      ],
      items: menu
          .where((m) => m.name.isNotEmpty)
          .map((m) => QrItemDraft(
                code: m.code,
                name: m.name,
                category: m.categoryName,
                price: m.basePrice,
                description: m.description,
                imageUrl: m.imageUrl,
                active: m.isAvailable,
              ))
          .toList(),
    );
  }

  @override
  Future<void> persistRemoteOrder(QrRemoteOrder order) async {
    final localId = 'QR-${order.id}';
    if (_isarService.getOrderById(localId) != null) return;

    CafeTable? table;
    final localCode = remoteTableCode(order.cloudTableId);
    if (localCode != null) {
      for (final t in _isarService.getTables()) {
        if (t.id == localCode) {
          table = t;
          break;
        }
      }
    }

    final items = order.items
        .map((it) => CafeOrderItem(
              id: 'QR${it.id}',
              menuItemId: it.menuItemId,
              menuItemName: it.name,
              selectedSize: MenuItemSize(name: 'M', extraPrice: 0),
              quantity: it.quantity,
              unitPrice: it.price,
              note: it.note,
            ))
        .toList();

    await _isarService.saveOrder(CafeOrder(
      id: localId,
      orderCode: 'QR${order.orderNo}',
      orderType: OrderType.taiBan,
      tableId: table?.id,
      tableName: table?.name ?? order.tableName,
      customerName: order.customerName.isNotEmpty ? order.customerName : 'Khách lẻ',
      items: items,
      status: OrderStatus.dangPhucVu,
      note: order.customerNote,
      occupiedAt: order.createdAt,
      createdAt: order.createdAt,
      updatedAt: order.updatedAt,
    ));

    if (table != null && table.status == TableStatus.trong) {
      await _isarService.saveTable(table.copyWith(status: TableStatus.coKhach));
    }
  }

  @override
  Future<void> onLocalStatusChanged(QrRemoteOrder order, String newStatus) async {
    if (newStatus != 'CANCELLED') return;
    final localId = 'QR-${order.id}';
    final localOrder = _isarService.getOrderById(localId);
    if (localOrder == null || localOrder.status == OrderStatus.daHuy) return;

    CafeTable? table;
    if (localOrder.tableId != null) {
      for (final t in _isarService.getTables()) {
        if (t.id == localOrder.tableId) {
          table = t;
          break;
        }
      }
    }

    await _isarService.saveOrder(localOrder.copyWith(
      status: OrderStatus.daHuy,
      updatedAt: DateTime.now(),
    ));
    if (table != null && table.status == TableStatus.coKhach) {
      await _isarService.saveTable(table.copyWith(status: TableStatus.trong));
    }
  }

  @override
  Future<void> onAfterPoll() async {
    try {
      await onLocalRefresh?.call();
    } catch (_) {
      // Thất bại reload không ngăn chuỗi poll.
    }
  }
}
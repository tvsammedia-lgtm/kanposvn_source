import 'package:isar/isar.dart';
import '../../../core/sync/qr_catalog.dart';
import '../../../core/sync/qr_order_bridge.dart';
import '../models/restaurant_menu_item.dart';
import '../models/restaurant_order.dart';
import '../models/restaurant_table.dart';
import 'restaurant_isar_service.dart';

/// Cầu QR Order Online cho module Nhà hàng - Quán ăn.
///
/// - Publish: bàn (code = tableId) + món Isar  (category = chuỗi) lên web.
/// - Nhận đơn: tạo RestaurantOrder 'QR-' + cloud id gắn bàn theo mapping cloud uuid.
/// - Hủy đơn: xóa order 'QR-*' và trả bàn về Trống.
class RestaurantQrBridge extends QrOrderBridge {
  final RestaurantIsarService _isarService;
  final Future<void> Function()? onLocalRefresh;

  RestaurantQrBridge(this._isarService, {this.onLocalRefresh});

  @override
  String get appCode => 'kanposvnnhahangquanan';

  @override
  String get label => 'Nhà hàng - Quán ăn';

  @override
  String get defaultBranchName => 'Nhà hàng của tôi';

  @override
  String? get defaultBranchCode => null;

  @override
  Future<QrCatalogInput> buildCatalogInput() async {
    return _isarService.run((db) async {
      final tables = await db.restaurantTables.where().findAll();
      final menu = await db.restaurantMenuItems.where().findAll();
      final cats = <String>{for (final m in menu) if (m.category.isNotEmpty) m.category};
      final sortedCats = cats.toList()..sort();
      return QrCatalogInput(
        branchName: defaultBranchName,
        tables: tables
            .map((t) => QrTableDraft(
                  code: t.tableId,
                  name: t.name,
                  zone: t.zone,
                  capacity: t.capacity,
                ))
            .toList(),
        categories: [
          for (var i = 0; i < sortedCats.length; i++)
            QrCategoryDraft(name: sortedCats[i], sortOrder: i),
        ],
        items: menu
            .where((m) => m.name.isNotEmpty)
            .map((m) => QrItemDraft(
                  code: m.itemId,
                  name: m.name,
                  category: m.category,
                  price: m.price,
                  description: m.description,
                ))
            .toList(),
      );
    });
  }

  @override
  Future<void> persistRemoteOrder(QrRemoteOrder order) async {
    final existing = await _isarService.run((db) => db
        .restaurantOrders
        .where()
        .filter()
        .orderIdEqualTo('QR-${order.id}')
        .findFirst());
    if (existing != null) return;

    await _isarService.run((db) async {
      await db.writeTxn(() async {
        RestaurantTable? table;
        final localCode = remoteTableCode(order.cloudTableId);
        if (localCode != null) {
          table = await db.restaurantTables.where().filter().tableIdEqualTo(localCode).findFirst();
        }

        final rOrder = RestaurantOrder()
          ..orderId = 'QR-${order.id}'
          ..createdAt = order.createdAt
          ..updatedAt = order.updatedAt
          ..status = RestaurantOrderStatus.SERVING
          ..totalAmount = order.total
          ..customerName = order.customerName
          ..details = order.items
              .map((it) => RestaurantOrderDetail()
                ..detailId = 'QR${it.id}'
                ..itemId = it.menuItemId
                ..itemName = it.name
                ..price = it.price
                ..quantity = it.quantity
                ..note = it.note
                ..status = RestaurantOrderItemStatus.PENDING)
              .toList();

        if (table != null && table.status == RestaurantTableStatus.EMPTY) {
          table.status = RestaurantTableStatus.SERVING;
          await db.restaurantTables.put(table);
        }
        await db.restaurantOrders.put(rOrder);
        if (table != null) {
          rOrder.table.value = table;
          await rOrder.table.save();
        }
      });
    });
  }

  @override
  Future<void> onLocalStatusChanged(QrRemoteOrder order, String newStatus) async {
    if (newStatus != 'CANCELLED') return;
    await _isarService.run((db) async {
      final o = await db.restaurantOrders.where().filter().orderIdEqualTo('QR-${order.id}').findFirst();
      if (o == null || o.status == RestaurantOrderStatus.COMPLETED) return;
      if (!o.table.isAttached) return;
      await o.table.load();
      await db.writeTxn(() async {
        final t = o.table.value;
        if (t != null && t.status == RestaurantTableStatus.SERVING) {
          t.status = RestaurantTableStatus.EMPTY;
          await db.restaurantTables.put(t);
        }
        await db.restaurantOrders.delete(o.id);
      });
    });
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
/// Dữ liệu cho luồng QR Order Online: publish catalog lên web + đơn trả về.
/// Phần admin-web (kanposvn-admin.vercel.app) sinh bàn + QR token, lưu
/// menu_items/menu_categories; POS của module chỉ cần gửi catalog + nhận đơn.
library;

double _toDouble(Object? v) => (v is num) ? v.toDouble() : (double.tryParse('$v') ?? 0);

DateTime _toDate(Object? v) {
  if (v == null) return DateTime.now();
  return DateTime.tryParse('$v') ?? DateTime.now();
}

/// DRAFT để gửi lên server (upsert theo app_code + branch_id + code).
class QrTableDraft {
  final String code;
  final String name;
  final String zone;
  final int capacity;
  final bool active;

  QrTableDraft({
    required this.code,
    required this.name,
    this.zone = '',
    this.capacity = 4,
    this.active = true,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'zone': zone,
        'capacity': capacity,
        'active': active,
      };
}

class QrCategoryDraft {
  final String name;
  final int sortOrder;

  QrCategoryDraft({required this.name, this.sortOrder = 0});

  Map<String, dynamic> toJson() => {'name': name, 'sortOrder': sortOrder};
}

class QrItemDraft {
  final String code;
  final String name;
  final String category;
  final double price;
  final String description;
  final String kitchenStation;
  final String imageUrl;
  final bool active;

  QrItemDraft({
    required this.code,
    required this.name,
    this.category = '',
    this.price = 0,
    this.description = '',
    this.kitchenStation = 'KITCHEN',
    this.imageUrl = '',
    this.active = true,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'category': category,
        'price': price,
        'description': description,
        'kitchenStation': kitchenStation,
        'imageUrl': imageUrl,
        'active': active,
      };
}

class QrCatalogInput {
  final String branchName;
  final String? branchCode;
  final List<QrTableDraft> tables;
  final List<QrCategoryDraft> categories;
  final List<QrItemDraft> items;

  QrCatalogInput({
    required this.branchName,
    this.branchCode,
    this.tables = const [],
    this.categories = const [],
    this.items = const [],
  });
}

/// Kết quả publish: bàn + QR token + URL do server trả về.
class QrTableInfo {
  final String code;
  final String name;
  final String cloudId;
  final String qrToken;
  final String url;

  QrTableInfo({
    required this.code,
    this.name = '',
    required this.cloudId,
    required this.qrToken,
    required this.url,
  });

  factory QrTableInfo.fromJson(Map<String, dynamic> json) => QrTableInfo(
        code: (json['code'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        cloudId: (json['id'] ?? '').toString(),
        qrToken: (json['qrToken'] ?? '').toString(),
        url: (json['url'] ?? '').toString(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'name': name,
        'cloudId': cloudId,
        'qrToken': qrToken,
        'url': url,
      };
}

class QrPublishResult {
  final bool success;
  final String? branchId;
  final String branchName;
  final int tableCount;
  final int categoryCount;
  final int itemCount;
  final List<QrTableInfo> tables;

  QrPublishResult({
    required this.success,
    this.branchId,
    this.branchName = '',
    this.tableCount = 0,
    this.categoryCount = 0,
    this.itemCount = 0,
    this.tables = const [],
  });

  factory QrPublishResult.fromJson(Map<String, dynamic> json) => QrPublishResult(
        success: json['success'] == true,
        branchId: json['branchId']?.toString(),
        branchName: (json['branchName'] ?? '').toString(),
        tableCount: (json['tableCount'] as num?)?.toInt() ?? 0,
        categoryCount: (json['categoryCount'] as num?)?.toInt() ?? 0,
        itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
        tables: ((json['tables'] as List?) ?? [])
            .whereType<Map>()
            .map((e) => QrTableInfo.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );
}

/// Một dòng món trong đơn online trả về từ cloud.
class QrRemoteItem {
  final String id;
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;
  final String note;

  QrRemoteItem({
    required this.id,
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
    this.note = '',
  });

  factory QrRemoteItem.fromJson(Map<String, dynamic> json) => QrRemoteItem(
        id: (json['id'] ?? '').toString(),
        menuItemId: (json['menu_item_id'] ?? '').toString(),
        name: (json['item_name_snapshot'] ?? json['name'] ?? '').toString(),
        price: _toDouble(json['unit_price_snapshot'] ?? json['price']),
        quantity: (json['quantity'] as num?)?.toInt() ?? 1,
        note: (json['note'] ?? '').toString(),
      );
}

/// Đơn online mà khách web gửi lên, trả về bởi GET /api/sync/orders.
class QrRemoteOrder {
  final String id;
  final String orderNo;
  final String cloudTableId;
  final String tableCode;
  final String tableName;
  final String status;
  final double subtotal;
  final double total;
  final String customerName;
  final String customerNote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String updatedAtIso;
  final List<QrRemoteItem> items;

  QrRemoteOrder({
    required this.id,
    required this.orderNo,
    required this.cloudTableId,
    this.tableCode = '',
    this.tableName = '',
    this.status = 'NEW',
    this.subtotal = 0,
    this.total = 0,
    this.customerName = '',
    this.customerNote = '',
    required this.createdAt,
    required this.updatedAt,
    required this.updatedAtIso,
    this.items = const [],
  });

  String get itemsText =>
      items.map((i) => '${i.name} x${i.quantity}').join(', ');

  factory QrRemoteOrder.fromJson(Map<String, dynamic> json) => QrRemoteOrder(
        id: (json['id'] ?? '').toString(),
        orderNo: (json['order_no'] ?? '').toString(),
        cloudTableId: (json['table_id'] ?? '').toString(),
        tableCode: (json['table_code'] ?? '').toString(),
        tableName: (json['table_name'] ?? '').toString(),
        status: (json['status'] ?? 'NEW').toString(),
        subtotal: _toDouble(json['subtotal']),
        total: _toDouble(json['total']),
        customerName: (json['customer_name'] ?? '').toString(),
        customerNote: (json['customer_note'] ?? '').toString(),
        createdAt: _toDate(json['created_at']),
        updatedAt: _toDate(json['updated_at']),
        updatedAtIso: (json['updated_at'] ?? '').toString(),
        items: ((json['items'] as List?) ?? [])
            .whereType<Map>()
            .map((e) => QrRemoteItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_no': orderNo,
        'table_id': cloudTableId,
        'table_code': tableCode,
        'table_name': tableName,
        'status': status,
        'subtotal': subtotal,
        'total': total,
        'customer_name': customerName,
        'customer_note': customerNote,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'items': items
            .map((i) => {
                  'id': i.id,
                  'menu_item_id': i.menuItemId,
                  'item_name_snapshot': i.name,
                  'unit_price_snapshot': i.price,
                  'quantity': i.quantity,
                  'note': i.note,
                })
            .toList(),
      };

  QrRemoteOrder copyWith({String? status}) => QrRemoteOrder(
        id: id,
        orderNo: orderNo,
        cloudTableId: cloudTableId,
        tableCode: tableCode,
        tableName: tableName,
        status: status ?? this.status,
        subtotal: subtotal,
        total: total,
        customerName: customerName,
        customerNote: customerNote,
        createdAt: createdAt,
        updatedAt: updatedAt,
        updatedAtIso: updatedAtIso,
        items: items,
      );
}